
/**********************************************************************************

								БЕЛИАР
								
  Молиться только ночью.
  Молитва: макс. здоровья или маны => золото.
  
Mod:
  Коготь Белиара удален.
  Если Белиар покровитель, можно призвать демона или нежить за ману и здоровье.
  Если Иннос покровитель, он будет наказывать.

//*********************************************************************************/

var int PrayIdolDay;
var int RecievedMoney;
var int GivenHitpoints;
var int GivenMana;
const int BeliarsDispo = 10000;

func void B_HitpointAngleich(var int BeliarsCost)
{
	var int CurrentHitpoints;
	GivenHitpoints = GivenHitpoints + BeliarsCost;
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - BeliarsCost;
	hero.aivar[REAL_HITPOINTS_MAX] = hero.aivar[REAL_HITPOINTS_MAX] - BeliarsCost;
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS] - BeliarsCost;
	if(CurrentHitpoints < 2)
	{
		CurrentHitpoints = 2;
	};
	hero.attribute[ATR_HITPOINTS] = CurrentHitpoints;
};

func void B_ManaAngleich(var int BeliarsCost)
{
	var int CurrentMana;
	GivenMana = GivenMana + BeliarsCost;
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - BeliarsCost;
	hero.aivar[REAL_MANA_MAX] = hero.aivar[REAL_MANA_MAX] - BeliarsCost;
	CurrentMana = hero.attribute[ATR_MANA] - BeliarsCost;
	if(CurrentMana < 0)
	{
		CurrentMana = 0;
	};
	hero.attribute[ATR_MANA] = CurrentMana;
};

// Белиар наказывает ГГ
func void B_BlitzInArsch()
{
	var string concatText1;
	var string concatText2;
	// на 1/5 здоровья
	var int CurrentHitpoints;	CurrentHitpoints = hero.attribute[ATR_HITPOINTS];
	var int BlitzInArsch_Hitpoints;	BlitzInArsch_Hitpoints = (CurrentHitpoints * 4) / 5;
	if(BlitzInArsch_Hitpoints < 2)	{
		BlitzInArsch_Hitpoints = 2;
	};
	//сколько осталось?
	var int Abzug;	Abzug = hero.attribute[ATR_HITPOINTS] - BlitzInArsch_Hitpoints;
	if(Abzug > 0)
	{
		concatText1 = ConcatStrings(" ",NAME_Damage);
		concatText2 = ConcatStrings(IntToString(Abzug),concatText1);
		AI_PrintScreen(concatText2,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	};
	hero.attribute[ATR_HITPOINTS] = BlitzInArsch_Hitpoints;
};

//дает золотишко
func void B_GetBeliarsGold(var int Kohle)
{
	var string concatText1;
	var string concatText2;
	RecievedMoney = RecievedMoney + Kohle;
	if(RecievedMoney > BeliarsDispo)
	{
		Kohle = 100;
	};
	CreateInvItems(hero,ItMi_Gold,Kohle);
	concatText1 = ConcatStrings(IntToString(Kohle)," ");
	concatText2 = ConcatStrings(concatText1,PRINT_GoldErhalten);
	AI_PrintScreen(concatText2,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
};

//==================================================
instance PC_PrayIdol_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayIdol_End_Condition;
	information = PC_PrayIdol_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_PrayIdol_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};
func void PC_PrayIdol_End_Info()
{
	b_endproductiondialog();
};

//==================================================
instance PC_PrayIdol_PrayIdol(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayIdol_PrayIdol_Condition;
	information = PC_PrayIdol_PrayIdol_Info;
	permanent = TRUE;
	description = NAME_ADDON_BETEN;
};
func int PC_PrayIdol_PrayIdol_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};
func void PC_PrayIdol_PrayIdol_Info()
{
	//Покровитель - Иннос
	if (PATRONGOD == PATRONGOD_Innos)	{
		PrintScreen(PRINT_GOD_Innos_Rage, -1, 55, FONT_Screen, 3);
		if (self.attribute[ATR_HITPOINTS] > 1)	{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
		};
	};
	
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
	Info_AddChoice(PC_PrayIdol_PrayIdol,Dialog_Back,PC_PrayIdol_PrayIdol_Back);
	Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVENOTHING,PC_PrayIdol_PrayIdol_NoPay);
	if(GivenHitpoints <= 50)
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT1,PC_PrayIdol_PrayIdol_SmallPay);
		};
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 50)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT2,PC_PrayIdol_PrayIdol_MediumPay);
		};
		if(hero.attribute[ATR_HITPOINTS_MAX] >= 60)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEHITPOINT3,PC_PrayIdol_PrayIdol_BigPay);
		};
	};
	if(GivenMana <= 10)
	{
		if(hero.attribute[ATR_MANA_MAX] > 10)
		{
			Info_AddChoice(PC_PrayIdol_PrayIdol,NAME_ADDON_PRAYIDOL_GIVEMANA,PC_PrayIdol_PrayIdol_ManaPay);
		};
	};
};

