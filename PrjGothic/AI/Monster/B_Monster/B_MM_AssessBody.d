/**************************************************************************

							¬ќ—ѕ–»я“»≈ “–”ѕј

  ћонстр self (€) почу€л труп other (он).
  
  ќбычна€ реакци€: приступить к трапезе.

***************************************************************************/

func void B_MM_AssessBody()
{
	// Ќ≈ есть -------------------------------------------------------------
	// если € орк
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		return;
	};
	// если оно слишком далеко по вертикали
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	// если дл€ мен€ важнее напасть, а не поесть
	if(HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_AttackPriority))
	{
		return;
	};
	// если € это не ем
	if(!C_WantToEat(self,other))
	{
		return;
	};
	// если € в состо€нии атаки и мой враг близко ко мне или к туше
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		var C_Npc stoerenfried;
		stoerenfried = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		if((Npc_GetDistToNpc(stoerenfried,self) <= FIGHT_DIST_MONSTER_ATTACKRANGE) 
			|| (Npc_GetDistToNpc(stoerenfried,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE) 
			|| (Npc_GetDistToNpc(stoerenfried,self) < Npc_GetDistToNpc(self,other) / 2))
		{
			return;
		};
	};
	// в других случа€х -----v
	// сбросить остальные действи€ и начать есть
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_EatBody,0,"");
};

