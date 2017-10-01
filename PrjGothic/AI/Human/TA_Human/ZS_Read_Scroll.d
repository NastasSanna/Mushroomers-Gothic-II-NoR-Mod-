/**************************************************************************

							ЧТЕНИЕ СВИТКА
  
  Стоять читать свиток.
  Не использовать в качестве длительного действия, NPC стоит столбом!

***************************************************************************/

func void ZS_Read_Scroll()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	CreateInvItem(self, Fakescroll);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Read_Scroll_loop()
{
	// если еще не читаем
	if (self.aivar[AIV_TAPOSITION] != ISINPOS)
	{
		// если еще не дошли до места
		if ((Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX) || (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE))
		{
			// и если еще не идем
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				// то идти
				AI_GotoWP(self, self.wp);
				self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
			};
		}	
		else	//дошли	
		{
			// подравниваемся
			AI_AlignToWP(self);
			// и читаем
			AI_UseItemToState(self,Fakescroll,1);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Read_Scroll_end()
{
	AI_UseItemToState(self,Fakescroll,-1);
	Npc_RemoveInvItems(self,Fakescroll,Npc_HasItems(self,Fakescroll));
};

