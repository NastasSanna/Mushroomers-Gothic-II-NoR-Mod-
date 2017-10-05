/**************************************************************************

						ПРИГОТОВЛЕНИЕ ПИЩИ
   
  Чтобы готовить на плите, нужна сковорода.

***************************************************************************/

// ====================================================

instance PC_Stove_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Stove_EXIT_Condition;
	information = PC_Stove_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_Stove_EXIT_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_Stove)
	{
		return TRUE;
	};
	return FALSE;
};

func void PC_Stove_EXIT_Info()
{
	b_endproductiondialog();
};

// ===============================================================

instance PC_Stove_Cook_Meat(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Stove_Cook_Meat_Condition;
	information = PC_Stove_Cook_Meat_Info;
	permanent = TRUE;
	description = "Жарить мясо...";
};


func int PC_Stove_Cook_Meat_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_Stove)
	{
		return TRUE;
	};
	return FALSE;
};

func void PC_Stove_Cook_Meat_Info()
{
	Info_ClearChoices(PC_Stove_Cook_Meat);
	Info_AddChoice(PC_Stove_Cook_Meat,Dialog_Back,PC_Stove_Cook_Meat_Back);
	var int cnt;	cnt = Npc_HasItems(self, ItFoMuttonRaw);
	if (cnt > 1)	{
		Info_AddChoice(PC_Stove_Cook_Meat,"...1 кусок (2 минуты)",PC_Stove_Cook_Meat_1);
	};
	if (cnt > 5)	{
		Info_AddChoice(PC_Stove_Cook_Meat,"...5 кусков (10 минут)",PC_Stove_Cook_Meat_5);
	};
	if (cnt > 10)	{
		Info_AddChoice(PC_Stove_Cook_Meat,"...10 кусков (20 минут)",PC_Stove_Cook_Meat_10);
	};
	if (cnt > 20)	{
		Info_AddChoice(PC_Stove_Cook_Meat,"...20 кусков (40 минут)",PC_Stove_Cook_Meat_20);
	};
	if (cnt > 1)	{
		var string str_cnt; str_cnt = IntToString(cnt);
		var string str_time; str_time = IntToString(2 * cnt);
		Info_AddChoice(PC_Stove_Cook_Meat,CS5("...все (", str_cnt," шт., ",str_time," мин.)"),PC_Stove_Cook_Meat_All);
	};
};

func void PC_Stove_Cook_Meat_Back()
{
	Info_ClearChoices(PC_Stove_Cook_Meat);
};

//пожарить заданное кол-во мяса на плите
func void PC_Stove_Cook_Meat_DoIt(var int MuttonCount)
{
	//жарим
	Cook_Meat_DoCook(MuttonCount);
	//больше ничего нет - конец
	if (Npc_HasItems(self,ItFoMuttonRaw) == 0)	{
		PC_Stove_EXIT_Info();
	}
	else {
		PC_Stove_Cook_Meat_Info();
	};
};

func void PC_Stove_Cook_Meat_1()
{
	PC_Stove_Cook_Meat_DoIt(1);
};

func void PC_Stove_Cook_Meat_5()
{
	PC_Stove_Cook_Meat_DoIt(5);
};

func void PC_Stove_Cook_Meat_10()
{
	PC_Stove_Cook_Meat_DoIt(10);
};

func void PC_Stove_Cook_Meat_20()
{
	PC_Stove_Cook_Meat_DoIt(20);
};

func void PC_Stove_Cook_Meat_All()
{
	var int cnt;	cnt = Npc_HasItems(self, ItFoMuttonRaw);
	PC_Stove_Cook_Meat_DoIt(cnt);
};


// ====================================================

func int cancookstove()
{
	if (Npc_IsPlayer(self))
	{
		//if (Npc_HasItems(self, ItMi_Pan) == 0)		{
		//	PrintOnMob(PRINT_MissingPan);
		//	return FALSE;
		//};
		if (Npc_HasItems(self, ItFoMuttonRaw) == 0)		{
			PrintOnMob(PRINT_MissingMuttonRaw);
			return FALSE;
		};
	};
	return TRUE;
};

func void cookstove_s1()
{
	if (Npc_IsPlayer(self))
	{
		PC_Stove_EXIT.npc = Hlp_GetInstanceID(self);
		PC_Stove_Cook_Meat.npc = Hlp_GetInstanceID(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_Stove;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(self);
	};
};
