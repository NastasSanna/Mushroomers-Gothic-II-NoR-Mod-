/**************************************************************************

						ОХРАНА СВЯТОГО МОЛОТА
  
  Стоять, смотреть по сторонам. Подойдет для охраны любого предмета.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
  При завершении - встать нормально.
  
  Сюжетные особенности: если мне вернули Молот, положить его на место.
 
  AIV_TAPOSITION:
   ISINPOS	- еще не охраняю
   NOTINPOS	- охраняю

***************************************************************************/

// НАЧАЛО =================================================================

func void ZS_Guard_Hammer()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

// ЦИКЛ ===================================================================

func int ZS_Guard_Hammer_loop()
{
	var int random;
	
	// ЗАНЯТЬ ПОЗИЦИЮ -----------------------------------------------------
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	
	// НАЧАТЬ ОХРАНЯТЬ ----------------------------------------------------
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	// ВЕРНУТЬ МОЛОТ ------------------------------------------------------
	if((Npc_HasItems(self,Holy_Hammer_MIS) == 1) && (Npc_GetDistToWP(self,"NW_MONASTERY_SANCTUM_01") <= 500))
	{
		Npc_RemoveInvItems(self,Holy_Hammer_MIS,1);
		Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	// ОГЛЯДЕТЬСЯ ---------------------------------------------------------
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(10);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Guard_Hammer_end()
{
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

