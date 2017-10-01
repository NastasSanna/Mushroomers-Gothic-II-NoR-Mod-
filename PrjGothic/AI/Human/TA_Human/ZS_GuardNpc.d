/**************************************************************************

							ОХРАНЯТЬ NPC
  
  Следовать за своим Npc и нападать на обидчиков.
  Набор восприятий - минимум + специальные, частота обработки высокая.
  Режим перемещения - как у охраняемого.

***************************************************************************/

func void B_AssessGuardTalk()
{
	B_Say(self, other, "$NOTNOW");
	Npc_SetRefuseTalk(self, 3);
};


func void ZS_GuardNpc()
{
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] | TEMPER_BodyGuard;
	Perception_Set_Normal();
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE, B_AssessGuardedDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK, B_AssessGuardTalk);
	B_ResetAll(self);
	AI_Standup(self);
	var oCNpc body;	body = Hlp_GetNpc(C_GetGuardedNpc(self));
	var oCAniCtrl_Human body_ai;	body_ai = _^(body.human_ai);
	AI_SetWalkMode(self, body_ai.walkmode);
	AI_GotoNpc(self,body);
	// дальность следования
	if(self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
	};
};

func int ZS_GuardNpc_Loop()
{
	var oCNpc body;	body = Hlp_GetNpc(C_GetGuardedNpc(self));
	if(Npc_GetDistToNpc(self,body) > self.aivar[AIV_FollowDist])
	{
		if (Npc_GetDistToNpc(self,body) > 3 * self.aivar[AIV_FollowDist] / 2)
		{
			AI_SetWalkMode(self, NPC_RUN);
		}
		else
		{
			var oCAniCtrl_Human body_ai;	body_ai = _^(body.human_ai);
			AI_SetWalkMode(self, body_ai.walkmode);
		};
		AI_GotoNpc(self,body);
		self.wp = body.wpname;
	}
	else if (Npc_GetStateTime(self) > 0) {
		AI_TurnToNpc(self,body);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_GuardNpc_End()
{
};

