/**************************************************************************

						РАСПОРЯДОК ДНЯ БАНДИТА
  
  Сидеть у костра или обозревать окрестности стоя. При завершении встать
нормально.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
 
  Смысл AIV_TAPOSITION:
   ISINPOS	- бандит сидит или обозревает окрестности
   NOTINPOS	- бандит еще не сидит/обозревает

***************************************************************************/


// НАЧАЛО =================================================================

func void ZS_Bandit()
{
	// обычный набор воспритяий
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

// ЦИКЛ ===================================================================

func int ZS_Bandit_loop()
{
	var int random;
	// если еще не начал бездельничать
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		// поискать свободное место у костра
		if(!Npc_IsOnFP(self,"CAMPFIRE") && Wld_IsFPAvailable(self,"CAMPFIRE"))
		{
			AI_GotoFP(self,"CAMPFIRE");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		}
		// если нет - поискать, где постоять
		else if(!Npc_IsOnFP(self,"STAND") && Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP(self,"STAND");
			AI_AlignToFP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		// и того нет - стоим с гордым видом, где есть
		else
		{
			AI_AlignToWP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	// подавать признаки жизни каждые 5 сек.
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !C_BodyStateContains(self,BS_SIT))
	{
		random = Hlp_Random(3);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ =============================================================

func void ZS_Bandit_end()
{
	// встать, если я сидел
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};

