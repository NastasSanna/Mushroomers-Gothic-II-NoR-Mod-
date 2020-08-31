//обычные цены и эффекты грибов

//								Value	HP		Mana	STR		DEX
const int Value_Mr_Stone = 		5;
const int HP_Mr_Stone = 				5;
const int Mana_Mr_Stone = 				3;
const int AntiBonus_STR_Mr_Stone = 		-5;

const int Value_Mr_Piny = 		12;
const int Bonus_HP_Mr_Piny = 			6;

const int Value_Mr_Red = 		5;

const int Value_Mr_Bottle = 	8;
const int HP_Mr_Bottle_Top = 			10;
const int HP_Mr_Bottle_Bottom = 		-15;

const int Value_Mr_BrownOiler = 15;
const int Mana_Mr_BrownOiler = 					15;

const int Value_Mr_Governor = 	40;
const int HP_Mr_Governor = 				15;
const int Bonus_HP_Mr_Governor = 			15;
const int Bonus_HP_Mr_Governor_Cnt = 28;

const int Value_Mr_Oyster = 	16;
const int HP_Mr_Oyster = 				20;
const int Mana_Mr_Oyster = 						20;

const int Value_Mr_LadysEar = 	2;
const int HP_Mr_LadysEar = 				7;
const int Mana_Mr_LadysEar = 					-14;

const int Value_Mr_Ivy = 4;
const int Sleep_Time_Ivy = 10;
const float Sleep_Time_Ivyf = 10.0;

const int Bonus_Mr_Trident = 10;

const int Bonus_Mr_DragonTears = 10;

const int ProtFire_Mr_NightSparkles = 15;

const int Value_Mr_Branch = 	25;
const int Mana_Mr_Branch = 						5;
const int Bonus_Mana_Mr_Branch = 					2;

const int Value_Mr_Sunrise = 	10;
const int HP_Mr_Sunrise =				 -10;
const int Bonus_DEX_Mr_Sunrise = 								1;

const int Value_Mr_KeilSmall = 	50;
const int HP_Mr_KeilSmall = 			8;	//???
const int Bonus_STR_Mr_KeilSmall = 						1;
const int Bonus_STR_Mr_KeilSmall_Cnt = 15;

const int AntiBonus_HP_Mr_Foggy = 		-5;

const int Bonus_HP_Mr_GoldPlate = 20;
const int Bonus_Mana_Mr_GoldPlate = 30;

const int Bonus_Prot_Mr_Heart = 10;
const int Bonus_Prot2_Mr_Heart = 5;
const int Bonus_STR_Mr_Heart =							10;
const int Bonus_DEX_Mr_Heart = 									5;

const int AntiBonus_HP_Mr_Bottle = 		-10;
const int Bonus_HP_Mr_Bottle = 			5;

const int Value_Mushroom_01 = 	10;
const int HP_Mushroom_01 = 				5;

const int Value_Mushroom_02 = 	30;
const int HP_Mushroom_02 = 				15;

func string GetRandWay(var string WP_name)
{
//	MEM_Debug(ConcatStrings("GetRandWay, WP = ", WP_name));
	var zCWaypoint WP; WP = _^(zCWayNet_GetWaypoint(WP_name));
	var int prevWP; prevWP = 0;
	var oCWay way;
	var zCList lst;	lst = _^(WP.wayList_next);
	var int loop;	loop = MEM_StackPos.position;
	if (lst.data)	{
		way = _^(lst.data);
		if (way.left && (way.left != prevWP) && (Hlp_Random(100) < 35))	{
			WP = _^(way.left);
		}
		else if (way.right && (way.right != prevWP) && (Hlp_Random(100) < 35))	{
			WP = _^(way.right);
		};
//		MEM_Debug(ConcatStrings("next WP = ", WP.name));
		prevWP = _@(WP);
	};
	if (Hlp_Random(1000) < 999) {
		if (lst.next)	{
			lst = _^(lst.next);
		}
		else
		{
			lst = _^(WP.wayList_next);
		};
		MEM_StackPos.position = loop;
	};
//	MEM_Debug(ConcatStrings("found WP = ", WP.name));
	return WP.name;
};

//туманник вызывает провалы памяти
func void B_Foggy_Templapse()
{
	PrintScreen("Какое странное чувство...",-1,-1,FONT_Screen,3);
	Wld_PlayEffect("POISON_FOG_SLOW",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	AI_Wait(hero, 2);
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	var string WP;
	WP = Npc_GetNearestWP(hero);
	WP = GetRandWay(WP);
	AI_Teleport(hero, WP);
	var int time; time = 15 + Hlp_Random(60);
	B_SetTimePlus(0,time);
	AI_Wait(hero, 1.5);
	AI_PrintScreen("Где я?",-1,-1,FONT_Screen,3);
};


