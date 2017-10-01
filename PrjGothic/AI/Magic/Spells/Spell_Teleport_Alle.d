
const int SPL_Cost_Teleport = 10;

func void B_PrintTeleportTooFarAway(var int level)
{
	if(level != CurrentLevel)
	{
		PrintScreen(PRINT_TeleportTooFarAway,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};

instance Spell_Teleport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

func int Spell_Logic_Teleport_Proto()
{
	return Spell_Logic_Proto(SPL_Cost_Teleport);
};

func void Spell_Cast_Teleport_Proto(var int level, var string wp)
{
	B_PrintTeleportTooFarAway(level);
	Spell_Cast_Proto(SPL_Cost_Teleport);
	AI_Teleport(self,wp);
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

// -------------------------------------------------------------------

func int Spell_Logic_PalTeleportSecret(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_PalTeleportSecret()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"NW_PAL_SECRETCHAMBER");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportSeaport(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportSeaport()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"HAFEN");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportMonastery(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportMonastery()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"KLOSTER");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportFarm(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportFarm()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"BIGFARM");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportXardas(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportXardas()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"XARDAS");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportPassNW(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportPassNW()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"LEVELCHANGE");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportPassOW(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportPassOW()
{
	Spell_Cast_Teleport_Proto(OldWorld_Zen,"SPAWN_MOLERAT02_SPAWN01");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportOC(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportOC()
{
	Spell_Cast_Teleport_Proto(OldWorld_Zen,"OC_MAGE_CENTER");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportOWDemonTower(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportOWDemonTower()
{
	Spell_Cast_Teleport_Proto(OldWorld_Zen,"DT_E3_03");
};

// -------------------------------------------------------------------

func int Spell_Logic_TeleportTaverne(var int manaInvested)
{
	return Spell_Logic_Teleport_Proto();
};

func void Spell_Cast_TeleportTaverne()
{
	Spell_Cast_Teleport_Proto(NEWWORLD_ZEN,"NW_TAVERNE_04");
};

// -------------------------------------------------------------------

func void Spell_Cast_Teleport()
{
	if(Npc_GetActiveSpell(self) == SPL_PalTeleportSecret)
	{
		Spell_Cast_PalTeleportSecret();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportSeaport)
	{
		Spell_Cast_TeleportSeaport();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportMonastery)
	{
		Spell_Cast_TeleportMonastery();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportFarm)
	{
		Spell_Cast_TeleportFarm();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportXardas)
	{
		Spell_Cast_TeleportXardas();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassNW)
	{
		Spell_Cast_TeleportPassNW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassOW)
	{
		Spell_Cast_TeleportPassOW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOC)
	{
		Spell_Cast_TeleportOC();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)
	{
		Spell_Cast_TeleportOWDemonTower();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportTaverne)
	{
		Spell_Cast_TeleportTaverne();
	};
};

