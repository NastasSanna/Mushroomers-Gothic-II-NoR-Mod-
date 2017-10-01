

//====================================================
// для ТРИАЛОГОВ без LeGo
//      (или говорить, не поворачиваясь к ГГ)
// aivar[AIV_TALK_TRIA] = Hlp_GetInstanceID( <с кем говорим> );
//   можно в condition диалога
// завершение состояния только, когда self.aivar[AIV_TALK_TRIA] <= 0 !!!

var int zsTalkBugfix;

func void ZS_Talk()
{
	var C_Npc target;
	var C_Npc TalkTo;	//с кем говорим (other или AIV_TALK_TRIA)
	TalkTo = Hlp_GetNpc(other);	//default
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	//NS (июл/2014) если говорим не с ГГ, то поворачиваемся к нему
	if (self.aivar[AIV_TALK_TRIA] > 0)
	{
		TalkTo = Hlp_GetNpc(self.aivar[AIV_TALK_TRIA]);	// а с кем?
	};
	//*/
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_SetWalkmode(self,NPC_WALK);
		if (!(self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven))	{
			AI_RemoveWeapon(self);
		};
		if(C_BodyStateContains(self,BS_SIT))
		{
			target = Npc_GetLookAtTarget(self);
			if(!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc(self,TalkTo);
			};
		}
		else
		{
			B_LookAtNpc(self,TalkTo);
		};		
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_StandUp(self);
		B_TurnToNpc(self,TalkTo);
	};
	if(!C_BodyStateContains(TalkTo,BS_SIT))
	{
		AI_StandUp(TalkTo);
		B_TurnToNpc(TalkTo,self);
		if(Npc_GetDistToNpc(TalkTo,self) < 80)
		{
			AI_Dodge(TalkTo);
		};
	};
	B_Assign_ChoosePlayer(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((C_NpcGetAttitude(self,other) == ATT_ANGRY) || (C_NpcGetAttitude(self,other) == ATT_HOSTILE))
		{
			if(self.guild != GIL_BDT)
			{
				Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
			};
		};
		if((self.npcType == NPCTYPE_AMBIENT) || (self.npcType == NPCTYPE_OCAMBIENT) || (self.npcType == NPCTYPE_BL_AMBIENT) || (self.npcType == NPCTYPE_TAL_AMBIENT))
		{
			B_AssignAmbientInfos(self);
			if(C_NpcBelongsToCity(self))
			{
				B_AssignCityGuide(self);
			};
		};
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			B_Addon_GivePotion(self);
		};
		if(C_NpcIsToughGuy(self) && (!HasFlags(self.aivar[AIV_Temper], TEMPER_ToughGuyNewsOverride)))
		{
			B_AssignToughGuyNEWS(self);
		};
		if(C_NpcHasAmbientNews(self))
		{
			B_AssignAmbientNEWS(self);
		};
		//DIA_TradeSwapBack.npc = Hlp_GetInstanceID(self);
	};
	if(self.guild == GIL_DRAGON)
	{
		AI_PlayAni(self,"T_STAND_2_TALK");
	};
	AI_ProcessInfos(self);
	zsTalkBugfix = FALSE;
};

func int ZS_Talk_Loop()
{
	var C_Npc TalkTo;	//с кем говорим (other или AIV_TALK_TRIA)
	TalkTo = Hlp_GetNpc(other);	//default
	if (self.aivar[AIV_TALK_TRIA] > 0)
	{
		TalkTo = Hlp_GetNpc(self.aivar[AIV_TALK_TRIA]);	// а с кем?
	};
	if (MEM_InformationMan.Mode != 3) //INFO_MGR_MODE_TRADE
	{
		//PrintScreen("On Trade", 1, 1, FONT_ScreenSmall, 1);
		B_Trade_SellOnly_Back(self);
		B_TradeSwapBack(self);
		B_Trade_BuyOnly_Back();
	};
	if(InfoManager_HasFinished() && (zsTalkBugfix == TRUE))
	{
		// пока не закончился ТРИАЛОГ, не выходим из состояния
		other.aivar[AIV_INVINCIBLE] = FALSE;	//но ГГ свободен, может заговорить другой NPC
		//нет триалога - завершаем как обычно
		if (self.aivar[AIV_TALK_TRIA] <= 0)	{
			self.aivar[AIV_INVINCIBLE] = FALSE;
			other.aivar[AIV_INVINCIBLE] = FALSE;
			self.aivar[AIV_NpcStartedTalk] = FALSE;
			if(self.guild < GIL_SEPERATOR_HUM)
			{
				B_StopLookAt(self);
				Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
			};
			if(self.guild == GIL_DRAGON)
			{
				AI_PlayAni(self,"T_TALK_2_STAND");
			};
			return LOOP_END;
		}
		//иначе - идет триалог
		else
		{
			if (Npc_CheckInfo(self,TRUE)) //есть что еще сказать?
			{
				if(!C_BodyStateContains(self,BS_SIT))
				{
					B_TurnToNpc(self,TalkTo);
				};
				B_LookAtNpc(self,TalkTo);
				AI_ProcessInfos(self);
				zsTalkBugfix = FALSE;
			};
			return LOOP_CONTINUE;
		};		
	}
	else
	{
		zsTalkBugfix = TRUE;
		return LOOP_CONTINUE;
	};
};
func void ZS_Talk_End()
{
	Npc_SetRefuseTalk(other,20);
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		if (C_GetPlayerPortalGuild() > 0)	{
			B_AssessEnterRoom();
		};
	};
	self.aivar[AIV_TalkedToPlayer] = Wld_GetFullTime();//TRUE;
	//для обмена ГГ
	Npc_ClearAIQueue(hero);
	B_Trade_SellOnly_Back(self);
	B_TradeSwapBack(self);
	B_Trade_BuyOnly_Back();
	B_OnTalkEnd();
};
