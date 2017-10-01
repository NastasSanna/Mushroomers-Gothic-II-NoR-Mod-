
//ГГ судят за преступление

func void B_HeroCrimeVerdict_City()
{
	//в казармах, к судье
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	B_StartOtherRoutine(Vlk_402_Richter,"COURT");
	B_StartOtherRoutine(MIL_312_Wulfgar,"COURT");
	B_StartOtherRoutine(Mil_329_Miliz,"COURT");
	B_StartOtherRoutine(Mil_330_Miliz,"COURT");
	AI_Teleport(hero,"FP_HERO_VERDICT");
	AI_StandUpQuick(hero);
	B_SetTime(10,0);
	hero.attribute[ATR_HITPOINTS] = 10;
};

func void B_HeroCrimeVerdict_Farm()
{
	//к Онару
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	B_StartOtherRoutine(Bau_900_Onar,"COURT");
	AI_Teleport(hero,"START_ELENA");
	AI_StandUpQuick(hero);
	B_SetTime(10,0);
	hero.attribute[ATR_HITPOINTS] = 10;
};

func void B_HeroCrimeVerdict_Monastery()
{
	//к Пирокару
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	KDF_500_Pyrokar.npcType = npctype_main;
	AI_Teleport(hero,"NW_MONASTERY_CHURCH_04");
	AI_StandUpQuick(hero);
	B_SetTime(10,0);
	hero.attribute[ATR_HITPOINTS] = 10;
};

