/**************************************************************************

						ГОТОВИТЬ В КОТЛЕ
  
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
  Если у персонажа нет поварешки, то она создается.

***************************************************************************/

func void ZS_Cook_Cauldron()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	if(Npc_HasItems(self,ItMi_Scoop) == 0)
	{
		CreateInvItem(self,ItMi_Scoop);
	};
};

func int ZS_Cook_Cauldron_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob(self,"CAULDRON",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Cook_Cauldron_End()
{
	AI_UseMob(self,"CAULDRON",-1);
};

