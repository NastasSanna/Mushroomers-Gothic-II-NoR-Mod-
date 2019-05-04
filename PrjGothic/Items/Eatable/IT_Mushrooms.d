

///////////////////////// ГРИБЫ //////////////////////////////
const int FLAG_MR = 161616;
prototype Proto_Mushroom(C_Item)
{
	description = "Гриб";	name = "";
	weight = FLAG_MR;
	
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI | ITEM_Mushroom;
	scemeName = "FOOD";

	material = MAT_LEATHER;
};

//-------------------------------------------
var int Hero_Knows_MR_Stone;
instance ItMr_Stone(Proto_Mushroom)
{
	description = "Каменка";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};
	
	visual = "ItMr_Stone.3DS";
	
	value = Value_Mr_Stone;
	text[5] = NAME_Value;	count[5] = value;
	
	if (Hero_Knows_MR_Stone)	{
		text[2] = NAME_Bonus_HP;
		count[2] = HP_Mr_Stone;
		text[3] = NAME_Bonus_Mana;
		count[3] = Mana_Mr_Stone;
		MEM_Debug("instance ItMr_Stone");
	}
	else	{
		text[2] = TEXT_UnknownEffect;
	};
	
	on_state[0] = Use_Mushroom_Stone;
};
func void Use_Mushroom_Stone()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mr_Stone);
	Npc_ChangeAttribute(self,ATR_MANA, Mana_Mr_Stone);
	if(Npc_IsPlayer(self))
	{
		if (!Hero_Knows_MR_Stone)	{
			Hero_Knows_MR_Stone = TRUE;
			AI_PrintScreen(CS3(NAME_Bonus_HP, " ", IntToString(HP_Mr_Stone)),-1,55,FONT_ScreenSmall,3);
			AI_PrintScreen(CS3(NAME_Bonus_Mana, " ", IntToString(Mana_Mr_Stone)),-1,58,FONT_ScreenSmall,3);
			var int cnt;	cnt = Npc_HasItems(self, ItMr_Stone);
			Npc_RemoveInvItems(self, ItMr_Stone,cnt);
			CreateInvItems(self, ItMr_Stone,cnt);
		};
		MR_Eaten[MR_Stone] += 1;
		if(MR_Eaten[MR_Stone] % 30 == 0)
		{
			if (self.attribute[ATR_STRENGTH] > -AntiBonus_STR_Mr_Stone)	{
				Npc_ChangeAttribute(self,ATR_STRENGTH,AntiBonus_STR_Mr_Stone);
			} else 	{
				self.attribute[ATR_STRENGTH] = 1;
			};
			if (self.aivar[AIV_Gender] == MALE)	{
				AI_PrintScreen("Мой желудок! Как будто камень проглотил!",-1,-1,FONT_Screen,4);
			}
			else	{
				AI_PrintScreen("Мой желудок! Как будто камень проглотила!",-1,-1,FONT_Screen,4);
			};
		};
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Sunrise;
instance ItMr_Sunrise(Proto_Mushroom)
{
	description = "Зорьник";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Sunrise.3DS";
	
	value = Value_Mr_Sunrise;
	text[5] = NAME_Value;	count[5] = value;
	
	if (Hero_Knows_MR_Sunrise)	{
		text[2] = NAME_Bonus_HP;
		count[2] = HP_Mr_Sunrise;
	}
	else	{
		text[2] = TEXT_UnknownEffect;
	};

	on_state[0] = Use_Mushroom_Sunrise;
};

func void Use_Mushroom_Sunrise()
{
	//обычно снижают здоровье
	if (self.attribute[ATR_HITPOINTS] > -HP_Mr_Sunrise)	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mr_Sunrise);
	} else 	{
		self.attribute[ATR_HITPOINTS] = 1;
	};
	//но постепенно повышают ловкость
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_Sunrise] += 1;
		if (MR_Eaten[MR_Sunrise] % 12 == 0)	{
			B_RaiseAttribute(self,ATR_DEXTERITY,Bonus_DEX_Mr_Sunrise);
		};
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Foggy;
instance ItMr_Foggy(Proto_Mushroom)
{
	description = "Туманник";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Foggy.3DS";
	
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Foggy;
};

