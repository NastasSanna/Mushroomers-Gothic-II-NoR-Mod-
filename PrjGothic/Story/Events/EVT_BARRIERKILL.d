

func void EVT_BARRIERKILL()
{
	PrintScreen("Не следовало подходить так близко к Барьеру...",-1,10,FONT_Screen,5);
//	Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",hero,hero,0,0,0,FALSE);
//	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
//	Npc_ChangeAttribute(hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS]);
	AI_Teleport(hero,"NW_TO_PASS_01");
//	ExitSession();
};