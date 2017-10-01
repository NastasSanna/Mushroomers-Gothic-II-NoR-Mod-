
func int Spell_ProcessMana_Release(var int manaInvested)
{
	var int Result;
	Result = SPL_SENDSTOP;
	// какое заклинание
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_Pyrokinesis)
	{
		Result = SPL_SENDCAST;
	}
	else if(activeSpell == SPL_ChargeFireball)
	{
		Result = SPL_SENDCAST;
	}
	else if(activeSpell == SPL_ChargeZap)
	{
		Result = SPL_SENDCAST;
	}
	else if(activeSpell == SPL_WindFist)
	{
		Result = SPL_SENDCAST;
	};
	return Result;
};

