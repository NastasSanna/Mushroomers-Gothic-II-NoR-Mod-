/************************************************************************************
							÷≈À»“‹—ﬂ, ÕŒ Õ≈ —“–≈Àﬂ“‹
  
  ¬ other, ÂÒÎË Â„Ó ÌÂÚ - ÚÓ ‚ √√.

************************************************************************************/


func void ZS_AimTo()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	NS_GoAndAlignToMyWP(self);
	B_CreateAmmo(self);
	if (Npc_HasEquippedRangedWeapon(self) == FALSE)	{
		CreateInvItem(self,ItRw_Bow_L_01);
		CreateInvItems(self,ItRw_Arrow,10);
		AI_EquipBestRangedWeapon(self);
	};
	AI_ReadyRangedWeapon(self);
	//other = Hlp_GetNpc(hero);
};

func int ZS_AimTo_Loop()
{
	if (!Hlp_IsValidNpc(other))	{
		other = Hlp_GetNpc(hero);
	};
	if (!C_NpcIsDown(other))	{
		AI_TurnToNpc(self,other);
		AI_AimAt(self,other);
		AI_LookAtNpc(self,other);
		if ((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) || Npc_CanSeeNpc(self,other))	{
			AI_Wait(self, 0.8);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
	//return LOOP_END;
};

func void ZS_AimTo_End()
{
	AI_StopAim(self);
	B_StopLookAt(self);
	AI_RemoveWeapon(self);
};

