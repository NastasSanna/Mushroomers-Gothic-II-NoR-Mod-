
var int Truemmer_Count;
var int Learn_by_doing;

func int B_GoldMob_Bestimmung()
{
	/*if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_01") && (GoldMob_01_AmounT_MAX > GoldMob_01_Amount))
	{
		GoldMob_01_Amount = GoldMob_01_Amount + 1;
		return TRUE;
	};*/
	return FALSE;
};

instance PC_Goldhacken_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Goldhacken_End_Condition;
	information = PC_Goldhacken_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_Goldhacken_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void PC_Goldhacken_End_Info()
{
	Truemmer_Count = 0;
	b_endproductiondialog();
};


instance PC_Goldhacken_Addon_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Addon_Hour_Condition;
	information = PC_Goldhacken_Addon_Hour_Info;
	permanent = TRUE;
	description = "”дарить несильно.";
};


func int PC_Goldhacken_Addon_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};


var int GoldCounter;

func void PC_Goldhacken_Addon_Hour_Info()
{
	var int CurrentChance;
	var int MultiNugget;
	Learn_by_doing = Learn_by_doing + 1;
	if(Learn_by_doing == 10)
	{
		B_Upgrade_Hero_HackChance(2);
	}
	else if(Learn_by_doing == 15)
	{
		B_Upgrade_Hero_HackChance(3);
	}
	else if(Learn_by_doing == 20)
	{
		B_Upgrade_Hero_HackChance(5);
	};
	CurrentChance = C_Random(100);
	MultiNugget = C_Random(10);
	if(B_GoldMob_Bestimmung() == TRUE)
	{
		if(CurrentChance <= Hero_HackChance)
		{
			if((GoldCounter >= 20) && (MultiNugget >= 8))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,3);
				PrintScreen("ƒобыто 3 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
			}
			else if((GoldCounter >= 7) && (MultiNugget >= 5))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,2);
				PrintScreen("ƒобыто 2 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
				GoldCounter = GoldCounter + 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,1);
				PrintScreen("ƒобыт 1 золотой самородок!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
				GoldCounter = GoldCounter + 1;
			};
		}
		else
		{
			PrintScreen("«олотые осколки разлетаютс€ во все стороны...",-1,-1,FONT_ScreenSmall,2);
			Truemmer_Count = Truemmer_Count + 1;
		};
	}
	else
	{
		PrintScreen("«десь больше нечего делать.",-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};


instance PC_Goldhacken_Addon_TSchlag(C_Info)
{
	npc = PC_Hero;
	nr = 997;
	condition = PC_Goldhacken_Addon_TSchlag_Condition;
	information = PC_Goldhacken_Addon_TSchlag_Info;
	permanent = TRUE;
	description = "”дарить изо всех сил.";
};


func int PC_Goldhacken_Addon_TSchlag_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (Truemmer_Count >= 2) && (Knows_Truemmerschlag == TRUE))
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Addon_TSchlag_Info()
{
	var int TruemmerChance;
	TruemmerChance = C_Random(100);
	if(TruemmerChance < 5)
	{
		PrintScreen("Ќичего...",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		Snd_Play("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		if(TruemmerChance >= 85)
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,3);
			PrintScreen("ƒобыто 3 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
		}
		else if(TruemmerChance >= 50)
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,2);
			PrintScreen("ƒобыто 2 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
		}
		else
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,1);
			PrintScreen("ƒобыт 1 золотой самородок!",-1,-1,FONT_ScreenSmall,2);
		};
	};
	Truemmer_Count = 0;
};


instance PC_Goldhacken_Addon_Chance(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = PC_Goldhacken_Addon_Chance_Condition;
	information = PC_Goldhacken_Addon_Chance_Info;
	permanent = TRUE;
	description = "(проверить свой навык)";
};


func int PC_Goldhacken_Addon_Chance_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Addon_Chance_Info()
{
	var string concatText;
	if(Hero_HackChance < 20)
	{
		concatText = ConcatStrings("совершенный новичок (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 40)
	{
		concatText = ConcatStrings("вполне сносный работник (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 55)
	{
		concatText = ConcatStrings("опытный золотоискатель (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 75)
	{
		concatText = ConcatStrings("насто€щий рудокоп ( ",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 90)
	{
		concatText = ConcatStrings("чертовски хороший рудокоп ( ",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 98)
	{
		concatText = ConcatStrings("великий рудокоп ( ",IntToString(Hero_HackChance));
	}
	else
	{
		concatText = ConcatStrings("гуру среди рудокопов ( ",IntToString(Hero_HackChance));
	};
	concatText = ConcatStrings(concatText," %)");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};


// ========================================

func void Goldhacken_S1()
{
	if(Npc_IsPlayer(self))
	{
		PC_Goldhacken_End.npc = Hlp_GetInstanceID(self);
		PC_Goldhacken_Addon_Chance.npc = Hlp_GetInstanceID(self);
		PC_Goldhacken_Addon_Hour.npc = Hlp_GetInstanceID(self);
		PC_Goldhacken_Addon_TSchlag.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_GOLDHACKEN;
		AI_ProcessInfos(self);
	};
};
