
// ===============================================================

instance PC_FireCamp_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_FireCamp_Condition;
	information = PC_FireCamp_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_FireCamp_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_FireCamp)
	{
		return TRUE;
	};
};

func void PC_FireCamp_EXIT_Info()
{
	b_endproductiondialog();
};

// ===============================================================

instance PC_FireCamp_Cook(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_FireCamp_Condition;
	information = PC_FireCamp_Cook_Info;
	permanent = TRUE;
	description = "Жарить мясо";
};

func void PC_FireCamp_Cook_Info()
{
	if (Npc_HasItems(self, ItMi_Pan) == 0)
	{
		PrintOnMob(PRINT_MissingPan);
		return;
	};
	if (Npc_HasItems(self, ItFoMuttonRaw) == 0)
	{
		PrintOnMob(PRINT_MissingMuttonRaw);
		return;
	};
/*	AI_UseMob(self, "CAMPFIRE", -1);
	AI_PlayAni(self, "T_COOKFIRECAMP_STAND_2_S0");
	AI_Wait(self, 0.5);
	AI_PlayAni(self, "T_COOKFIRECAMP_S0_2_S1");
	AI_Wait(self, 3);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,1);
	CreateInvItems(self,ItFoMutton,1);
	AI_PlayAni(self, "T_COOKFIRECAMP_S1_2_S0");
	AI_PlayAni(self, "T_COOKFIRECAMP_S0_2_STAND");
	AI_UseMob(self, "CAMPFIRE",1);
	*/
	Info_ClearChoices(PC_FireCamp_Cook);
	Info_AddChoice(PC_FireCamp_Cook, "1 кусок", PC_FireCamp_Cook_1);
	var int cnt; cnt = Npc_HasItems(self, ItFoMuttonRaw);
	if (cnt > 10)	{
		Info_AddChoice(PC_FireCamp_Cook, "10 кусков", PC_FireCamp_Cook_10);
	};
	if (cnt > 1)	{
		Info_AddChoice(PC_FireCamp_Cook, CS3("все (", IntToString(cnt), " шт.)"), PC_FireCamp_Cook_All);
	};
};

func void PC_FireCamp_Cook_DoIt(var float timesec, var int MuttonCount)
{
	//достаем сковородку
	AI_UseMob(self, "CAMPFIRE", -1);
	CreateInvItems(self,ItMi_PanFull,1);
	AI_UseItemToState(self, ItMi_PanFull, 1);
	//жарим
	Npc_RemoveInvItems(self,ItFoMuttonRaw,MuttonCount);
	AI_Wait(self, timesec);
	CreateInvItems(self,ItFoMutton,MuttonCount);
	//убираем сковородку
	AI_UseItemToState(self, ItMi_PanFull, -1);
	AI_UseMob(self, "CAMPFIRE",1);
	if (MuttonCount > 10)	{
		AI_PrintScreen(PRINT_SomeTimeLater,-1,25,FONT_Screen,3);
		var int time;	time = 2 * MuttonCount + Hlp_Random(5);
		B_SetTimePlus(0, time);
	};
	if (Npc_HasItems(self, ItFoMuttonRaw) > 0)	{
		PC_FireCamp_Cook_Info();
	}
	else	{
		Info_ClearChoices(PC_FireCamp_Cook);
	};
};

func void PC_FireCamp_Cook_1()
{
	PC_FireCamp_Cook_DoIt(0.8, 1);	
};

func void PC_FireCamp_Cook_10()
{
	PC_FireCamp_Cook_DoIt(1.2, 10);	
};

func void PC_FireCamp_Cook_All()
{
	PC_FireCamp_Cook_DoIt(2.0, Npc_HasItems(self, ItFoMuttonRaw));	
};

// ===============================================================

instance PC_FireCamp_Sleep(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_FireCamp_Condition;
	information = PC_FireCamp_Sleep_Info;
	permanent = TRUE;
	description = "Спать";
};

func void PC_FireCamp_Sleep_Info()
{
	HERO_SleepGround = TRUE;
	AI_UseMob(self, "CAMPFIRE", -1);
//	AI_PlayAni(self, "T_JUMPB");
//	AI_UnequipWeapons(self);
	AI_PlayAniBS(self, "T_STAND_2_SLEEPFIRECAMP", BS_LIE);
	SleepABit_s1();
	if(SC_IsObsessed == TRUE)
	{
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
};

// ====================================================

instance PC_FireCamp_Sit(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_FireCamp_Condition;
	information = PC_FireCamp_Sit_Info;
	permanent = TRUE;
	description = "Посидеть у костра";
};


func void PC_FireCamp_Sit_Info()
{
	AI_UseMob(self, "CAMPFIRE", -1);
	AI_Dodge(self);
	AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	Info_ClearChoices(PC_FireCamp_Sit);
	Info_AddChoice(PC_FireCamp_Sit, Dialog_Ende, PC_FireCamp_Sit_StandUp);
	Info_AddChoice(PC_FireCamp_Sit, "3 часа", PC_FireCamp_Sit_3h);
	Info_AddChoice(PC_FireCamp_Sit, "2 часа", PC_FireCamp_Sit_2h);
	Info_AddChoice(PC_FireCamp_Sit, "1 час", PC_FireCamp_Sit_1h);
	Info_AddChoice(PC_FireCamp_Sit, "полчаса", PC_FireCamp_Sit_Halfh);
};

func void PC_FireCamp_Sit_StandUp()
{
	b_endproductiondialog();
	Info_ClearChoices(PC_FireCamp_Sit);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
};
func void PC_FireCamp_Sit_SpendTime(var int h, var int m)
{
	b_endproductiondialog();
//	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	AI_Wait(self, 1.0);
	B_SetTimePlus(h, m);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};
func void PC_FireCamp_Sit_Halfh()
{
	PC_FireCamp_Sit_SpendTime(0, 30);
};

func void PC_FireCamp_Sit_1h()
{
	PC_FireCamp_Sit_SpendTime(1, 0);
};

func void PC_FireCamp_Sit_2h()
{
	PC_FireCamp_Sit_SpendTime(2, 0);
};

func void PC_FireCamp_Sit_3h()
{
	PC_FireCamp_Sit_SpendTime(3, 0);
};


// ====================================================

instance PC_FireCamp_Coal(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_FireCamp_Coal_Condition;
	information = PC_FireCamp_Coal_Info;
	description = "Взять уголь";
};
func int PC_FireCamp_Coal_Condition()
{
	if (PC_FireCamp_Condition()
		&& Npc_HasItems(self,ItWr_Clayplate_Numbers) && !Clayplate_Numbers_BlackBack)	{
		return TRUE;
	};
};
func void PC_FireCamp_Coal_Info()
{
	CreateInvItem(self,ItMi_Coal);
};

// ====================================================

func int canusefirecamp()
{
	return TRUE;
};

func void usefirecamp_s1()
{
	if (Npc_IsPlayer(self))
	{
		PC_FireCamp_EXIT.npc = Hlp_GetInstanceID(self);
		PC_FireCamp_Cook.npc = Hlp_GetInstanceID(self);
		PC_FireCamp_Sleep.npc = Hlp_GetInstanceID(self);
		PC_FireCamp_Sit.npc = Hlp_GetInstanceID(self);
		PC_FireCamp_Coal.npc = Hlp_GetInstanceID(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_FireCamp;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(self);
	};
};