func void Use_Mushroom_Foggy()
{
	if (self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX] / 2)	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX] / 2;
	};		
	if(Npc_IsPlayer(self))
	{
		B_Foggy_Templapse();
		POISON_Foggy_Timer = Wld_GetFullTime() + POISON_Foggy_Duration + 1;
		MR_Eaten[MR_Foggy] += 1;
		B_LogNote_Poison();
		B_LogNote(TOPIC_Poison,TOPIC_Poison_Foggy);
	}
	else
	{
		self.aivar[AIV_Timelapse_EndTime] = Wld_GetFullTime() + 15 + Hlp_Random(60);
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Piny;
instance ItMr_Piny(Proto_Mushroom)
{
	description = "Сосновик";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Piny.3DS";
	
	value = Value_Mr_Piny;
	text[5] = NAME_Value;	count[5] = value;
	
	text[2] = NAME_Bonus_HP;
	count[2] = Bonus_HP_Mr_Piny;
	
	on_state[0] = Use_Mushroom_Piny;
};

func void Use_Mushroom_Piny()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,Bonus_HP_Mr_Piny);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_Piny] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Red;
instance ItMr_Red(Proto_Mushroom)
{
	description = "Болтун";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Red.3DS";
	
	value = Value_Mr_Red;
	text[5] = NAME_Value;	count[5] = value;
	
	text[2] = "Не имеет эффекта.";

	on_state[0] = Use_Mushroom_Red;
};

func void Use_Mushroom_Red()
{
	PrintInInventory(PRINT_NoEffect);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_Red] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Bottle;
instance ItMr_Bottle(Proto_Mushroom)
{
	description = "Бутылочник";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Bottle.3DS";
	
	value = Value_Mr_Bottle;
	text[5] = NAME_Value;	count[5] = value;
	
	text[1] = "Похож на бутылку с пробкой.";
	text[2] = "Шляпка-пробка легко отделяется от ножки.";

	on_state[0] = Use_Mushroom_Bottle;
};
//съесть шляпку (ядовита)
FUNC VOID Use_Mushroom_Bottle_Top()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,AntiBonus_HP_Mr_Bottle);
};
//съесть ножку (полезна)
FUNC VOID Use_Mushroom_Bottle_Bottom()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,Bonus_HP_Mr_Bottle);
};
//съесть целиком
FUNC VOID Use_Mushroom_Bottle_All()
{
	Use_Mushroom_Bottle_Top();
	Use_Mushroom_Bottle_Bottom();
};
instance PC_MR_Bottle_End(DIA_Proto_End)
{
	condition = PC_MR_Bottle_Cond;
	information = PC_MR_Bottle_End_Info;
};
func int PC_MR_Bottle_Cond()
{
	if (Hero_Dia_Bottle == TRUE)	{
		return TRUE;
	};
};
func void PC_MR_Bottle_End_Info()
{
	Hero_Dia_Bottle = FALSE;
	CreateInvItem(self, ItMr_Bottle);
	AI_StopProcessInfos(self);
};
instance PC_MR_Bottle_Eat_Top(C_INFO)
{
	nr = 1;
	condition = PC_MR_Bottle_Cond;
	information = PC_MR_Bottle_Eat_Top_Info;
	description = "съесть шляпку";
	permanent = TRUE;
};
func void PC_MR_Bottle_Eat_Top_Info()
{
	Hero_Dia_Bottle = FALSE;
	Use_Mushroom_Bottle_Top();
	AI_StopProcessInfos(self);
};
instance PC_MR_Bottle_Eat_Bottom(C_INFO)
{
	nr = 2;
	condition = PC_MR_Bottle_Cond;
	information = PC_MR_Bottle_Eat_Bottom_Info;
	description = "съесть ножку";
	permanent = TRUE;
};
func void PC_MR_Bottle_Eat_Bottom_Info()
{
	Hero_Dia_Bottle = FALSE;
	Use_Mushroom_Bottle_Bottom();
	AI_StopProcessInfos(self);
};
instance PC_MR_Bottle_Eat_All(C_INFO)
{
	nr = 3;
	condition = PC_MR_Bottle_Cond;
	information = PC_MR_Bottle_Eat_All_Info;
	description = "съесть целиком";
	permanent = TRUE;
};
func void PC_MR_Bottle_Eat_All_Info()
{
	Hero_Dia_Bottle = FALSE;
	Use_Mushroom_Bottle_All();
	AI_StopProcessInfos(self);
};

