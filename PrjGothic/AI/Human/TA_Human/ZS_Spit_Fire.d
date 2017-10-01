
func void ZS_Spit_Fire()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSTALK);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	if(Npc_HasItems(self,ItLsTorchFirespit) == 0)
	{
		CreateInvItem(self,ItLsTorchFirespit);
	};
	AI_UnequipWeapons(self);
	Npc_SetStateTime(self,9);
};

func int ZS_Spit_Fire_loop()
{
	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_435_Nadja)) && (Npc_HasEquippedArmor(self)))
	{
		AI_UnequipArmor(self);
		Npc_SetRefuseTalk(self, 1);
	};
	/*
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	//*/
	if(Npc_GetStateTime(self) > 10)
	{
		AI_StopLookAt(self);
		AI_UseItemToState(self,ItLsTorchFirespit,4);
		AI_UseItemToState(self,ItLsTorchFirespit,-1);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Spit_Fire_end()
{
	AI_UseItemToState(self,ItLsTorchFirespit,-1);
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_435_Nadja) && Npc_IsInRoutine(self,Rtn_Start_435))
	{
		AI_EquipBestArmor(self);
	};
};

