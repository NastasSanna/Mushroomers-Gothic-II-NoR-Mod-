
const int SPL_Cost_TrfSheep = 10;
const int SPL_Cost_TrfScavenger = 10;
const int SPL_Cost_TrfGiantRat = 10;
const int SPL_Cost_TrfGiantBug = 10;
const int SPL_Cost_TrfWolf = 10;
const int SPL_Cost_TrfWaran = 10;
const int SPL_Cost_TrfSnapper = 10;
const int SPL_Cost_TrfWarg = 10;
const int SPL_Cost_TrfFireWaran = 10;
const int SPL_Cost_TrfLurker = 10;
const int SPL_Cost_TrfShadowbeast = 10;
const int SPL_Cost_TrfDragonSnapper = 10;

instance Spell_Transform(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	canTurnDuringInvest = 0;
};

func int Spell_Logic_TrfSheep(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfSheep) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfSheep);
		Npc_SetActiveSpellInfo(self, Sheep);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfScavenger(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfScavenger) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfScavenger);
		Npc_SetActiveSpellInfo(self, Scavenger);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfGiantRat(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfGiantRat) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfGiantRat);
		Npc_SetActiveSpellInfo(self, Giant_Rat);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfGiantBug(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfGiantBug) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfGiantBug);
		Npc_SetActiveSpellInfo(self, Giant_Bug);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWolf(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfWolf) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfWolf);
		Npc_SetActiveSpellInfo(self, Wolf);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWaran(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfWaran) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfWaran);
		Npc_SetActiveSpellInfo(self, Waran);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfSnapper(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfSnapper) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfSnapper);
		Npc_SetActiveSpellInfo(self, Snapper);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWarg(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfWarg) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfWarg);
		Npc_SetActiveSpellInfo(self, Warg);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfFireWaran(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfFireWaran) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfFireWaran);
		Npc_SetActiveSpellInfo(self, FireWaran);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfLurker(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfLurker) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfLurker);
		Npc_SetActiveSpellInfo(self, Lurker);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfShadowbeast(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfShadowbeast) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfShadowbeast);
		Npc_SetActiveSpellInfo(self, Shadowbeast);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfDragonSnapper(var int manaInvested)
{
	if(Spell_Logic_Proto(SPL_Cost_TrfDragonSnapper) == SPL_SENDCAST)
	{
		Spell_Cast_Proto(SPL_Cost_TrfDragonSnapper);
		Npc_SetActiveSpellInfo(self, DragonSnapper);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

