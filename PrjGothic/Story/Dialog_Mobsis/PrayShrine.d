
/**********************************************************************************

								Иннос

  Молитва: золото => сила, ловкость, мана.
  
Mod:
  Удалено освящение статуй.
  Если Белиар покровитель, он будет наказывать.

//*********************************************************************************/

var int PrayDay;

var string concatDonation;

var int Shrine_STR_Bonus;
var int Shrine_DEX_Bonus;
var int Shrine_MANA_Bonus;
var int SpecialBless;

func void PC_PrayInnos_PatronGod(var int level)
{
	if (PATRONGOD == PATRONGOD_Innos)	{
		if (level == 3)	{
			PrintScreen("Иннос очищает твое тело и разум.",-1,60,FONT_Screen,2);
			POISON_DrgTears_Timer = 0;
			POISON_Foggy_Timer = 0;
			POISON_Stone_Cnt = 0;
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		}
		else if (level == 2)	{
			PrintScreen("Иннос освобождает твое тело от боли и ядов.",-1,60,FONT_Screen,2);
			POISON_DrgTears_Timer = 0;
			POISON_Foggy_Timer = 0;
			POISON_Stone_Cnt = 0;
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		}
		else if (level == 1)	{
			PrintScreen("Иннос исцеляет твои раны.",-1,60,FONT_Screen,2);
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		};
	}
	else if (PATRONGOD == PATRONGOD_Beliar)	{
		PrintScreen("Иннос не слышит тебя.",-1,60,FONT_Screen,2);
	}
	else	{
		PrintScreen("Иннос благодарит тебя.",-1,60,FONT_Screen,2);
		if (level == 3)	{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		}
		else if (level == 2)	{
			other.attribute[ATR_HITPOINTS] = (other.attribute[ATR_HITPOINTS_MAX] + other.attribute[ATR_HITPOINTS_MAX]) / 2;
		}
		else if (level == 1)	{
			other.attribute[ATR_HITPOINTS] += 5;
		};
	};
};


instance PC_PrayShrine_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayShrine_End_Condition;
	information = PC_PrayShrine_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PrayShrine_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};

func void PC_PrayShrine_End_Info()
{
	b_endproductiondialog();
};


instance PC_PrayShrine_Pray(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_PrayShrine_Pray_Condition;
	information = PC_PrayShrine_Pray_Info;
	permanent = TRUE;
	description = "Помолиться";
};


func int PC_PrayShrine_Pray_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};
const int PrayShrine_STRDEX_Bonus = 1;
const int PrayShrine_MANA_Bonus = 2;
const int PrayShrine_HP_Bonus = 3;

func void PC_PrayShrine_Pray_Info()
{
	//покровитель - Белиар
	if(PATRONGOD == PATRONGOD_Beliar)
	{
		PrintScreen(PRINT_GOD_Beliar_Rage,-1,-1,FONT_Screen,2);
		if (self.attribute[ATR_HITPOINTS] > 1)	{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
		};
		Snd_Play("DEM_Die");
	};
	
	Info_ClearChoices(PC_PrayShrine_Pray);
	Info_AddChoice(PC_PrayShrine_Pray,Dialog_Back,PC_PrayShrine_Pray_Back);
	Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 0 золотых монет.",PC_PrayShrine_Pray_NoPay);
	if(Npc_HasItems(hero,ItMi_Gold) >= 10)
	{
		Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 10 золотых монет.",PC_PrayShrine_Pray_SmallPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 50 золотых монет.",PC_PrayShrine_Pray_MediumPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 100 золотых монет.",PC_PrayShrine_Pray_BigPay);
	};
	//адептам Инноса - больше!
	if (PATRONGOD == PATRONGOD_Innos)	{
		PrayShrine_STRDEX_Bonus = 2;
		PrayShrine_MANA_Bonus = 3;
		PrayShrine_HP_Bonus = 5;
	};
};