func void Use_Mushroom_Bottle()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Bottle] += 1;
		if (Hero_Knows_Bottle == TRUE)	{
			Use_Mushroom_Bottle_Bottom();
		}
		else	{
			PC_MR_Bottle_End.npc = Hlp_GetInstanceID(hero);
			PC_MR_Bottle_Eat_Top.npc = Hlp_GetInstanceID(hero);
			PC_MR_Bottle_Eat_Bottom.npc = Hlp_GetInstanceID(hero);
			PC_MR_Bottle_Eat_All.npc = Hlp_GetInstanceID(hero);
			Hero_Dia_Bottle = TRUE;
			AI_ProcessInfos(self);
		};
	};
};

//-------------------------------------------
var int Hero_Knows_MR_BrownOiler;
instance ItMr_BrownOiler(Proto_Mushroom)
{
	description = "Масляк";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_BrownOiler.3DS";
	
	value = Value_Mr_BrownOiler;
	text[5] = NAME_Value;	count[5] = value;
	
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Mr_BrownOiler;

	on_state[0] = Use_Mushroom_BrownOiler;
};

func void Use_Mushroom_BrownOiler()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mr_BrownOiler);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_BrownOiler] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Oyster;
instance ItMr_Oyster(Proto_Mushroom)
{
	description = "Ракушечник";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Oyster.3DS";
	
	value = Value_Mr_Oyster;
	text[5] = NAME_Value;	count[5] = value;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Oyster;
};

func void Use_Mushroom_Oyster()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mr_Oyster);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mr_Oyster);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_Oyster] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Governor;
instance ItMr_Governor(Proto_Mushroom)
{
	description = "Губернатор";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Governor.3DS";
	
	value = Value_Mr_Governor;
	text[5] = NAME_Value;	count[5] = value;
	
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Mr_Governor;

	on_state[0] = Use_Mushroom_Governor;
};

func void Use_Mushroom_Governor()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mr_Governor);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_Governor] += 1;
		if (MR_Eaten[MR_Governor] % Bonus_HP_Mr_Governor_Cnt == 0)	{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,Bonus_HP_Mr_Governor);
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
		//UNFINISHED - призрак губернатора под кайфом
		if (MR_Eaten[MR_Governor] == 28)	{
			Wld_SpawnNpcRange(self,PC_GovernorGhost,1,150);
			B_GiveAchievement_Governor();
		};
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Keil;
instance ItMr_KeilBig(Proto_Mushroom)
{
	description = "Кабанчик (большой)";	//name = description;
	if (!OPT_HideMrNames)	{	name = "Кабанчик";};

	visual = "ItMr_KeilBig.3DS";
	scemeName = "MAP";
	
	text[1] = "Большой как табуретка";
	text[2] = "и твердый как камень.";
	text[5] = NAME_NoValue;
	
	on_state[0] = Use_Mushroom_KeilBig;
};

func void Use_Mushroom_KeilBig()
{
	PrintInInventory("Я не хочу сломать себе зубы!");
};

instance ItMr_KeilSmall(Proto_Mushroom)
{
	description = "Кабанчик (маленький)";	//name = description;
	if (!OPT_HideMrNames)	{	name = "Кабанчик";};

	visual = "ItMr_KeilSmall.3DS";
	
	text[1] = "Шляпка еще не раскрылась";
	value = Value_Mr_KeilSmall;
	text[5] = NAME_Value;	count[5] = value;
	
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Mr_KeilSmall;
	text[3] = "По слухам, может повысить силу.";

	on_state[0] = Use_Mushroom_KeilSmall;
};

func void Use_Mushroom_KeilSmall()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Mr_KeilSmall);
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Keil] += 1;
		if (MR_Eaten[MR_Keil] % Bonus_STR_Mr_KeilSmall_Cnt == 0)	{
			B_RaiseAttribute(self, ATR_STRENGTH, Bonus_STR_Mr_KeilSmall);
		};
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Branch;
instance ItMr_Branch(Proto_Mushroom)
{
	description = "Веточник";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Branch.3DS";
	
	value = Value_Mr_Branch;
	text[5] = NAME_Value;	count[5] = value;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Branch;
};

func void Use_Mushroom_Branch()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mr_Branch);
	Npc_ChangeAttribute(self,ATR_MANA_MAX,Bonus_Mana_Mr_Branch);
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Branch] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_LadysEar;
instance ItMr_LadysEar(Proto_Mushroom)
{
	description = "Дамское ушко";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_LadysEar.3DS";
	
	value = Value_Mr_LadysEar;
	text[5] = NAME_Value;	count[5] = value;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_LadysEar;
};

