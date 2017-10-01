
//==========================================================================

// строка - что можно украсть и насколько трудно
func string C_Dialog_Pickpocket(var string what, var int difficulty)
{
	var string Result;
	Result = ConcatStrings(what, " (");
	if (difficulty <= 20)
	{
		Result = ConcatStrings(Result, DIA_Difficulty_Easiest);
	}
	else if (difficulty <= 40)
	{
		Result = ConcatStrings(Result, DIA_Difficulty_Easy);
	}
	else if (difficulty <= 60)
	{
		Result = ConcatStrings(Result, DIA_Difficulty_Risky);
	}
	else if (difficulty <= 80)
	{
		Result = ConcatStrings(Result, DIA_Difficulty_Hard);
	}
	else if (difficulty <= 100)
	{
		Result = ConcatStrings(Result, DIA_Difficulty_VeryHard);
	}
	else
	{
		Result = ConcatStrings(Result, DIA_Difficulty_Impossible);
	};
	Result = ConcatStrings(Result, ")");
	return Result;
};

//==========================================================================

// кража не удалась
func void B_Pickpocket_Failed(var C_NPC npc, var C_NPC thief)
{
	HERO_ACTION_Pickpocket = PICKPOCKET_Fail;	// отметить, что провалились
	B_ResetThiefLevel();	// сбросить мастерство вора
	Npc_ClearAIQueue(npc);	// бросить все дела
	AI_StopProcessInfos(npc);	// закончить разговор
	B_Attack(npc,thief,AR_Theft,1);	//напасть на вора с задержкой
};

// удалось ли украсть
func int C_Pickpocket_Success()
{
	// если есть внешняя причина провала, то уже точно не удалось
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Fail)
	{
		B_Pickpocket_Failed(self, other);
		return FALSE;
	};
	// проверить ловкость
	var int DexNeeded;
	DexNeeded = self.aivar[AIV_TheftDex] + C_Random(11) - 5;
	// при краже во сне скорректировать требования (приблизить к 50 для всех)
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Sleep)
	{
		DexNeeded = (DexNeeded + 50) / 2;
	};
	// если достаточно ловкости
	if(other.attribute[ATR_DEXTERITY] >= DexNeeded)
	{
		// удалось
		self.aivar[AIV_PlayerHasPickedMyPocket] += 1;	// число краж
		self.aivar[AIV_TheftDex] += 20;	// повышаются требования к ловкости для следующей кражи
		B_GiveThiefXP();	// опыт за кражу
		return TRUE;
	};
	// иначе - мало ловкости
	B_Pickpocket_Failed(self, other);	// провал
	return FALSE;
};

// КРАЖА ВО СНЕ =============================================================

instance DIA_PICKPOCKET_Sleep(C_Info)
{
	nr = 0;
	condition = DIA_PICKPOCKET_Sleep_Condition;
	information = DIA_PICKPOCKET_Sleep_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_PICKPOCKET_Sleep_Condition()
{
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Sleep_Pre)
	{
		return TRUE;
	};
};

func void DIA_PICKPOCKET_Sleep_Info()
{
	Info_ClearChoices(DIA_PICKPOCKET_Sleep);
	// ничего не делать
	Info_AddChoice(DIA_PICKPOCKET_Sleep, "Уйти (КОНЕЦ)", DIA_PICKPOCKET_Sleep_End);
	// разбудить
	Info_AddChoice(DIA_PICKPOCKET_Sleep, "Разбудить (КОНЕЦ)", DIA_PICKPOCKET_Sleep_Wake);
	/* OBSOLETE если уже крали - больше нельзя
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		PrintScreen(DIA_Pickpocket_Nothing, -1, YPOS_InInventory + 2, FONT_ScreenSmall, 2);
		return;
	};//*/
	// если не в состоянии (мало ловкости, одержим) - отказаться
	if ((other.attribute[ATR_DEXTERITY] < (self.aivar[AIV_TheftDex] - Theftdiff))
		|| (NpcObsessedByDMT == TRUE))
	{
		PrintNotNow();
		return;
	};
	// обобрать
	Info_AddChoice(DIA_PICKPOCKET_Sleep, "Кража", DIA_PICKPOCKET_Sleep_List);
	
};

