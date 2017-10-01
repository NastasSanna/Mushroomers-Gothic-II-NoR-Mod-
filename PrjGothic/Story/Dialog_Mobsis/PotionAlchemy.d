/**************************************************************************

								АЛХИМИЯ
   
  Успешность зависит от ловкости ГГ и опытности в алхимии (псевдослучайно).
  
  При низкой ловкости ГГ может разбить мензурку, в том числе с ингредиентами.
  
  При недостаточной опытности он не получит нужного результата, попусту 
переведет ингредиенты и может даже устроить небольшой взрыв. Опытность
накапливается по мере работы с зельями, причем как в случае успеха, так и
при неудаче.
  Формула для вероятности: 10 + (5 + сложность) * сложность:
  Чтобы гарантированно научиться изготавливать зелье, ГГ должен изготовить
как минимум (5 + сложность) таких же и 10 простейших зелий.

  При работе с табаком и алкоголем мензурка используется, но не исчезает из
инвентаря.

***************************************************************************/

// текущая ветка диалога
var int DIA_PotionAlchemy_Choice;
	const int DIA_PotionAlchemy_None		= 0;	//нет
	const int DIA_PotionAlchemy_Mana		= 1;	//зелья маны
	const int DIA_PotionAlchemy_Health		= 2;	//лечебные зелья
	const int DIA_PotionAlchemy_Special		= 3;	//особые зелья
	const int DIA_PotionAlchemy_Booze		= 4;	//алкоголь
	const int DIA_PotionAlchemy_Tabak		= 5;	//табак

// ВЫХОД ==================================================================

instance PC_PotionAlchemy_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PotionAlchemy_End_Condition;
	information = PC_PotionAlchemy_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PotionAlchemy_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_End_Info()
{
	CreateInvItems(self,ItMi_Flask,1);
	b_endproductiondialog();
};

// НАЗАД ==================================================================

instance PC_PotionAlchemy_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_PotionAlchemy_BACK_Condition;
	information = PC_PotionAlchemy_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_PotionAlchemy_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice != DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_BACK_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_None;
};

// ЗЕЛЬЯ МАНЫ =============================================================

instance PC_Mana_Start(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Mana_Start_Condition;
	information = PC_Mana_Start_Info;
	permanent = TRUE;
	description = "Изготовить зелье маны";
};


func int PC_Mana_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Mana_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Mana;
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_01_Condition;
	information = PC_ItPo_Mana_01_Info;
	permanent = TRUE;
	description = "Эссенция маны (2 огненных крапивы и 1 луговой горец)";
};


func int PC_ItPo_Mana_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_01_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_01,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_02_Condition;
	information = PC_ItPo_Mana_02_Info;
	permanent = TRUE;
	description = "Экстракт маны (2 огненных травы и 1 луговой горец) ";
};


func int PC_ItPo_Mana_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_02_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_02,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_03_Condition;
	information = PC_ItPo_Mana_03_Info;
	permanent = TRUE;
	description = "Эликсир маны (2 огненных корня и 1 луговой горец)";
};


func int PC_ItPo_Mana_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_03_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_03,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_04_Condition;
	information = PC_ItPo_Mana_04_Info;
	permanent = TRUE;
	description = "Чистая мана (3 эссенции маны, 1 луговой горец)";
};


func int PC_ItPo_Mana_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_04_Info()
{
	if((Npc_HasItems(hero,ItPo_Mana_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_Mana_01,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_Addon_04,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// ЛЕЧЕБНЫЕ ЗЕЛЬЯ =========================================================

instance PC_Health_Start(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_Health_Start_Condition;
	information = PC_Health_Start_Info;
	permanent = TRUE;
	description = "Изготовить лечебное зелье";
};


func int PC_Health_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Health_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Health;
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Health_01_Condition;
	information = PC_ItPo_Health_01_Info;
	permanent = TRUE;
	description = "Лечебная эссенция (2 лечебные травы и 1 луговой горец)";
};


func int PC_ItPo_Health_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_01_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItem(hero,ItPo_Health_01);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_02_Condition;
	information = PC_ItPo_Health_02_Info;
	permanent = TRUE;
	description = "Лечебный экстракт (2 лечебных растения и 1 луговой горец)";
};


func int PC_ItPo_Health_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_02_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_02,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_03_Condition;
	information = PC_ItPo_Health_03_Info;
	permanent = TRUE;
	description = "Лечебный эликсир (2 лечебных корня и 1 луговой горец)";
};


func int PC_ItPo_Health_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_03_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_03,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_04_Condition;
	information = PC_ItPo_Health_04_Info;
	permanent = TRUE;
	description = "Чистое здоровье (3 лечебные эссенции, 1 луговой горец)";
};


func int PC_ItPo_Health_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_04_Info()
{
	if((Npc_HasItems(hero,ItPo_Health_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_Health_01,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_Addon_04,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// ОСОБОЕ =================================================================

instance PC_Special_Start(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_Special_Start_Condition;
	information = PC_Special_Start_Info;
	permanent = TRUE;
	description = "Изготовить особое зелье";
};


func int PC_Special_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Special_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Special;
};

// -----------------------------------------------------------------

instance PC_ItPo_Perm_Health(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Health_Condition;
	information = PC_ItPo_Perm_Health_Info;
	permanent = TRUE;
	description = "Эликсир жизни (1 лечебный корень и 1 царский щавель)";
};


func int PC_ItPo_Perm_Health_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Health_Info()
{
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero, ItPo_Perm_Health, 1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Perm_Mana(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Mana_Condition;
	information = PC_ItPo_Perm_Mana_Info;
	permanent = TRUE;
	description = "Эликсир духа (1 огненный корень и 1 царский щавель)";
};


func int PC_ItPo_Perm_Mana_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Mana_Info()
{
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_Mana,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Dex(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Dex_Condition;
	information = PC_ItPo_Dex_Info;
	permanent = TRUE;
	description = "Эликсир ловкости (1 гоблинские ягоды и 1 царский щавель.)";
};


func int PC_ItPo_Dex_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};

func void PC_ItPo_Dex_Info()
{
	if((Npc_HasItems(hero,ItPl_Dex_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_DEX,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Str(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Str_Condition;
	information = PC_ItPo_Str_Info;
	permanent = TRUE;
	description = "Эликсир силы (1 драконий корень и 1 царский щавель.)";
};


func int PC_ItPo_Str_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};

func void PC_ItPo_Str_Info()
{
	if((Npc_HasItems(hero,ItPl_Strength_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_STR,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Speed(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Speed_Condition;
	information = PC_ItPo_Speed_Info;
	permanent = TRUE;
	description = "Зелье ускорения (1 снеппер-трава и 1 луговой горец)";
};


func int PC_ItPo_Speed_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};

func void PC_ItPo_Speed_Info()
{
	if((Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Speed,1);
		b_endproductiondialog();
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
};


// ======================================================================

// приступить
func void potionalchemy_s1()
{
	if(Npc_IsPlayer(self))
	{
		PC_PotionAlchemy_End.npc = Hlp_GetInstanceID(self);
		PC_PotionAlchemy_BACK.npc = Hlp_GetInstanceID(self);
		PC_Mana_Start.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Mana_01.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Mana_02.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Mana_03.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Mana_04.npc = Hlp_GetInstanceID(self);
		PC_Health_Start.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Health_01.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Health_02.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Health_03.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Health_04.npc = Hlp_GetInstanceID(self);
		PC_Special_Start.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Perm_Health.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Perm_Mana.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Dex.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Str.npc = Hlp_GetInstanceID(self);
		PC_ItPo_Speed.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		AI_ProcessInfos(self);
	};
};

