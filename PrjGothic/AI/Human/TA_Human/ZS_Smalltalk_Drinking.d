/**************************************************************************

						ВЫПЬЕМ ВМЕСТЕ!
  
  Раз в 4 секунды один из собеседников пьет или говорит. Собеседник, заметив,
что товарищ пьет, присоединится к нему. Иногда оба закусывают.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Smalltalk_Drinking()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if (!Npc_IsOnFP(self,"SMALLTALK"))
	{
		NS_GoToMyWP(self);
	};
};

func int ZS_Smalltalk_Drinking_Loop()
{
	if(Npc_IsOnFP(self,"SMALLTALK") || !Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= SmallTalkFreq)
		{
			Npc_PerceiveAll(self);
			if(Wld_DetectNpc(self,-1,ZS_Smalltalk_DoDrink,-1) || (Hlp_Random(3) == 0))
			{
				B_TurnToNpc(self,other);
				B_LookAtNpc(self,other);
				AI_StartState(self,ZS_Smalltalk_DoDrink,0,"");
				return LOOP_END;
			};
			if(Wld_DetectNpc(self,-1,ZS_Smalltalk_Drinking,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					B_TurnToNpc(self,other);
					B_LookAtNpc(self,other);
					B_Say_Smalltalk();
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_Drinking_End()
{
};
//=========================================
func void ZS_Smalltalk_DoDrink()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_Smalltalk_DoDrink_Loop()
{
	var int rnd;
	//выпить
	rnd = Hlp_Random(3);
	if(rnd == 0)	{
		if(Npc_HasItems(self,ItFo_Booze) == 0)	{
			CreateInvItem(self,ItFo_Booze);
		};
		AI_UseItem(self,ItFo_Booze);
	}
	else if(rnd == 1)	{
		if(Npc_HasItems(self,ItFo_Wine) == 0)	{
			CreateInvItem(self,ItFo_Wine);
		};
		AI_UseItem(self,ItFo_Wine);
	}
	else	{
		if(Npc_HasItems(self,ItFo_Beer) == 0)	{
			CreateInvItem(self,ItFo_Beer);
		};
		AI_UseItem(self,ItFo_Beer);
	};
	//закусить
	B_MM_DeSynchronize();
	rnd = Hlp_Random(10);
	if(rnd == 0)
	{
		if(Npc_HasItems(self,ItFo_Apple) == 0)	{
			CreateInvItem(self,ItFo_Apple);
		};
		AI_UseItem(self,ItFo_Apple);
	}
	else if(rnd == 1)
	{
		if(Npc_HasItems(self,ItFo_Cheese) == 0)	{
			CreateInvItem(self,ItFo_Cheese);
		};
		AI_UseItem(self,ItFo_Cheese);
	}
	else if(rnd == 2)
	{
		if(Npc_HasItems(self,ItFo_Bacon) == 0)	{
			CreateInvItem(self,ItFo_Bacon);
		};
		AI_UseItem(self,ItFo_Bacon);
	}
	else if(rnd == 3)
	{
		if(Npc_HasItems(self,ItFoMutton) == 0)	{
			CreateInvItem(self,ItFoMutton);
		};
		AI_UseItem(self,ItFoMutton);
	};
	B_MM_DeSynchronize();
	return LOOP_END;
};

func void ZS_Smalltalk_DoDrink_End()
{
	AI_StartState(self,ZS_Smalltalk_Drinking,0,"");
};

