/**************************************************************************

							СОБИРАТЬ ГРИБЫ
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/


func void B_DetectMushroom()
{
	Npc_PerceiveAll(self);
	Wld_DetectItem(self,ITEM_KAT_FOOD);
	if(!Hlp_IsValidItem(item))
	{
		return;
	};
	if (C_ItemIsMushroom(item) == -1)
	{
		return;
	};
	if((Npc_GetHeightToItem(self,item) > 500) || (Npc_GetDistToItem(self,item) > PERC_DIST_INTERMEDIAT))
	//	|| !Npc_CanSeeItem(self,item))
	{
		return;
	};
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoItem(self,item);
	if (Npc_GetTrueGuild(self) < GIL_SEPERATOR_HUM)	{
		B_ResetAll(self);
		AI_TakeItem(self,item);
//		B_AddCompetitors_NotRnd(item,self);
	};
};


func void ZS_PickMushrooms()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if (self.aivar[AIV_TAPOSITION] != ISINPOS 
		|| ((Npc_GetDistToWP(self, self.wp) > 3000) && !Npc_IsOnFP(self,"PICK") && !Wld_IsFPAvailable(self,"PICK"))
	) {
		AI_GotoWP(self, self.wp);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
};

func int ZS_PickMushrooms_Loop()
{
	var int random;
	B_DetectMushroom();
	AI_SetWalkMode(self,NPC_WALK);
	self.wp = Npc_GetNearestWP(self);
	if(!Npc_IsOnFP(self,"PICK") && Wld_IsFPAvailable(self,"PICK"))
	{
		AI_GotoFP(self,"PICK");
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	if(Npc_GetStateTime(self) > 2)
	{
		random = Hlp_Random(5);
		if(random < 2)
		{
			if(Wld_IsFPAvailable(self,"PICK"))
			{
				B_StopLookAt(self);
				if (Npc_IsOnFP(self,"PICK"))	{
					AI_GotoNextFP(self,"PICK");
				}
				else	{
					AI_GotoFP(self,"PICK");
				};
				AI_PlayAni(self,"T_PLUNDER");
			}
			else if(Wld_IsFPAvailable(self,"ROAM"))
			{
				B_StopLookAt(self);
				if (Npc_IsOnFP(self,"ROAM"))	{
					AI_GotoNextFP(self,"ROAM");
				}
				else	{
					AI_GotoFP(self,"ROAM");
				};
				AI_PlayAni(self,"T_PLUNDER");
			}
			else
			{
				AI_GotoWP(self,Npc_GetNextWP(self));
				AI_AlignToWP(self);
			};
		}
		else if (random == 4)	{
			AI_PlayAni(self,"T_SEARCH");
		}
		else	if(!Hlp_StrCmp(Npc_GetNearestWP(self), self.wp))	{
			AI_GotoWP(self,Npc_GetNearestWP(self));
			self.wp = Npc_GetNearestWP(self);
			Npc_SetStateTime(self,2);
			return LOOP_CONTINUE;
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_PickMushrooms_End()
{
};

