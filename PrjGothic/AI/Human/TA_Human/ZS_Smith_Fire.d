
func void ZS_Smith_Fire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Smith_Fire_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSFIRE"))
	{
		AI_UseMob(self,"BSFIRE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Fire_End()
{
	AI_UseMob(self,"BSFIRE",-1);
};