func void Use_Mushroom_LadysEar()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mr_LadysEar);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Mr_LadysEar);
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_LadysEar] += 1;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Trident;
instance ItMr_Trident(Proto_Mushroom)
{
	description = "Трезубец";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Trident.3DS";
	
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Trident;
};

func void Use_Mushroom_Trident()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Trident] += 1;
		AI_PrintScreen("Я чувствую слабость", -1, -1, FONT_Screen,2);
		if (self.attribute[ATR_STRENGTH] > 10)	{
			self.attribute[ATR_STRENGTH] -= 10;
			POISON_Trident_STR += 10;
		};
		if (self.attribute[ATR_DEXTERITY] > 10)	{
			self.attribute[ATR_DEXTERITY] -= 5;
			POISON_Trident_DEX += 5;
		};
		Wld_PlayEffect("TREMBLE",self,self,1,0,0,0);
		B_LogNote_Poison();
		B_LogNote(TOPIC_Poison,TOPIC_Poison_Trident);
	};
};

//-------------------------------------------
var int Hero_Knows_MR_NightSparkles;
instance ItMr_NightSparkles(Proto_Mushroom)
{
	description = "Ночные искры";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_NightSparkles.3DS";
	effect = "SPELLFX_HEALTHPOTION";
	
	text[1] = "Здесь около дюжины маленьких грибочков.";
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_NightSparkles;
};

func void Use_Mushroom_NightSparkles()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_NightSparkles] += 1;
		if (TIMER_NightSparkles_Enabled == FALSE)	{
			PrintInInventory("Чувствую странное покалывание...");
			self.protection[PROT_FIRE] += ProtFire_Mr_NightSparkles;
		};
		if (MIS_Cookery_AskSpices && !MIS_Cookery_SpicesGiven && !MIS_Cookery_NSparclesKnown)	{
			B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_NSparklesKnown);
			MIS_Cookery_NSparclesKnown = TRUE;
		};
		TIMER_NightSparkles = TIMER_NightSparkles_Max;
	};
};

//-------------------------------------------
var int Hero_Knows_MR_DragonTears;
instance ItMr_DragonTears(Proto_Mushroom)
{
	description = "Драконовы слезы";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_DragonTears.3DS";
	
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_DragonTears;
};

func void Use_Mushroom_DragonTears()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_DragonTears] += 1;
		POISON_DrgTears_Timer = POISON_DrgTears_Time_Max;
		AI_PrintScreen("Жжется! ЖЖЕТСЯ!!! Внутри все горит!",-1,YPOS_InInventory,FONT_Screen,5);
		Wld_PlayEffect("POISON_DRGTEARS",self,self,1,0,0,FALSE);
		B_LogNote_Poison();
		B_LogNote(TOPIC_Poison,TOPIC_Poison_DrgTears);
	};
};

//-------------------------------------------
instance ItMr_Heart(Proto_Mushroom)
{
	description = "Гриб-сердце";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Heart.3DS";
	scemeName = "MAP";
	
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Heart;
};

func void Use_Mushroom_Heart()
{
	PrintInInventory(PRINT_RefuseEat);
};

//-------------------------------------------
instance ItMr_Heart_Blessed(Proto_Mushroom)
{
	description = "Гриб-сердце (благословленный)";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Heart.3DS";
	effect = "SPELLFX_WEAKGLIMMER_RED";
	
	text[2] = "Белиар наполнил этот сосуд своей силой.";
	text[5] = NAME_NoValue;
	
	on_state[0] = Use_Mushroom_Heart;
};

func void Use_Mushroom_Heart_Blessed()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Heart] += 1;
		Wld_PlayEffect("SPELLFX_FEAR",self,self,1,0,0,0);
		B_Say_Overlay(self,self,"$AARGH_1");
		self.attribute[ATR_HITPOINTS] = 1;
		self.attribute[ATR_MANA] = 1;
		self.protection[PROT_BLUNT] = Bonus_Prot_Mr_Heart;
		self.protection[PROT_EDGE] = Bonus_Prot_Mr_Heart;
		self.protection[PROT_POINT] = Bonus_Prot_Mr_Heart;
		self.protection[PROT_FIRE] = Bonus_Prot_Mr_Heart;
		self.protection[PROT_MAGIC] = Bonus_Prot2_Mr_Heart;
		B_RaiseAttribute(self,ATR_STRENGTH,Bonus_STR_Mr_Heart);
		B_RaiseAttribute(self,ATR_DEXTERITY,Bonus_DEX_Mr_Heart);
	};
};

