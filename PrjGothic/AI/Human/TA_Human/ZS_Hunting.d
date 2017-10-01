/**************************************************************************

								ОХОТИТЬСЯ
  
  Случайное блуждание с луком в руках.
  
  Набор восприятий - обычный.
  Режим перемещения - подкрадывание.
  
   ТЕСТ !!!

***************************************************************************/

func void ZS_Hunting()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	B_MM_DeSynchronize();
	AI_SetWalkMode(self,NPC_WALK);
	if (!Npc_HasEquippedRangedWeapon(self))
	{
		if (Hlp_Random(100) < 20)	{
			CreateInvItem(self,ItRw_Bow_L_03);
		}
		else	{
			CreateInvItem(self,ItRw_Bow_L_02);
		};
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Hunting_Loop()
{
	var int random;
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)	{
		AI_EquipBestRangedWeapon(self);
		if ((Npc_GetDistToWP(self, self.wp) >= 4500) || !Wld_IsFPAvailable(self,"HUNT"))	{
			NS_GoAndAlignToMyWP(self);
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)	{
		if ((Npc_GetDistToWP(self, self.wp) < 4500) || Wld_IsFPAvailable(self,"HUNT") || Wld_IsFPAvailable(self,"ROAM"))	{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
			if (Npc_HasEquippedRangedWeapon(self))
			{
				B_CreateAmmo(self);
				AI_ReadyRangedWeapon(self);
			};
			AI_SetWalkMode(self,NPC_SNEAK);
		};
	}
	else	{
		if(Npc_GetStateTime(self) > 0)
		{
			random = Hlp_Random(10);
			if ((random < 5)  && (Wld_IsFPAvailable(self,"HUNT")))
			{
				if (Npc_IsOnFP(self,"HUNT"))	{
					AI_GotoNextFP(self,"HUNT");
				}
				else	{
					AI_GotoFP(self,"HUNT");
				};
			}
			else if((random < 9) && Wld_IsFPAvailable(self,"ROAM"))
			{
				if (Npc_IsOnFP(self,"ROAM"))	{
					AI_GotoNextFP(self,"ROAM");
				}
				else	{
					AI_GotoFP(self,"ROAM");
				};
			}
			else
			{
				self.wp = Npc_GetNextWP(self);
				AI_GotoWP(self,self.wp);
				AI_AlignToWP(self);
			};
		};
		self.wp = Npc_GetNearestWP(self);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Hunting_End()
{
	AI_RemoveWeapon(self);
};

