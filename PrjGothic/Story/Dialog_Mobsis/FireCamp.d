
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
	description = "∆арить м€со";
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
	Info_ClearChoices(PC_FireCamp_Cook);
	var int cnt;
	cnt = Npc_HasItems(self, ItFoMuttonRaw);
	Info_AddChoice(PC_FireCamp_Cook, Dialog_Back, PC_Stove_Cook_Back);
	if (cnt > 1)
	{
		Info_AddChoice(PC_FireCamp_Cook,"...1 кусок (2 минуты)",PC_Stove_Cook_Meat_1);
	};
	if (cnt > 5)
	{
		Info_AddChoice(PC_FireCamp_Cook,"...5 кусков (10 минут)",PC_Stove_Cook_Meat_5);
	};
	if (cnt > 10)
	{
		Info_AddChoice(PC_FireCamp_Cook,"...10 кусков (20 минут)",PC_Stove_Cook_Meat_10);
	};
	if (cnt > 20)
	{
		Info_AddChoice(PC_FireCamp_Cook,"...20 кусков (40 минут)",PC_Stove_Cook_Meat_20);
	};
	if (cnt > 1)
	{
		var string str_cnt; str_cnt = IntToString(cnt);
		var string str_time; str_time = IntToString(2 * cnt);
		Info_AddChoice(PC_FireCamp_Cook,CS5("...все (", str_cnt," шт., ",str_time," мин.)"),PC_Stove_Cook_Meat_All);
	};
};

func void PC_FireCamp_Cook_DoIt(var float timesec, var int MuttonCount)
{
	//достаем сковородку
	AI_UseMob(self, "CAMPFIRE", -1);
	CreateInvItems(self,ItMi_PanFull,1);
	AI_UseItemToState(self, ItMi_PanFull, 1);
	//жарим
	Cook_Meat_DoCook(MuttonCount);
	//убираем сковородку
	AI_UseItemToState(self, ItMi_PanFull, -1);
	AI_UseMob(self, "CAMPFIRE",1);
	//есть еще м€со дл€ жарки?
	if (Npc_HasItems(self, ItFoMuttonRaw) > 0)	{
		PC_FireCamp_Cook_Info();
	}
	else	{
		Info_ClearChoices(PC_FireCamp_Cook);
	};
};

func void PC_Stove_Cook_Back()
{
	Info_ClearChoices(PC_FireCamp_Cook);
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
	description = "—пать";
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
	description = "ѕосидеть у костра";
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
	description = "¬з€ть уголь";
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