func void PC_PrayIdol_PrayIdol_Back()
{
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_NoPay()
{
	PrayCounter_Beliar += 1;
	B_BlitzInArsch();
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_Pay(var int GoldValue)
{
	PrayCounter_Beliar += 1;
	if((PrayIdolDay >= Wld_GetDay()) || (RecievedMoney >= BeliarsDispo))
	{
		B_BlitzInArsch();
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		B_GetBeliarsGold(GoldValue / 2);
	}
	else
	{
		B_GetBeliarsGold(GoldValue);
	};
	PrayIdolDay = Wld_GetDay() + 1;
	Info_ClearChoices(PC_PrayIdol_PrayIdol);
};

func void PC_PrayIdol_PrayIdol_SmallPay()
{
	B_HitpointAngleich(1);
	PC_PrayIdol_PrayIdol_Pay(50);
};

func void PC_PrayIdol_PrayIdol_MediumPay()
{
	B_HitpointAngleich(2);
	PC_PrayIdol_PrayIdol_Pay(250);
};

func void PC_PrayIdol_PrayIdol_BigPay()
{
	B_HitpointAngleich(3);
	PC_PrayIdol_PrayIdol_Pay(500);
};

func void PC_PrayIdol_PrayIdol_ManaPay()
{
	B_ManaAngleich(1);
	PC_PrayIdol_PrayIdol_Pay(500);
};


// ПРИЗЫВ ==================================================
instance PC_PrayIdol_Summon(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_PrayIdol_Summon_Condition;
	information = PC_PrayIdol_Summon_Info;
	permanent = TRUE;
	description = NAME_Summon;
};
func int PC_PrayIdol_Summon_Condition()
{
	//только для слуг Белиара!
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (PATRONGOD == PATRONGOD_Beliar))
	{
		return TRUE;
	};
};
//строка - кого и почем призываем (мана + здоровье)
func string PC_PrayIdol_Summon_Text(var string name, var int Mana_Costen, var int HP_Costen)
{
	var string result;
	result = ConcatStrings(name, " (");
	result = ConcatStrings(result, IntToString(Mana_Costen));
	result = ConcatStrings(result, PRINT_Mana_Costen);
	result = ConcatStrings(result, ", ");
	result = ConcatStrings(result, IntToString(HP_Costen));
	result = ConcatStrings(result, PRINT_HP_Costen);
	result = ConcatStrings(result, ")");
	return result;
};
func void PC_PrayIdol_Summon_Info()
{
	Info_ClearChoices(PC_PrayIdol_Summon);
	Info_AddChoice(PC_PrayIdol_Summon,Dialog_Back,PC_PrayIdol_Summon_Back);
	Info_AddChoice(PC_PrayIdol_Summon,PC_PrayIdol_Summon_Text(NAME_Summon_Demon,SPL_Cost_SummonDemon / 4, SPL_Cost_SummonDemon),PC_PrayIdol_Summon_Demon);
	Info_AddChoice(PC_PrayIdol_Summon,PC_PrayIdol_Summon_Text(NAME_Summon_Zombie,SPL_Cost_SummonZombie / 4, SPL_Cost_SummonZombie),PC_PrayIdol_Summon_Zombie);
	Info_AddChoice(PC_PrayIdol_Summon,PC_PrayIdol_Summon_Text(NAME_Summon_Skeleton,SPL_Cost_SummonSkeleton / 4, SPL_Cost_SummonSkeleton),PC_PrayIdol_Summon_Skeleton);
	Info_AddChoice(PC_PrayIdol_Summon,PC_PrayIdol_Summon_Text(NAME_Summon_GobboSkeleton,SPL_Cost_SummonGoblinSkeleton / 4, SPL_Cost_SummonGoblinSkeleton),PC_PrayIdol_Summon_GobboSkeleton);
};
//кого призываем?
func void PC_PrayIdol_Summon_Back()
{
	Info_ClearChoices(PC_PrayIdol_Summon);
};
func void PC_PrayIdol_Summon_Demon()
{
	PrayCounter_Beliar += 1;
	Info_ClearChoices(PC_PrayIdol_Summon);
	if (self.attribute[ATR_MANA] < SPL_Cost_SummonDemon / 4)	{
		PrintScreen(PRINT_NotEnoughMana,-1,-1,FONT_ScreenSmall,2);
	}
	else if (self.attribute[ATR_HITPOINTS] < SPL_Cost_SummonDemon)	{
		PrintScreen(PRINT_NotEnoughHP,-1,-1,FONT_ScreenSmall,2);
	}
	else	{
		PrintScreen(PRINT_GOD_Beliar_Support,-1,-1,FONT_Screen,2);
		self.attribute[ATR_MANA] 		-= SPL_Cost_SummonDemon / 4;
		self.attribute[ATR_HITPOINTS]	-= SPL_Cost_SummonDemon;
		Wld_InsertNpc(Summoned_Demon,Npc_GetNearestWP(self));
		//Wld_SpawnNpcRange(self,Summoned_Demon,1,-1);
		self.aivar[AIV_SummonedTime] = 5 * MONSTER_SUMMON_TIME;	//живет дольше, чем из свитка
		b_endproductiondialog();
	};
};
func void PC_PrayIdol_Summon_Zombie()
{
	PrayCounter_Beliar += 1;
	if (self.attribute[ATR_MANA] < SPL_Cost_SummonZombie / 4)	{
		PrintScreen(PRINT_NotEnoughMana,-1,-1,FONT_ScreenSmall,2);
	}
	else if (self.attribute[ATR_HITPOINTS] < SPL_Cost_SummonZombie)	{
		PrintScreen(PRINT_NotEnoughHP,-1,-1,FONT_ScreenSmall,2);
	}
	else	{
		PrintScreen(PRINT_GOD_Beliar_Support,-1,-1,FONT_Screen,2);
		self.attribute[ATR_MANA] 		-= SPL_Cost_SummonZombie / 4;
		self.attribute[ATR_HITPOINTS]	-= SPL_Cost_SummonZombie;
		Wld_InsertNpc(Summoned_ZOMBIE,Npc_GetNearestWP(self));
		self.aivar[AIV_SummonedTime] = 5 * MONSTER_SUMMON_TIME;	//живет дольше, чем из свитка
		//Wld_SpawnNpcRange(self,Summoned_ZOMBIE,1,500);
	};
	Info_ClearChoices(PC_PrayIdol_Summon);
};
func void PC_PrayIdol_Summon_Skeleton()
{
	PrayCounter_Beliar += 1;
	if (self.attribute[ATR_MANA] < SPL_Cost_SummonSkeleton / 4)	{
		PrintScreen(PRINT_NotEnoughMana,-1,-1,FONT_ScreenSmall,2);
	}
	else if (self.attribute[ATR_HITPOINTS] < SPL_Cost_SummonSkeleton)	{
		PrintScreen(PRINT_NotEnoughHP,-1,-1,FONT_ScreenSmall,2);
	}
	else	{
		PrintScreen(PRINT_GOD_Beliar_Support,-1,-1,FONT_Screen,2);
		self.attribute[ATR_MANA] 		-= SPL_Cost_SummonSkeleton / 4;
		self.attribute[ATR_HITPOINTS]	-= SPL_Cost_SummonSkeleton;
		Wld_InsertNpc(Summoned_Skeleton,Npc_GetNearestWP(self));
		self.aivar[AIV_SummonedTime] = 5 * MONSTER_SUMMON_TIME;	//живет дольше, чем из свитка
		//Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
	};
	Info_ClearChoices(PC_PrayIdol_Summon);
};
func void PC_PrayIdol_Summon_GobboSkeleton()
{
	PrayCounter_Beliar += 1;
	if (self.attribute[ATR_MANA] < SPL_Cost_SummonGoblinSkeleton / 4)	{
		PrintScreen(PRINT_NotEnoughMana,-1,-1,FONT_ScreenSmall,2);
	}
	else if (self.attribute[ATR_HITPOINTS] < SPL_Cost_SummonGoblinSkeleton)	{
		PrintScreen(PRINT_NotEnoughHP,-1,-1,FONT_ScreenSmall,2);
	}
	else	{
		PrintScreen(PRINT_GOD_Beliar_Support,-1,-1,FONT_Screen,2);
		self.attribute[ATR_MANA] 		-= SPL_Cost_SummonGoblinSkeleton / 4;
		self.attribute[ATR_HITPOINTS]	-= SPL_Cost_SummonGoblinSkeleton;
		Wld_InsertNpc(Summoned_Gobbo_Skeleton,Npc_GetNearestWP(self));
		self.aivar[AIV_SummonedTime] = 5 * MONSTER_SUMMON_TIME;	//живет дольше, чем из свитка
		//Wld_SpawnNpcRange(self,Summoned_Gobbo_Skeleton,1,500);
	};
	Info_ClearChoices(PC_PrayIdol_Summon);
};

// ---------------------------------------
instance PC_PrayIdol_PrayBerny(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PrayIdol_PrayBerny_Condition;
	information = PC_PrayIdol_PrayBerny_Info;
	description = "Помолиться за упокой души Берни.";
	permanent = TRUE;
};


func int PC_PrayIdol_PrayBerny_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && MIS_Sarah_OldFriends_BernyPray)
	{
		return TRUE;
	};
};