//-------------------------------------------
instance ItMr_GoldPlate(Proto_Mushroom)
{
	description = "Золотая чаша";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_GoldPlate.3DS";
	scemeName = "MAP";
	
	text[5] = NAME_NoValue;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_GoldPlate;
};

func void Use_Mushroom_GoldPlate()
{
	PrintInInventory(PRINT_RefuseEat2);
};

//-------------------------------------------
instance ItMr_GoldPlate_Blessed(Proto_Mushroom)
{
	description = "Золотая чаша (благословленная)";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_GoldPlate.3DS";
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	
	text[2] = "Иннос благословил эту чашу.";
	text[5] = NAME_NoValue;
	
	on_state[0] = Use_Mushroom_GoldPlate_Blessed;
};

func void Use_Mushroom_GoldPlate_Blessed()
{
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_GoldPlate] += 1;
		Wld_PlayEffect("SPELLFX_HEAL",self,self,1,0,0,0);
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,Bonus_HP_Mr_GoldPlate);
		B_RaiseAttribute(self,ATR_MANA_MAX,Bonus_Mana_Mr_GoldPlate);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

//-------------------------------------------
instance PC_IvySleepStart(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_IvySleepStart_Condition;
	information = PC_IvySleepStart_Info;
	important = 1;
	permanent = 1;
};


func int PC_IvySleepStart_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IvySleepStart)
	{
		return TRUE;
	};
	return FALSE;
};

func void PC_IvySleepStart_Info()
{
	B_Say(self,self,"$AWAKE");
	//ZS_MagicSleep_Short();
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	if(C_NpcIsHero(self))
	{
		HERO_IsSleeping = TRUE;
	};
	AI_Wait(self,Sleep_Time_Ivyf);
	//B_StopMagicSleep();
	AI_PlayAniBS(self,"T_VICTIM_SLE_2_STAND", BS_STAND);
	if(C_NpcIsHero(self))
	{
		HERO_IsSleeping = FALSE;
	};
	b_endproductiondialog();
};

var int Hero_Knows_MR_Ivy;
instance ItMr_Ivy(Proto_Mushroom)
{
	description = "Плющевик";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Ivy.3DS";
	
	value = Value_Mr_Ivy;
	text[5] = NAME_Value;	count[5] = value;
	
	text[3] = TEXT_UnknownEffect;

	on_state[0] = Use_Mushroom_Ivy;
};

func void Use_Mushroom_Ivy()
{
//	B_ClearPerceptions(self);
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Ivy] += 1;
		PC_IvySleepStart.npc = Hlp_GetInstanceID(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_IvySleepStart;
		AI_ProcessInfos(self);
	}
	else	{
		AI_StartState(self,ZS_MagicSleep_Short,0,"");
	};
};

//-------------------------------------------
var int Hero_Knows_MR_Violet;
instance ItMr_Violet(Proto_Mushroom)
{
	description = "Белиарова поганка";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItMr_Violet.3DS";
	effect = "SPELLFX_WEAKGLIMMER_VIOLET";
	
	text[5] = NAME_NoValue;
	
	text[3] = "Выглядит очень ядовитой!";

	on_state[0] = Use_Mushroom_Violet;
};

func void Use_Mushroom_Violet()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
	if (Npc_IsPlayer(self))	{
		MR_Eaten[MR_Violet] += 1;
	};
};

//-------------------------------------------
instance ItPl_Mushroom_01(Proto_Mushroom)
{
	description = "Темный гриб";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItPl_Mushroom_01.3DS";
	
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Mushroom_01;
	
	value = Value_Mushroom_01;
	text[5] = NAME_Value;	count[5] = value;
	
	on_state[0] = Use_Mushroom_01;
};


func void Use_Mushroom_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mushroom_01);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_01] += 1;
		Dunkelpilz_Bonus = Dunkelpilz_Bonus + 1;
		if(Dunkelpilz_Bonus == 50)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,5);
			Npc_ChangeAttribute(self,ATR_MANA,5);
			Snd_Play("LevelUp");
			Dunkelpilz_Bonus = 0;
		};
	};
};


