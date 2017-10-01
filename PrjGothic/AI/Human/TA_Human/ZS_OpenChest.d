/**************************************************************************

							ÊÎÏÀÒÜÑß Â ÑÓÍÄÓÊÅ
  
  Íàáîð âîñïðèÿòèé - îáû÷íûé.
  Ðåæèì ïåðåìåùåíèÿ - õîäüáà.
  
  ÒÅÑÒ !!!

***************************************************************************/

func void ZS_OpenChest()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	if (Wld_IsMobAvailable(self,"CHESTBIG"))
	{
		AI_UseMob(self,"CHESTBIG",1);
		AI_UseMob(self,"CHESTBIG",0);
	}
	else if (Wld_IsMobAvailable(self,"CHESTSMALL"))
	{
		AI_UseMob(self,"CHESTSMALL",1);
		AI_UseMob(self,"CHESTSMALL",0);
	};
};

func int ZS_OpenChest_Loop()
{
	if((Npc_GetStateTime(self) > 3))
	{
		if (Hlp_Random(5) == 0)
		{
			B_StopLookAt(self);
			if (Wld_IsMobAvailable(self,"CHESTBIG"))
			{
				AI_UseMob(self,"CHESTBIG",1);
				AI_Wait(self, 4);
				AI_UseMob(self,"CHESTBIG",0);
			}
			else if (Wld_IsMobAvailable(self,"CHESTSMALL"))
			{
				AI_UseMob(self,"CHESTSMALL",1);
				AI_Wait(self, 4);
				AI_UseMob(self,"CHESTSMALL",0);
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_OpenChest_End()
{
	AI_UseMob(self,Npc_GetDetectedMob(self),-1);
};