func void PC_PrayShrine_Pray_Back()
{
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_NoPay()
{
	PrayCounter_Innos += 1;
	var int zufall;
	zufall = C_Random(100);
	if(PrayDay >= Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if(zufall < 5)
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	}
	else
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	};
	PrayDay = Wld_GetDay() + 1;
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_SmallPay()
{
	PrayCounter_Innos += 1;
	Npc_RemoveInvItems(hero,ItMi_Gold,10);
	if(PrayDay >= Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	};
	PrayDay = Wld_GetDay()  + 1;
	PC_PrayInnos_PatronGod(1);
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_MediumPay()
{
	Npc_RemoveInvItems(hero,ItMi_Gold,50);
	if(PrayDay >= Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,2);
	};
	PrayDay = Wld_GetDay() + 1;
	PC_PrayInnos_PatronGod(2);
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_BigPay()
{
	PrayCounter_Innos += 1;
	var int zufall;
	zufall = C_Random(100);
	Npc_RemoveInvItems(hero,ItMi_Gold,100);
	PC_PrayInnos_PatronGod(3);
	if(PrayDay >= Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if ((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV))
	{
		if ((Shrine_MANA_Bonus < 20) && (zufall < 95))
		{
			B_BlessAttribute(hero,ATR_MANA_MAX,PrayShrine_HP_Bonus);
			Shrine_MANA_Bonus += 1;
		}
		else if((Shrine_STR_Bonus < 5) && (zufall < 50))
		{
			B_BlessAttribute(hero,ATR_STRENGTH,PrayShrine_STRDEX_Bonus);
			Shrine_STR_Bonus += 1;
		}
		else if(Shrine_DEX_Bonus < 5)
		{
			B_BlessAttribute(hero,ATR_DEXTERITY,PrayShrine_STRDEX_Bonus);
			Shrine_DEX_Bonus += 1;
		}
		else
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,PrayShrine_HP_Bonus);
		};
	}
	else if ((hero.guild == GIL_SLD))
	{
		if((Shrine_STR_Bonus < 10) && (zufall < 50))
		{
			B_BlessAttribute(hero,ATR_STRENGTH,PrayShrine_STRDEX_Bonus);
			Shrine_STR_Bonus += 1;
		}
		else if(Shrine_DEX_Bonus < 10)
		{
			B_BlessAttribute(hero,ATR_DEXTERITY,PrayShrine_STRDEX_Bonus);
			Shrine_DEX_Bonus += 1;
		}
		else if (Shrine_MANA_Bonus < 5)
		{
			B_BlessAttribute(hero,ATR_MANA_MAX,PrayShrine_MANA_Bonus);
			Shrine_MANA_Bonus += 1;
		}
		else
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,PrayShrine_HP_Bonus);
		};
	}
	else if (hero.guild == GIL_PAL)
	{
		if((Shrine_STR_Bonus < 10) && (zufall < 40))
		{
			B_BlessAttribute(hero,ATR_STRENGTH,PrayShrine_STRDEX_Bonus);
			Shrine_STR_Bonus += 1;
		}
		else if ((Shrine_DEX_Bonus < 10) && (zufall < 80))
		{
			B_BlessAttribute(hero,ATR_DEXTERITY,PrayShrine_STRDEX_Bonus);
			Shrine_DEX_Bonus += 1;
		}
		else if (Shrine_MANA_Bonus < 20)
		{
			B_BlessAttribute(hero,ATR_MANA_MAX,PrayShrine_MANA_Bonus);
			Shrine_MANA_Bonus += 1;
		}
		else
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,PrayShrine_HP_Bonus);
		};
	}
	else
	{
		if ((Shrine_STR_Bonus < 10) && (zufall < 40))
		{
			B_BlessAttribute(hero,ATR_STRENGTH,PrayShrine_STRDEX_Bonus);
			Shrine_STR_Bonus += 1;
		}
		else if ((Shrine_DEX_Bonus < 10) && (zufall < 80))
		{
			B_BlessAttribute(hero,ATR_DEXTERITY,PrayShrine_STRDEX_Bonus);
			Shrine_DEX_Bonus += 1;
		}
		else if (Shrine_MANA_Bonus < 20)
		{
			B_BlessAttribute(hero,ATR_MANA_MAX,PrayShrine_MANA_Bonus);
			Shrine_MANA_Bonus += 1;
		}
		else
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,PrayShrine_HP_Bonus);
		};
	}	;
	PrayDay = Wld_GetDay() + 1;
	Info_ClearChoices(PC_PrayShrine_Pray);
};

// ---------------------------------------
instance PC_PrayShrine_PrayBerny(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PrayShrine_PrayBerny_Condition;
	information = PC_PrayShrine_PrayBerny_Info;
	description = "Помолиться за упокой души Берни.";
	permanent = TRUE;
};