instance ItPl_Mushroom_02(Proto_Mushroom)
{
	description = "Пища рудокопа";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItPl_Mushroom_02.3DS";
	
	on_state[0] = Use_Mushroom_02;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Mushroom_02;
	
	text[3] = "Сытный мясной гриб";
	
	value = Value_Mushroom_02;
	text[5] = NAME_Value;	count[5] = value;
};


func void Use_Mushroom_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Mushroom_02);
	if(Npc_IsPlayer(self))
	{
		MR_Eaten[MR_02] += 1;
	};
};

//================================================
//является ли предмет грибом
func int C_ItemIsMushroom(var C_ITEM itm)
{
	if (Hlp_IsItem(itm,ItPl_Mushroom_01))	{return MR_01;}	else
	if (Hlp_IsItem(itm,ItPl_Mushroom_02))	{return MR_02;}	else
	if (Hlp_IsItem(itm,ItMr_Bottle))	{return MR_Bottle;}	else
	if (Hlp_IsItem(itm,ItMr_Branch))	{return MR_Branch;}	else
	if (Hlp_IsItem(itm,ItMr_BrownOiler))	{return MR_BrownOiler;}	else
	if (Hlp_IsItem(itm,ItMr_DragonTears))	{return MR_DragonTears;}	else
	if (Hlp_IsItem(itm,ItMr_Foggy))	{return MR_Foggy;}	else
	if (Hlp_IsItem(itm,ItMr_GoldPlate))	{return MR_GoldPlate;}	else
	if (Hlp_IsItem(itm,ItMr_Governor))	{return MR_Governor;}	else
	if (Hlp_IsItem(itm,ItMr_Heart))	{return MR_Heart;}	else
	if (Hlp_IsItem(itm,ItMr_Ivy))	{return MR_Ivy;}	else
	if (Hlp_IsItem(itm,ItMr_KeilBig))	{return MR_Keil;}	else
	if (Hlp_IsItem(itm,ItMr_KeilSmall))	{return MR_Keil;}	else
	if (Hlp_IsItem(itm,ItMr_LadysEar))	{return MR_LadysEar;}	else
	if (Hlp_IsItem(itm,ItMr_NightSparkles))	{return MR_NightSparkles;}	else
	if (Hlp_IsItem(itm,ItMr_Oyster))	{return MR_Oyster;}	else
	if (Hlp_IsItem(itm,ItMr_Piny))	{return MR_Piny;}	else
	if (Hlp_IsItem(itm,ItMr_Red))	{return MR_Red;}	else
	if (Hlp_IsItem(itm,ItMr_Stone))	{return MR_Stone;}	else
	if (Hlp_IsItem(itm,ItMr_Sunrise))	{return MR_Sunrise;}	else
	if (Hlp_IsItem(itm,ItMr_Trident))	{return MR_Trident;}	else
	if (Hlp_IsItem(itm,ItMr_Violet))	{return MR_Violet;};
	return -1;
};
//----------------------------------------------
func int C_ItemIsNotMushroomByPtr(var int itmPtr)
{
	var C_ITEM itm;	itm = _^(itmPtr);
	MEM_Debug(itm.name);
	if (C_ItemIsMushroom(itm) == -1)	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------
func int C_GetMushroomPrice(var C_ITEM itm)
{
	var int MR_Index; MR_Index = C_ItemIsMushroom(itm);
	if (MR_Index >= 0)	{
		return MEM_ReadStatArr(MR_Price, MR_Index);
	};
	return itm.value;
};
func int C_GetMushroomPriceByPtr(var int itmPtr)
{
	var C_ITEM itm;	itm = _^(itmPtr);
	return C_GetMushroomPrice(itm);
};
func void C_SetMushroomPriceByPtr(var int itmPtr)
{
	var C_ITEM itm;	itm = _^(itmPtr);
	itm.value = C_GetMushroomPrice(itm);
};

//===========================================
instance ItMr_YellowFun(Proto_Mushroom)
{
	description = "2Khaos";	//name = description;
	if (!OPT_HideMrNames)	{	name = description;};

	visual = "ItPl_YellowFun.3DS";
	effect = "SPELLFX_WEAKGLIMMER_YELLOW";
	
	text[5] = NAME_NoValue;
	
	text[3] = "Съешь меня!";

	on_state[0] = Use_Mushroom_YellowFun;
};

func void Use_Mushroom_YellowFun()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
};
