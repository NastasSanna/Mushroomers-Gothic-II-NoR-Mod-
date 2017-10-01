
func void ZS_Stomp_Herb()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
};

func int ZS_Stomp_Herb_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"HERB"))
	{
		AI_UseMob(self,"HERB",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stomp_Herb_End()
{
	AI_UseMob(self,"HERB",-1);
};