func void DIA_PICKPOCKET_Sleep_List()
{
	// приступили к краже
	HERO_ACTION_Pickpocket = PICKPOCKET_Sleep;
	
	Info_ClearChoices(DIA_PICKPOCKET_Sleep);
	// ничего не делать
	Info_AddChoice(DIA_PICKPOCKET_Sleep, Dialog_Ende, DIA_PICKPOCKET_Sleep_End);
	
	// ОБЩЕЕ --------------------------------------------
	// золото
	if (Npc_HasItems(self, ItMi_Gold) > 0)
	{
		Info_AddChoice(DIA_PICKPOCKET_Sleep, C_Dialog_Pickpocket(DIA_Pickpocket_Gold, self.aivar[AIV_TheftDex]), DIA_PICKPOCKET_DoIt_Gold);
	};
	// кошелек
	if ((Npc_HasItems(self, ItMi_Pocket) > 0) || (Npc_HasItems(self, ItSe_GoldPocket25) > 0)
		|| (Npc_HasItems(self, ItSe_GoldPocket50) > 0) || (Npc_HasItems(self, ItSe_GoldPocket100) > 0))
	{
		Info_AddChoice(DIA_PICKPOCKET_Sleep, C_Dialog_Pickpocket(DIA_Pickpocket_Pocket, self.aivar[AIV_TheftDex]), DIA_PICKPOCKET_DoIt_Pocket);
	};
	// кольцо
	if ((Npc_HasItems(self, ItMi_GoldRing) > 0) || (Npc_HasItems(self, ItMi_SilverRing) > 0))
	{
		Info_AddChoice(DIA_PICKPOCKET_Sleep, C_Dialog_Pickpocket(DIA_Pickpocket_Ring, self.aivar[AIV_TheftDex]), DIA_PICKPOCKET_DoIt_Ring);
	};
	// руда
	if (Npc_HasItems(self, ItMi_Nugget) >= 1)
	{
		Info_AddChoice(DIA_PICKPOCKET_Sleep, C_Dialog_Pickpocket(DIA_Pickpocket_Nugget, self.aivar[AIV_TheftDex]), DIA_PICKPOCKET_DoIt_Nugget);
	};
	
	// ОСОБОЕ -------------------------------------------

	
	// КЛЮЧИ ---------------------------------------------

};

func void DIA_PICKPOCKET_Sleep_End()
{
	// если ГГ провалился по внешней причине
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Fail)
	{
		B_Pickpocket_Failed(self,other);	// соответствующие действия
	}
	else	// иначе - просто уйти
	{
		AI_StopProcessInfos(self);
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};

func void DIA_PICKPOCKET_Sleep_Wake()
{
	// если ГГ провалился по внешней причине
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Fail)
	{
		B_Pickpocket_Failed(self,other);	// соответствующие действия
	}
	else	// иначе - разбудить
	{
		Npc_ClearAIQueue(self);
		AI_StopProcessInfos(self);
		if(C_BodyStateContains(self,BS_LIE))
		{
			AI_UseMob(self,"BEDHIGH",-1);
		};
		AI_StartState(self,ZS_ObservePlayer,0,"");
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};

func void DIA_PICKPOCKET_DoIt_Gold()
{
	if (C_Pickpocket_Success())
	{
		AI_StopProcessInfos(self);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self, ItMi_Gold));
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};

func void DIA_PICKPOCKET_DoIt_Pocket()
{
	if (C_Pickpocket_Success())
	{
		AI_StopProcessInfos(self);
		if (Npc_HasItems(self, ItSe_GoldPocket100) > 0)
		{
			B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
		}
		else if (Npc_HasItems(self, ItSe_GoldPocket50) > 0)
		{
			B_GiveInvItems(self,other,ItSe_GoldPocket50,1);
		}
		else if (Npc_HasItems(self, ItSe_GoldPocket25) > 0)
		{
			B_GiveInvItems(self,other,ItSe_GoldPocket25,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Pocket,1);
		};
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};

func void DIA_PICKPOCKET_DoIt_Ring()
{
	if (C_Pickpocket_Success())
	{
		AI_StopProcessInfos(self);
		if (Npc_HasItems(self, ItMi_GoldRing) > 0)
		{
			B_GiveInvItems(self,other,ItMi_GoldRing,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_SilverRing,1);
		};
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};

func void DIA_PICKPOCKET_DoIt_Nugget()
{
	if (C_Pickpocket_Success())
	{
		AI_StopProcessInfos(self);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};
	HERO_ACTION_Pickpocket = PICKPOCKET_None;
};


//==========================================================================	

// способен ли ГГ совершить кражу во сне
// TRUE - способен, жертва не проснется
// FALSE - не способен, жертва проснется
func int C_Can_PICKPOCKET_Sleep(var C_NPC npc, var C_NPC thief)
{
	// обучен ли
	if(HasFlags(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET), 2))
	{
		return TRUE;
	};
	return FALSE;
};

// попытаться украсть
func void B_Start_PICKPOCKET_Sleep(var C_NPC npc, var C_NPC thief)
{
	HERO_ACTION_Pickpocket = PICKPOCKET_Sleep_Pre;
	HERO_ACTION_Pickpocket_Victim = Hlp_GetInstanceID(npc);
	DIA_PICKPOCKET_Sleep.npc = HERO_ACTION_Pickpocket_Victim;
	AI_ProcessInfos(npc);
};
