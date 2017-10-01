
// ===============================================================

instance PC_SitABit_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SitABit_Condition;
	information = PC_SitABit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_SitABit_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SitABit)
	{
		return TRUE;
	};
};

func void PC_SitABit_EXIT_Info()
{
	b_endproductiondialog();
};
// ====================================================

instance PC_SitABit(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_SitABit_Condition;
	information = PC_SitABit_Info;
	permanent = TRUE;
	description = "Пропустить...";
};

func void PC_SitABit_Info()
{
	Info_ClearChoices(PC_SitABit);
	Info_AddChoice(PC_SitABit, Dialog_Ende, PC_SitABit_StandUp);
	Info_AddChoice(PC_SitABit, "...3 часа", PC_SitABit_3h);
	Info_AddChoice(PC_SitABit, "...2 часа", PC_SitABit_2h);
	Info_AddChoice(PC_SitABit, "...1 час", PC_SitABit_1h);
	Info_AddChoice(PC_SitABit, "...полчаса", PC_SitABit_Halfh);
};

func void PC_SitABit_StandUp()
{
	Info_ClearChoices(PC_SitABit);
	b_endproductiondialog();
};
func void PC_SitABit_SpendTime(var int h, var int m)
{
	b_endproductiondialog();
	AI_Wait(self, 1.0);
	B_SetTimePlus(h, m);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};
func void PC_SitABit_Halfh()
{
	PC_SitABit_SpendTime(0, 30);
};

func void PC_SitABit_1h()
{
	PC_SitABit_SpendTime(1, 0);
};

func void PC_SitABit_2h()
{
	PC_SitABit_SpendTime(2, 0);
};

func void PC_SitABit_3h()
{
	PC_SitABit_SpendTime(3, 0);
};


// ====================================================

func int Can_SitABit()
{
	return TRUE;
};

func void SitABit_s1()
{
	if (Npc_IsPlayer(self))
	{
		PC_SitABit_EXIT.npc = Hlp_GetInstanceID(self);
		PC_SitABit.npc = Hlp_GetInstanceID(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_SitABit;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(self);
	};
};