func int PC_PrayShrine_PrayBerny_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && MIS_Sarah_OldFriends_BernyPray)
	{
		return TRUE;
	};
};

func void PC_PrayShrine_PrayBerny_Info()
{
	Info_ClearChoices(PC_PrayShrine_PrayBerny);
	Info_AddChoice(PC_PrayShrine_PrayBerny,Dialog_Back,PC_PrayShrine_PrayBerny_Back);
	Info_AddChoice(PC_PrayShrine_PrayBerny,"Пожертвовать 0 золотых монет.",PC_PrayShrine_PrayBerny_NoPay);
	if(Npc_HasItems(hero,ItMi_Gold) >= 10)
	{
		Info_AddChoice(PC_PrayShrine_PrayBerny,"Пожертвовать 10 золотых монет.",PC_PrayShrine_PrayBerny_SmallPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Info_AddChoice(PC_PrayShrine_PrayBerny,"Пожертвовать 50 золотых монет.",PC_PrayShrine_PrayBerny_MediumPay);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Info_AddChoice(PC_PrayShrine_PrayBerny,"Пожертвовать 100 золотых монет.",PC_PrayShrine_PrayBerny_BigPay);
	};
};
func void PC_PrayShrine_PrayBerny_Back()
{
	Info_ClearChoices(PC_PrayShrine_PrayBerny);
};
func void PC_PrayShrine_PrayBerny_NoPay()
{
	PrintScreen("Иннос не слышит тебя",-1,-1,FONT_Screen,2);
	Info_ClearChoices(PC_PrayShrine_PrayBerny);
};
func void PC_PrayShrine_PrayBerny_Pay(var int pay)
{
	PrintScreen("Иннос слышит твои молитвы.",-1,-1,FONT_Screen,2);
	Npc_RemoveInvItems(hero,ItMi_Gold,pay);
	B_GivePlayerXP(pay);
	Info_ClearChoices(PC_PrayShrine_PrayBerny);
	MIS_Sarah_OldFriends_BernyPray = FALSE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayInnos);
};
func void PC_PrayShrine_PrayBerny_SmallPay()
{
	PrayCounter_Innos += 1;
	PC_PrayShrine_PrayBerny_Pay(10);
};

func void PC_PrayShrine_PrayBerny_MediumPay()
{
	PrayCounter_Innos += 1;
	PC_PrayShrine_PrayBerny_Pay(50);
};

func void PC_PrayShrine_PrayBerny_BigPay()
{
	PrayCounter_Innos += 1;
	PC_PrayShrine_PrayBerny_Pay(100);
};


// ---------------------------------------
instance PC_PrayShrine_BlessGoldPlate(C_Info)
{
	npc = PC_Hero;			nr = 11;
	condition = PC_PrayShrine_BlessGoldPlate_Condition;
	information = PC_PrayShrine_BlessGoldPlate_Info;
	description = "Благословить золотую чашу.";
	permanent = TRUE;
};


func int PC_PrayShrine_BlessGoldPlate_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && Npc_HasItems(hero,ItMr_GoldPlate) && (PATRONGOD == PATRONGOD_Innos))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_BlessGoldPlate_Info()
{
	PrayCounter_Innos += 1;
	PrintScreen("Иннос наполняет благодатью сей сосуд",-1,-1,FONT_Screen,2);
	PrintScreen("Получена благословленная золотая чаша",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItem(hero,ItMr_GoldPlate);
	CreateInvItem(hero,ItMr_GoldPlate_Blessed);
};

// ======================================
func void PrayShrine_S1()
{
	if(Npc_IsPlayer(self))
	{
//		C_IsShrineObsessed(self);
//		if(ShrineIsObsessed == TRUE)
		if(PATRONGOD == PATRONGOD_Beliar)
		{
			AI_PrintScreen(PRINT_GOD_Beliar_Rage,-1,YPOS_ItemTaken,FONT_Screen,2);
			Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
		};
		PC_PrayShrine_End.npc = Hlp_GetInstanceID(self);
		PC_PrayShrine_Pray.npc = Hlp_GetInstanceID(self);
		PC_PrayShrine_PrayBerny.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PrayShrine;
		AI_ProcessInfos(self);
	};
};
