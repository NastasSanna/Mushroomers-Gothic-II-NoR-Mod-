/**************************************************************************

							ВАРИТЬ ЗЕЛЬЯ
  
  Если нет колбы - она будет создана.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Potion_Alchemy()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	if(Npc_HasItems(self,ItMi_Flask) == 0)
	{
		CreateInvItem(self,ItMi_Flask);
	};
};

func int ZS_Potion_Alchemy_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"LAB"))
	{
		AI_UseMob(self,"LAB",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Potion_Alchemy_End()
{
	AI_UseMob(self,"LAB",-1);
};

