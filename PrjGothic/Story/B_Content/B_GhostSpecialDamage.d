/**************************************************************************

							АТАКА ПРИЗРАКА

  Призрак slf (я) был атакован персонажем oth (он).
  
  Если он не бессмертный и не ГГ, то он будет убит на месте. ГГ будет убит
после двух предупреждений. При каждом предупреждении здоровье снижается 
вдвое.
  
***************************************************************************/

func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	// если я призрак
	if(HasFlags(slf.flags, NPC_FLAG_GHOST))
	{
		// спецэффекты в любом случае
		Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
		// если он не бессмертен - сам получит урон
		if(!HasFlags(oth.flags, NPC_FLAG_IMMORTAL))
		{
			// если он не ГГ
			if(Npc_IsPlayer(oth))
			{
				// будет убит сразу
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
			}
			// иначе - он ГГ
			else
			{
				// увеличить счетчик предупреждений
				GhostAttackWarn = GhostAttackWarn + 1;
				// если их меньше 3
				if(GhostAttackWarn < 3)
				{
					// снизить здоровье ГГ вдвое
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] / 2;
				}
				// иначе
				else
				{
					// убить ГГ
					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS]);
					AI_PlayAni(oth,"T_DEAD");
				};
			};
		};
		return TRUE;
	};
	return FALSE;
};