func void PC_PrayIdol_PrayBerny_Info()
{
	Info_ClearChoices(PC_PrayIdol_PrayBerny);
	Info_AddChoice(PC_PrayIdol_PrayBerny,Dialog_Back,PC_PrayIdol_PrayBerny_Back);
	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Info_AddChoice(PC_PrayIdol_PrayBerny,"Пожертвовать 100 золотых монет.",PC_PrayIdol_PrayBerny_SmallPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Info_AddChoice(PC_PrayIdol_PrayBerny,"Пожертвовать 200 золотых монет.",PC_PrayIdol_PrayBerny_MediumPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Info_AddChoice(PC_PrayIdol_PrayBerny,"Пожертвовать 500 золотых монет.",PC_PrayIdol_PrayBerny_BigPay);
	};
};
func void PC_PrayIdol_PrayBerny_Back()
{
	Info_ClearChoices(PC_PrayIdol_PrayBerny);
};
func void PC_PrayIdol_PrayBerny_Pay(var int pay)
{
	PrayCounter_Beliar += 1;
	PrintScreen("Белиар внимает твоим мольбам.",-1,-1,FONT_Screen,2);
	Npc_RemoveInvItems(hero,ItMi_Gold,pay);
	Info_ClearChoices(PC_PrayIdol_PrayBerny);
	MIS_Sarah_OldFriends_BernyPray = FALSE;
};
func void PC_PrayIdol_PrayBerny_SmallPay()
{
	PC_PrayIdol_PrayBerny_Pay(100);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayBeliar);
};

