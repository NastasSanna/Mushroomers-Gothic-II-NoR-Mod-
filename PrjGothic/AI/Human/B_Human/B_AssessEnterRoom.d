/**************************************************************************

						ВОСПРИЯТИЕ ВХОДА В ПОМЕЩЕНИЕ
 
  Персонаж self (я) заметил, что other (он) зшел в помещение (область).
  
  Функции:
  
  B_AssessEnterRoom() возвращает TRUE, если я обратил на это внимание,
FALSE, если мне все равно. Вызывается в B_AssessPortalCollision
и др. скриптах.

  Непосредственно для обработки восприятия PERC_ASSESSENTERROOM вызывается 
B_AssessPortalCollision(), которая выполняет дополнительные проверки, если
B_AssessEnterRoom вернула FALSE. Учитывает, из чьего помещения ГГ вышел.

  Обычное поведение: следить за вошедшим ГГ или выгнать его, на остальных
не реагировать.

***************************************************************************/

func int B_AssessEnterRoom()
{
	//внутренние переменные
	var int portalguild;	//гильдия, которой пренадлежит помещение
	portalguild = C_GetPlayerPortalGuild();
	
	//Сброс AIVARS ---------------------------------------------------------
	
	// если зашел ГГ, и его приход уже прокомментировали, и помещение чье-то
	if(Npc_IsPlayer(other) && (Player_LeftRoomComment == TRUE)
		&& (portalguild > GIL_NONE) && (portalguild < GIL_PUBLIC))
	{
		Player_LeftRoomComment = FALSE; // можно опять прокомментировать //NS: до ГГ не дошло
	};
	
	//НЕ обращать внимания, если -------------------------------------------
	
	// он дальше 10м
	if(Npc_GetDistToNpc(self,other) > 1000)
	{
		return FALSE;
	};
	
	// мы в разных помещениях, и я не на улице
	if(!Npc_IsInPlayersRoom(self) && (C_GetNpcPortalGuild(self) > GIL_OUTDOOR))
	{
		return FALSE;
	};
	
	// я сражаюсь
	if(Npc_IsInState(self,ZS_Attack))
	{
		return FALSE;
	};
	
	// я охраняю ворота
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	
	// он не ГГ
	if(!Npc_IsPlayer(other))
	{
		return FALSE;
	};
	
	// он = ГГ -----v
	
	// мы друзья, лично или по гильдии
	if ((self.npcType == NPCTYPE_FRIEND)
		|| (C_NpcGetAttitude(self,other) == ATT_FRIENDLY))
	{
		return FALSE;
	};
	
	// он крадется или стоит
	if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
	{
		// но я его не вижу и не слежу за ним
		if(!Npc_CanSeeNpc(self,other) && !Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE;
		};
	};
	
	// у меня нет гильдии
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	
	// мы в разных комнатах и я сплю
	if(!Npc_IsInPlayersRoom(self) && Npc_IsInState(self,ZS_Sleep))
	{
		return FALSE;
	};
	
	// В остальных случаях ----------------------------------------------------
	
	// мы оба в общественном помещении
	if((portalguild == GIL_PUBLIC) && Npc_IsInPlayersRoom(self))
	{ // нужно ли следить за ГГ
		
		// если я уже слежу за ним (за ГГ)
		if(Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE; // не реагировать
		};
		
		// ТЕСТ кто конкретный владелец?
		var C_NPC owner;
		owner = Wld_GetPlayerPortalOwner();
		if (Hlp_IsValidNpc(owner))	{
			//не я - не мои проблемы
			if (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(owner))	{
				return FALSE; // не реагировать
			};
			//владелец - друг ГГ
			if (owner.npcType == NPCTYPE_FRIEND)	{
				return FALSE; // не реагировать
			};
		};
		
		// если я лежу
		if(C_BodyStateContains(self,BS_LIE))
		{
			B_MM_DeSynchronize(); //рассинхронизация - подождать немного, прежде чем вставать
		};
		
		// если я занят обычным делом
		if(Npc_IsInState(self,ZS_Potion_Alchemy)				//варю зелье
			|| Npc_IsInState(self,ZS_Read_Bookstand)			//или читаю
			|| Npc_IsInState(self,ZS_Sit_Bench)					//или сижу на лавке
			|| Npc_IsInState(self,ZS_Sit_Campfire)				//или сижу у огня
			|| Npc_IsInState(self,ZS_Sit_Chair)					//или сижу на стуле
			|| Npc_IsInState(self,ZS_Sit_Throne)				//или сижу в кресле
			|| Npc_IsInState(self,ZS_Sleep)						//или сплю
			|| Npc_IsInState(self,ZS_Smalltalk)					//или болтаю с кем-то
			|| Npc_IsInState(self,ZS_Smoke_Joint)				//или курю косяк
			|| Npc_IsInState(self,ZS_Stand_ArmsCrossed)			//или стою, скрестив руки
			|| Npc_IsInState(self,ZS_Stand_Drinking)			//или пью
			|| Npc_IsInState(self,ZS_Stand_Eating)				//или ем
			|| Npc_IsInState(self,ZS_Stand_Guarding)			//или охраняю
			|| Npc_IsInState(self,ZS_Stand_WP))					//или просто стою, где надо
		{
			// сбросить другие действия и восприятия
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			
			// если я сижу
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_StartState(self,ZS_ObservePlayer,0,""); //немедленно начать следить за ГГ
			}
			// иначе - НЕ сижу
			else
			{
				AI_StartState(self,ZS_ObservePlayer,1,""); //закончить текущее действие, а потом начать следить за ГГ
			};
			return TRUE;
		}
		// если я не занят, или занят чем-то другим, более важным
		else
		{
			return FALSE; // не реагировать
		};
	};
		
	// если меня касается, что ГГ зашел в помещение данной гильдии (она моя или дружественная)
	if(C_NpcIsBotheredByPlayerRoomGuild(self))
	{
		// сбросить другие действия и восприятия
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		// велеть ГГ выметаться
		AI_StartState(self,ZS_ClearRoom,1,"");
		return TRUE;
	};
	
	// во всех остальных случаях
	
	return FALSE; // не реагировать
};



