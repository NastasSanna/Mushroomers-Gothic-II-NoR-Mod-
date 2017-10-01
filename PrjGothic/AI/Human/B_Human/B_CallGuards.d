/**************************************************************************

							ПОЗВАТЬ СТРАЖУ

  B_CallGuards	()
  Персонаж self (я) зовет на помощь стражу из-за действий other (он). 
Вызывается только в ZS_Attack, поэтому причина вызова стражи = причине 
нападения AIV_ATTACKREASON.
 
  C_WantToCallGuards	(slf) 
  Проверяет, а будет ли персонаж slf звать стражу. Вызывается только 
в B_CallGuards.
  
  Стражу зовут паладины, ополченцы, горожане, наемники, крестьяне, если
только они не в команде с ГГ.
  Если C_WantToCallGuards вернула TRUE, это еще не значит, что персонаж 
точно позовет стражу (необходимое, но не достаточное условие). Крутые парни
не зовут стражу.
  Если стража вызвана, необходимо сообщить окружающим о шуме сражения.
  Сами стражники при этом орут "Тревога!", а все прочие "Стража!".

  
***************************************************************************/

// проверка вызова стражи
func int C_WantToCallGuards(var C_Npc slf)
{
	// позвать стражу если
	// я не в команде ГГ
	if(slf.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		// и я 
		if((slf.guild == GIL_PAL)		// паладин
			|| (slf.guild == GIL_MIL)	// ополченец
			|| (slf.guild == GIL_VLK)	// горожанин
			|| (slf.guild == GIL_SLD)	// наемник
			|| (slf.guild == GIL_BAU) || (slf.guild == GIL_BAU2))	// крестьянин
		{
			return TRUE;
		};
	};
	// в остальных случаях - не хочу звать стражу (но, может, буду)
	return FALSE;
};

// ========================================================================
func void B_SayAlarm()
{
	if((self.guild == GIL_PAL)		// паладин
		|| (self.guild == GIL_MIL)	// ополченец
		|| (self.guild == GIL_VLK)	// горожанин
		|| (self.guild == GIL_SLD)	// наемник
		)
	{
		B_Say_Overlay(self,other,"$ALARM");
	}
	else {
		B_Say_Overlay(self,other,"$HELP");
	};
};
func void B_SayGuards()
{
	if((self.guild == GIL_PAL)		// паладин
		|| (self.guild == GIL_MIL)	// ополченец
		|| (self.guild == GIL_VLK)	// горожанин
		|| (self.guild == GIL_SLD)	// наемник
		)
	{
		B_Say_Overlay(self,other,"$GUARDS");
	}
	else {
		B_Say_Overlay(self,other,"$HELP");
	};
};


// вызов стражи
func void B_CallGuards()
{
	
	// проверить, надо ли мне звать стражу
	if(!C_WantToCallGuards(self))
	{
		return;
	};
	
	// надо вызвать стражу -----v
	
	// если я сам - вызванный на помощь стражник
	if((self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)		// чтобы убить
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)		// или чтобы прекратить драку
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)	// или чтобы поймать вора
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))	// или чтоыб выгнать незваного гостя
	{
		// начать орать "Тревога!"
		B_SayAlarm();
		return; //больше ничего не делать
	};
	
	// ПО ПРИЧИНАМ ВЫЗОВА -------------------------------------------------
	
	// вражеская гильдия или убийство
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
		|| (self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman))
	{ // то
		// если я - ополченец, паладин или наемник (т.е. сам стражник)
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			// начать орать "Тревога!"
			B_SayAlarm();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		}
		else // для других гильдий
		// если я не крутой
		if(!C_NpcIsToughGuy(self))
		{
			// начать орать "Стража!"
			B_SayGuards();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //больше ничего не делать
	};
	
	// вторжение в закрытую зону
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		// начать орать "Тревога!"
		B_SayAlarm();
		// все должны услышать шум драки
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return; //больше ничего не делать
	};
	
	// кража или ее попытка (ГГ влез в чей-то сундук)
	if((self.aivar[AIV_ATTACKREASON] == AR_Theft) || (self.aivar[AIV_ATTACKREASON] == AR_UseMob))
	{
		// и я не крутой парень
		if(!C_NpcIsToughGuy(self))
		{
			// начать орать "Стража!"
			B_SayGuards();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //больше ничего не делать
	};
	
	// угроза оружием
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		// и я не крутой парень
		if(!C_NpcIsToughGuy(self))
		{
			// начать орать "Стража!"
			B_SayGuards();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //больше ничего не делать
	};
	
	// нужно выставить незваного гостя
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		// если я - ополченец, паладин или наемник (т.е. сам стражник)
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			// начать орать "Тревога!"
			B_SayAlarm();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		}
		else // для других гильдий
		// если я не крутой
		if(!C_NpcIsToughGuy(self))
		{
			// начать орать "Стража!"
			B_SayGuards();
			// все должны услышать шум драки
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //больше ничего не делать
	};
};