func void PC_PrayIdol_PrayBerny_MediumPay()
{
	PC_PrayIdol_PrayBerny_Pay(200);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayBeliar);
};

func void PC_PrayIdol_PrayBerny_BigPay()
{
	PC_PrayIdol_PrayBerny_Pay(500);
	Wld_InsertNpc(OUT_1214_OldBerny,Npc_GetNearestWP(hero));
	b_endproductiondialog();
};

// ---------------------------------------
instance PC_PrayIdol_BlessHeart(C_Info)
{
	npc = PC_Hero;			nr = 11;
	condition = PC_PrayIdol_BlessHeart_Condition;
	information = PC_PrayIdol_BlessHeart_Info;
	description = "Благословить гриб-сердце.";
	permanent = TRUE;
};


func int PC_PrayIdol_BlessHeart_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && Npc_HasItems(hero,ItMr_Heart) && (PATRONGOD == PATRONGOD_Beliar))
	{
		return TRUE;
	};
};

func void PC_PrayIdol_BlessHeart_Info()
{
	PrayCounter_Beliar += 1;
	PrintScreen("Белиар наполняет силой этот сосуд",-1,-1,FONT_Screen,2);
	PrintScreen("Получен благословленный гриб-сердце",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItem(hero,ItMr_Heart);
	CreateInvItem(hero,ItMr_Heart_Blessed);
};

// ============================================

func void PrayIdol_S1()
{
	if(Npc_IsPlayer(self))
	{
		//Иннос гневается
		if(PATRONGOD == PATRONGOD_Innos)
		{
			AI_PrintScreen(PRINT_GOD_Innos_Rage,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
			Wld_PlayEffect("SPELLFX_PYROKINESIS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_PYROKINESIS_SPREAD",self,self,0,0,0,FALSE);
		};
		
		PC_PrayIdol_End.npc = Hlp_GetInstanceID(self);
		PC_PrayIdol_PrayIdol.npc = Hlp_GetInstanceID(self);
		PC_PrayIdol_Summon.npc = Hlp_GetInstanceID(self);
		PC_PrayIdol_PrayBerny.npc = Hlp_GetInstanceID(self);
		
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYIDOL;
		AI_ProcessInfos(self);
	};
};

