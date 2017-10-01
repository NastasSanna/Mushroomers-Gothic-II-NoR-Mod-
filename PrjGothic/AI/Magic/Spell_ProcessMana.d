
func int Spell_ProcessMana(var int manaInvested)
{
	var int Result;
	Result = SPL_SENDSTOP;
	// выбор заклинания
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_PalLight)
	{
		Result = Spell_Logic_PalLight(manaInvested);
	}
	else if(activeSpell == SPL_PalLightHeal)
	{
		Result = Spell_Logic_PalLightHeal(manaInvested);
	}
	else if(activeSpell == SPL_PalHolyBolt)
	{
		Result = Spell_Logic_PalHolyBolt(manaInvested);
	}
	else if(activeSpell == SPL_PalMediumHeal)
	{
		Result = Spell_Logic_PalMediumHeal(manaInvested);
	}
	else if(activeSpell == SPL_PalRepelEvil)
	{
		Result = Spell_Logic_PalRepelEvil(manaInvested);
	}
	else if(activeSpell == SPL_PalFullHeal)
	{
		Result = Spell_Logic_PalFullHeal(manaInvested);
	}
	else if(activeSpell == SPL_PalDestroyEvil)
	{
		Result = Spell_Logic_PalDestroyEvil(manaInvested);
	}
	else if(activeSpell == SPL_PalTeleportSecret)
	{
		Result = Spell_Logic_PalTeleportSecret(manaInvested);
	}
	else if(activeSpell == SPL_TeleportSeaport)
	{
		Result = Spell_Logic_TeleportSeaport(manaInvested);
	}
	else if(activeSpell == SPL_TeleportMonastery)
	{
		Result = Spell_Logic_TeleportMonastery(manaInvested);
	}
	else if(activeSpell == SPL_TeleportFarm)
	{
		Result = Spell_Logic_TeleportFarm(manaInvested);
	}
	else if(activeSpell == SPL_TeleportXardas)
	{
		Result = Spell_Logic_TeleportXardas(manaInvested);
	}
	else if(activeSpell == SPL_TeleportPassNW)
	{
		Result = Spell_Logic_TeleportPassNW(manaInvested);
	}
	else if(activeSpell == SPL_TeleportPassOW)
	{
		Result = Spell_Logic_TeleportPassOW(manaInvested);
	}
	else if(activeSpell == SPL_TeleportOC)
	{
		Result = Spell_Logic_TeleportOC(manaInvested);
	}
	else if(activeSpell == SPL_TeleportOWDemonTower)
	{
		Result = Spell_Logic_TeleportOWDemonTower(manaInvested);
	}
	else if(activeSpell == SPL_TeleportTaverne)
	{
		Result = Spell_Logic_TeleportTaverne(manaInvested);
	}
	else if(activeSpell == SPL_Light)
	{
		Result = Spell_Logic_Light(manaInvested);
	}
	else if(activeSpell == SPL_Firebolt)
	{
		Result = Spell_Logic_Firebolt(manaInvested);
	}
	else if(activeSpell == SPL_Icebolt)
	{
		Result = Spell_Logic_IceBolt(manaInvested);
	}
	else if(activeSpell == SPL_Zap)
	{
		Result = Spell_Logic_Zap(manaInvested);
	}
	else if(activeSpell == SPL_LightHeal)
	{
		Result = Spell_Logic_LightHeal(manaInvested);
	}
	else if(activeSpell == SPL_SummonGoblinSkeleton)
	{
		Result = Spell_Logic_SummonGoblinSkeleton(manaInvested);
	}
	else if(activeSpell == SPL_InstantFireball)
	{
		Result = Spell_Logic_InstantFireball(manaInvested);
	}
	else if(activeSpell == SPL_SummonWolf)
	{
		Result = Spell_Logic_SummonWolf(manaInvested);
	}
	else if(activeSpell == SPL_WindFist)
	{
		Result = Spell_Logic_WindFist(manaInvested);
	}
	else if(activeSpell == SPL_Sleep)
	{
		Result = Spell_Logic_Sleep(manaInvested);
	}
	else if(activeSpell == SPL_MediumHeal)
	{
		Result = Spell_Logic_MediumHeal(manaInvested);
	}
	else if(activeSpell == SPL_LightningFlash)
	{
		Result = Spell_Logic_LightningFlash(manaInvested);
	}
	else if(activeSpell == SPL_ChargeFireball)
	{
		Result = Spell_Logic_ChargeFireball(manaInvested);
	}
	else if(activeSpell == SPL_ChargeZap)
	{
		Result = Spell_Logic_ChargeZap(manaInvested);
	}
	else if(activeSpell == SPL_SummonSkeleton)
	{
		Result = Spell_Logic_SummonSkeleton(manaInvested);
	}
	else if(activeSpell == SPL_Fear)
	{
		Result = Spell_Logic_Fear(manaInvested);
	}
	else if(activeSpell == SPL_IceCube)
	{
		Result = Spell_Logic_IceCube(manaInvested);
	}
	else if(activeSpell == SPL_ChargeZap)
	{
		Result = Spell_Logic_ChargeZap(manaInvested);
	}
	else if(activeSpell == SPL_SummonGolem)
	{
		Result = Spell_Logic_SummonGolem(manaInvested);
	}
	else if(activeSpell == SPL_DestroyUndead)
	{
		Result = Spell_Logic_DestroyUndead(manaInvested);
	}
	else if(activeSpell == SPL_Pyrokinesis)
	{
		Result = Spell_Logic_Pyrokinesis(manaInvested);
	}
	else if(activeSpell == SPL_Firestorm)
	{
		Result = Spell_Logic_Firestorm(manaInvested);
	}
	else if(activeSpell == SPL_IceWave)
	{
		Result = Spell_Logic_IceWave(manaInvested);
	}
	else if(activeSpell == SPL_SummonDemon)
	{
		Result = Spell_Logic_SummonDemon(manaInvested);
	}
	else if(activeSpell == SPL_FullHeal)
	{
		Result = Spell_Logic_FullHeal(manaInvested);
	}
	else if(activeSpell == SPL_Firerain)
	{
		Result = Spell_Logic_Firerain(manaInvested);
	}
	else if(activeSpell == SPL_BreathOfDeath)
	{
		Result = Spell_Logic_BreathOfDeath(manaInvested);
	}
	else if(activeSpell == SPL_MassDeath)
	{
		Result = Spell_Logic_Massdeath(manaInvested);
	}
	else if(activeSpell == SPL_ArmyOfDarkness)
	{
		Result = Spell_Logic_ArmyOfDarkness(manaInvested);
	}
	else if(activeSpell == SPL_Shrink)
	{
		Result = Spell_Logic_Shrink(manaInvested);
	}
	else if(activeSpell == SPL_TrfSheep)
	{
		Result = Spell_Logic_TrfSheep(manaInvested);
	}
	else if(activeSpell == SPL_TrfScavenger)
	{
		Result = Spell_Logic_TrfScavenger(manaInvested);
	}
	else if(activeSpell == SPL_TrfGiantRat)
	{
		Result = Spell_Logic_TrfGiantRat(manaInvested);
	}
	else if(activeSpell == SPL_TrfGiantBug)
	{
		Result = Spell_Logic_TrfGiantBug(manaInvested);
	}
	else if(activeSpell == SPL_TrfWolf)
	{
		Result = Spell_Logic_TrfWolf(manaInvested);
	}
	else if(activeSpell == SPL_TrfWaran)
	{
		Result = Spell_Logic_TrfWaran(manaInvested);
	}
	else if(activeSpell == SPL_TrfSnapper)
	{
		Result = Spell_Logic_TrfSnapper(manaInvested);
	}
	else if(activeSpell == SPL_TrfWarg)
	{
		Result = Spell_Logic_TrfWarg(manaInvested);
	}
	else if(activeSpell == SPL_TrfFireWaran)
	{
		Result = Spell_Logic_TrfFireWaran(manaInvested);
	}
	else if(activeSpell == SPL_TrfLurker)
	{
		Result = Spell_Logic_TrfLurker(manaInvested);
	}
	else if(activeSpell == SPL_TrfShadowbeast)
	{
		Result = Spell_Logic_TrfShadowbeast(manaInvested);
	}
	else if(activeSpell == SPL_TrfDragonSnapper)
	{
		Result = Spell_Logic_TrfDragonSnapper(manaInvested);
	}
	else if(activeSpell == SPL_Charm)
	{
		Result = Spell_Logic_Charm(manaInvested);
	}
	else if(activeSpell == SPL_MasterOfDisaster)
	{
		Result = Spell_Logic_MasterOfDisaster(manaInvested);
	}
	else if(activeSpell == SPL_ConcussionBolt)
	{
		Result = Spell_Logic_Concussionbolt(manaInvested);
	}
	else if(activeSpell == SPL_Deathbolt)
	{
		Result = Spell_Logic_Deathbolt(manaInvested);
	}
	else if(activeSpell == SPL_Deathball)
	{
		Result = Spell_Logic_Deathball(manaInvested);
	}
	else if(activeSpell == SPL_Thunderstorm)
	{
		Result = Spell_Logic_Thunderstorm(manaInvested);
	}
	else if(activeSpell == SPL_WaterFist)
	{
		Result = Spell_Logic_Waterfist(manaInvested);
	}
	else if(activeSpell == SPL_Whirlwind)
	{
		Result = Spell_Logic_Whirlwind(manaInvested);
	}
	else if(activeSpell == SPL_Geyser)
	{
		Result = Spell_Logic_Geyser(manaInvested);
	}
	else if(activeSpell == SPL_Inflate)
	{
		Result = Spell_Logic_Inflate(manaInvested);
	}
	else if(activeSpell == SPL_IceLance)
	{
		Result = Spell_Logic_Icelance(manaInvested);
	}
	else if(activeSpell == SPL_Swarm)
	{
		Result = Spell_Logic_Swarm(manaInvested);
	}
	else if(activeSpell == SPL_GreenTentacle)
	{
		Result = Spell_Logic_Greententacle(manaInvested);
	}
	else if(activeSpell == SPL_SummonGuardian)
	{
		Result = Spell_Logic_SummonGuardian(manaInvested);
	}
	else if(activeSpell == SPL_Energyball)
	{
		Result = Spell_Logic_EnergyBall(manaInvested);
	}
	else if(activeSpell == SPL_SuckEnergy)
	{
		Result = Spell_Logic_SuckEnergy(manaInvested);
	}
	else if(activeSpell == SPL_Skull)
	{
		Result = Spell_Logic_Skull(manaInvested);
	}
	else if(activeSpell == SPL_SummonZombie)
	{
		Result = Spell_Logic_SummonZombie(manaInvested);
	}
	else if(activeSpell == SPL_SummonMud)
	{
		Result = Spell_Logic_SummonMud(manaInvested);
	};
	return Result; //испр. - добавлено
};

