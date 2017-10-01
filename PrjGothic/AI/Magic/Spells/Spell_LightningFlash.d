
const int SPL_Cost_LightningFlash = 30;
const int SPL_Damage_LightningFlash = 150;
const int SPL_ZAPPED_DAMAGE_PER_SEC = 2;
const int SPL_TIME_SHORTZAPPED = 2;

instance Spell_LightningFlash(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_LightningFlash;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_LightningFlash(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_LightningFlash);
};

func void Spell_Cast_LightningFlash()
{
	Spell_Cast_Proto(SPL_Cost_LightningFlash);
	self.aivar[AIV_SelectSpell] += 1;
};