// ======================================================================

func void B_AssessPortalCollision()
{
	//внутренние переменные
	var int formerportalguild;//из чьего помещения вышел ГГ
	formerportalguild = C_GetFormerPlayerPortalGuild();
	
	// ничего не делать, если -----v
	
	// сработала обычная реакция
	if(B_AssessEnterRoom())
	{
		return;
	};
	
	// я не могу видеть его, а он крадется или стоит
	if(!Npc_CanSeeNpc(self,other) && (C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND)))
	{
		return;
	}; 
		
	// если кто-то требует освободить помещение
	Npc_PerceiveAll(self);
	if(Wld_DetectNpcEx(self,-1,ZS_ClearRoom,-1,FALSE))
	{
		return;
	};
	//-----^
	
	// если он пришел из помещения моей или дружественной гильдии
	if((self.guild == formerportalguild) || (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
	{
		/* DEBUG INFO
		PrintSelf("He left my room.");
		//*/
		
		//ничего не делать, если -----v
		
		// мы друзья
		if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
			|| (Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND)))
		{
			return; 
		};
		
		//или у меня нет гильдии
		if(self.guild == GIL_NONE)
		{
			return;
		};
		if (C_NpcIs(self,OUT_1210_Grimbald) && !self.aivar[AIV_TalkedToPlayer])	{
			AI_StartState(self,ZS_AimTo,1,"");
			return;
		};
		//-----^
		
		//если ГГ вышел из помещения ополчения или наемников
		if((formerportalguild == GIL_MIL) || (formerportalguild == GIL_SLD))
		{
			//напасть по соответствующией причине
			B_Attack(self,other,AR_LeftPortalRoom,0); 
			return;
		}
		// если вышел из помещения другой гильдии
		else
		{
			//отметить, что ГГ покинул комнату
			self.aivar[AIV_SeenLeftRoom] = TRUE;
			//сбросить другие действия и восприятия
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			//перейти к наблюдению за игроком
			AI_StartState(self,ZS_ObservePlayer,0,"");
			return;
		};
	};
};


