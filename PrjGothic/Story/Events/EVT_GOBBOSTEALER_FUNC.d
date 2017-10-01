
var int EVT_GOBBOSTEALER_FUNC_ONCE;

//когда входим в пещеру возле башни  сардаса, по€вл€етс€ гоблин и утаскивает наши вещи
func void EVT_GOBBOSTEALER_FUNC()
{
	if (EVT_GOBBOSTEALER_FUNC_ONCE)	{return;};
	EVT_GOBBOSTEALER_FUNC_ONCE = TRUE;
	
	var C_NPC slf;	slf = Hlp_GetNpc(Gobbo_Green_Stealer);
	if (!Hlp_IsValidNpc(slf))	{	return;	};
	Npc_ClearAIQueue(slf);
//	AI_Teleport(slf,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_02");
//	AI_SetWalkMode(slf,NPC_RUN_WEAPON);
	AI_GotoWP(slf,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
//	AI_StartState(slf,ZS_RunToWP,0,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_GOBBO");
	Wld_SpawnNpcRange(hero,Gobbo_Green,2,100);
	
	
	if (Npc_HasItems(hero, ItMi_Gold) > 200)	{
		Npc_RemoveInvItems	(hero,ItMi_Gold, 200);
		CreateInvItems		(slf,ItMi_Gold, 200);
	}
	else	if (Npc_HasItems(hero, ItMi_Gold) > 50)	{
		var int GldAmount;	GldAmount = Npc_HasItems(hero, ItMi_Gold);
		Npc_RemoveInvItems	(hero,ItMi_Gold, GldAmount);
		CreateInvItems		(slf,ItMi_Gold, GldAmount);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldCandleHolder))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldCandleHolder, 1);
		CreateInvItems		(slf,ItMi_GoldCandleHolder, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldChalice))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldChalice, 1);
		CreateInvItems		(slf,ItMi_GoldChalice, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldChest))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldChest, 1);
		CreateInvItems		(slf,ItMi_GoldChest, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldCup))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldCup, 1);
		CreateInvItems		(slf,ItMi_GoldCup, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldNecklace))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldNecklace, 1);
		CreateInvItems		(slf,ItMi_GoldNecklace, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldPlate))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldPlate, 1);
		CreateInvItems		(slf,ItMi_GoldPlate, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_GoldRing))	{
		Npc_RemoveInvItems	(hero,ItMi_GoldRing, 1);
		CreateInvItems		(slf,ItMi_GoldRing, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverCandleHolder))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverCandleHolder, 1);
		CreateInvItems		(slf,ItMi_SilverCandleHolder, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverChalice))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverChalice, 1);
		CreateInvItems		(slf,ItMi_SilverChalice, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverCup))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverCup, 1);
		CreateInvItems		(slf,ItMi_SilverCup, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverNecklace))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverNecklace, 1);
		CreateInvItems		(slf,ItMi_SilverNecklace, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverPlate))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverPlate, 1);
		CreateInvItems		(slf,ItMi_SilverPlate, 1);
	}
	else	if (Npc_HasItems(hero, ItMi_SilverRing))	{
		Npc_RemoveInvItems	(hero,ItMi_SilverRing, 1);
		CreateInvItems		(slf,ItMi_SilverRing, 1);
	}
	else	if (Npc_HasEquippedMeleeWeapon(hero) && !Npc_IsInFightMode(hero, FMODE_MELEE))	{
		var C_ITEM weapon;	weapon = Npc_GetEquippedMeleeWeapon(hero);
		var int weaponInst;	weaponInst = Hlp_GetInstanceID(weapon);
		Npc_RemoveInvItems	(hero,weaponInst, 1);
		CreateInvItems		(slf,weaponInst, 1);
	}
	else	{
		AI_PrintScreen("√р€зный гоблиненыш пыталс€ обокрасть мен€!",-1,30,FONT_ScreenSmall, 3);
		AI_PrintScreen("’орошо, что при мне не было ничего ценного.",-1,35,FONT_ScreenSmall, 3);
		B_Say_Overlay(hero,hero,"$HANDSOFF");
		return;
	};
	AI_PrintScreen("Ётот паршивый гоблин обокрал мен€!",-1,30,FONT_Screen, 3);
};
