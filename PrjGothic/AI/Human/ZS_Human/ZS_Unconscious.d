
func void ZS_Unconscious()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Dead,0,"");
		return;
	};
	B_GuardPassageStatusReset(self);
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if((self.guild < GIL_SEPERATOR_HUM) && (Npc_IsPlayer(other) || other.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		self.aivar[AIV_DefeatedByPlayer] = TRUE;
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	if(Npc_IsPlayer(self))
	{
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		if(other.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			other.aivar[AIV_ArenaFight] = AF_AFTER;
		};
		//ГГ - преступник, пойманный
		var int crime;	crime = B_GetKnownPlayerCrime(other);
		if (crime > CRIME_NONE)	{
			if (C_NpcBelongsToCity(other)) //в городе
			{
				HERO_Imprisoned = HERO_Imprisoned_City;
				self.aivar[AIV_RANSACKED] = TRUE;
				//Npc_SetStateTime(self, HAI_TIME_UNCONSCIOUS);
			}
			else	if (C_NpcBelongsToFarm(other)) //на ферме
			{
				HERO_Imprisoned = HERO_Imprisoned_Farm;
				self.aivar[AIV_RANSACKED] = TRUE;
				//Npc_SetStateTime(self, HAI_TIME_UNCONSCIOUS);
			}
			else	if (C_NpcBelongsToMonastery(other)) //в монастыре
			{
				HERO_Imprisoned = HERO_Imprisoned_Monastery;
				self.aivar[AIV_RANSACKED] = TRUE;
				//Npc_SetStateTime(self, HAI_TIME_UNCONSCIOUS);
			};
		};
	};
	B_GiveTradeInv(self);
	B_ClearRuneInv(self);
	B_GivePlayerXPPerVictory(self, other);
	AI_UnequipWeapons(self);
};

func int ZS_Unconscious_Loop()
{
	// ГГ поймали и будут судить
	if (HERO_Imprisoned > 0)	{
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) < HAI_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};

func void ZS_Unconscious_End()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	if(Npc_IsPlayer(self))
	{
		// ГГ поймали и будут судить
		if (HERO_Imprisoned == HERO_Imprisoned_City) //в городе
		{
			B_HeroCrimeVerdict_City();
		}
		else	if (HERO_Imprisoned == HERO_Imprisoned_Farm) //на ферме
		{
			B_HeroCrimeVerdict_Farm();
		}
		else	if (HERO_Imprisoned == HERO_Imprisoned_Monastery) //в монастыре
		{
			B_HeroCrimeVerdict_Monastery();
		}
		else	{
			AI_Standup(self);
		};
		return;
	};
	AI_Standup(self);
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		B_TurnToNpc(self,other);
		if(C_NpcIsToughGuy(self) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE) && (self.npcType != NPCTYPE_FRIEND))
		{
			B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
		}
		else
		{
			B_Say(self,other,"$OHMYHEAD");
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) <= 500)
			{
				AI_TakeItem(self,item);
			};
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	if (self.attribute[ATR_HITPOINTS] < HAI_TIME_UNCONSCIOUS)
	{
		self.attribute[ATR_HITPOINTS] += HAI_TIME_UNCONSCIOUS;
	};
	AI_StartState(self,ZS_HealSelf,0,"");
};



