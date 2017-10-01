/**************************************************************************

							ВАРКА В КОТЛЕ
   
  Нужна ложка.
  
  Готовить нельзя. Охотники используют для вываривания трофеев.

***************************************************************************/

// ====================================================

instance PC_CauldronHunter_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_CauldronHunter_EXIT_Condition;
	information = PC_CauldronHunter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_CauldronHunter_EXIT_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_CauldronHunter)
	{
		return TRUE;
	};
};

func void PC_CauldronHunter_EXIT_Info()
{
	b_endproductiondialog();
};

// ===============================================================

instance PC_CauldronHunter_BoilJaw(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_CauldronHunter_BoilJaw_Condition;
	information = PC_CauldronHunter_BoilJaw_Info;
	permanent = TRUE;
	description = "Варить челюсти кабана (1,5 часа).";
};


func int PC_CauldronHunter_BoilJaw_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_CauldronHunter)
		&& (Npc_HasItems(self,ItAt_KeilerJawRaw) || Npc_HasItems(self,ItAt_KeilerHogJawRaw)))
	{
		return TRUE;
	};
};

func void PC_CauldronHunter_BoilJaw_Info()
{
	var int cnt1;	cnt1 = Npc_HasItems(self, ItAt_KeilerJawRaw);
	var int cnt2;	cnt2 = Npc_HasItems(self, ItAt_KeilerHogJawRaw);
	if (cnt1 > 0)	{
		Npc_RemoveInvItems(self,ItAt_KeilerJawRaw,cnt1);
		CreateInvItems(self,ItAt_KeilerJaw,cnt1);
	};
	if (cnt2 > 0)	{
		Npc_RemoveInvItems(self,ItAt_KeilerHogJawRaw,cnt2);
		CreateInvItems(self,ItAt_KeilerHogJaw,cnt2);
	};
	B_SetTimePlus(1,30 + Hlp_Random(10));
	PrintScreen(PRINT_Ready,-1,-1,FONT_Screen,2); 
	b_endproductiondialog();
};



// ====================================================

func int canuse_cauldronhunter()
{
	if (Npc_IsPlayer(self))
	{
		if (!C_HeroIs_Talbin())
		{
			PrintOnMob(PRINT_DontNeedThis);
			return FALSE;
		};
		//if (Npc_HasItems(self, ItMi_Scoop) == 0) проверка в UseWithItem => ложки уже нету
		//{
		//	PrintOnMob(PRINT_MissingScoop);
		//	return FALSE;
		//};
	};
	return TRUE;
};

func void cauldronhunter_s1()
{
	if (Npc_IsPlayer(self))
	{
		PC_CauldronHunter_EXIT.npc = Hlp_GetInstanceID(self);
		PC_CauldronHunter_BoilJaw.npc = Hlp_GetInstanceID(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_CauldronHunter;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(self);
	};
};
