

//квестовые события после завершения разговора
var int START_DIA_After_Once;

func void B_StealAllFromNpcInventory(var C_NPC npc, var int MinValue, var int categories)
{
	if (C_NpcIs(npc,PC_MushLord))	{
		B_RemoveNpc(npc);
		return;
	};
	//Ikarus - убираем из инвентаря npc ценное
	var C_ITEM itm;	var int itm_inst;
	var ocNPC hr;	hr = Hlp_GetNpc(npc);
	var zCListSort walker;	walker = _^(hr.inventory2_inventory_next);
	var int loop;	loop = MEM_StackPos.position;
	if (walker.data)	{
		itm = _^(walker.data);
		if ((itm.value >= MinValue)
			&& (HasAnyFlags(itm.mainflag, categories))
			&& (!HasFlags(itm.flags,ITEM_MISSION)))
		{
			itm_inst = Hlp_GetInstanceID(itm);
			Npc_RemoveInvItems(npc,itm_inst,Npc_HasItems(npc,itm_inst));
			walker = _^(hr.inventory2_inventory_next);
		};
	};
	if (walker.next)	{
		walker = _^(walker.next);
		MEM_StackPos.position = loop; 
	};
	//*/
};


func void B_OnTalkEnd()
{
	
	//переводим часы после разговора
	//прямо в диалоге может привести к зависанию, т.к. NPC вернется к распорядку дня
	if ((Wait_AfterDia_H > 0) || (Wait_AfterDia_M > 0))	{
		var C_NPC slf;	slf = Hlp_GetNpc(self);
		var C_NPC oth;	oth = Hlp_GetNpc(other);
		B_SetTimePlus(Wait_AfterDia_H, Wait_AfterDia_M);
		PrintScreen(PRINT_SomeTimeLater,-1,-1,FONT_Screen,2);
		self = Hlp_GetNpc(slf);
		other = Hlp_GetNpc(oth);
		Wait_AfterDia_H = 0;
		Wait_AfterDia_M = 0;
		//есть что сказать?
		if (Npc_CheckInfo(self,1))	{
			AI_Teleport(self,Npc_GetNearestWP(hero));
			AI_GotoNpc(self,hero);
		};
	};
	
	//посмотреть список кандидадов
	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_417_Constantino)) && (Npc_HasItems(other,ItWr_ScoreList)))
	{
		B_UseItem(other,ItWr_ScoreList);
	};
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Lost)	{
		B_GameOver_Lose();
	};
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Won)	{
		B_GameOver_Win();
	};
	
	
	//после стартового диалога
	if ((START_DIA_Finished == TRUE) && (START_DIA_After_Once == FALSE))	{
		START_DIA_After_Once = TRUE;
		B_LogEntry_Start();
		HERO_PatronGod_Bless();
		AI_EquipBestArmor(hero);
		AI_EquipBestMeleeWeapon(hero);
		AI_EquipBestRangedWeapon(hero);
	};
	
	//последнее китайское предупреждение
	if (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)	{
		AI_StartState(self,ZS_ObservePlayer,1,"");
	}
	else if (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)	{
		B_SelectWeapon(self,other);
		AI_StartState(self,ZS_ObservePlayer,1,"");
	};
	
	//НастасьСанна
	if (C_NpcIs(self,PC_NastasSanna))	{
		if (ADMIS_NS_Found == 1)	
		{
			AI_Teleport(PC_NastasSanna,"NW_NASTASSANNA_02");
			Wld_InsertItem(ItWr_Script1,"FP_ITEM_NSSCRIPT_01");
			Wld_InsertItem(ItWr_Script3,"FP_ITEM_NSSCRIPT_03");
			Wld_InsertItem(ItWr_Script4,"FP_ITEM_NSSCRIPT_04");
			Wld_InsertItem(ItWr_Script5,"FP_ITEM_NSSCRIPT_05");
		}
		else	if (ADMIS_NS_Found == 2)	
		{
			AI_Teleport(PC_NastasSanna,"NW_NASTASSANNA_03");
			Wld_InsertItem(ItWr_Script2,"FP_ITEM_NSSCRIPT_02");
			Wld_InsertItem(ItWr_Script6,"FP_ITEM_NSSCRIPT_06");
			Wld_InsertItem(ItWr_Script7,"FP_ITEM_NSSCRIPT_07");
		};
	};
	if (C_NpcIs(self,PC_NastasSanna_Snow))	{
		B_RemoveNpc(self);
	};
	//с Бладвином шутки плохи
	if (C_NpcIs(self,PC_BloodwinSnow))	{
		if (BloodwinSnow_KillPlayer > 0) {
			BloodwinSnow_KillPlayer = 15;
			B_Attack(self,hero,AR_KILL,0);
			B_Attack(PC_SnowStudioActor_01,hero,AR_KILL,0);
			B_Attack(PC_SnowStudioActor_02,hero,AR_KILL,0);
		};
	};
	//FIRE DRAGON отлетает
	if (C_NpcIs(self,PC_FireDragon))	{
		B_RemoveNpc(self);
		Wld_StopEffect("SPELLFX_FIREARMOR");
	};
	
	//вышвырнули из монастыря
	if (Hero_ThrowOut_Monastery == TRUE)	{
		Hero_ThrowOut_Monastery = FALSE;
		AI_Teleport(hero,"KLOSTER");
		if(Npc_HasItems(hero,ItKe_Innos_MIS) > 0)	{
			Npc_RemoveInvItems(hero,ItKe_Innos_MIS,Npc_HasItems(hero,ItKe_Innos_MIS));
			if (C_HeroIs_Odo() && Npc_HasItems(hero, ItAr_NOV_L))	{
				Npc_RemoveInvItem(hero,ItAr_NOV_L);
				CreateInvItem(hero,ITAR_Bau_L);
				AI_EquipArmor(hero,ITAR_Bau_L);
			};
		};
		B_SetTimePlus(0,20+Hlp_Random(5));
	};
	
	
	//ГГ споили и обчистили
	if (Rengaru_Hocus == TRUE)	{
		Rengaru_Hocus = FALSE;
		Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
		AI_Teleport(hero,"NW_CITY_PALCAMP_15");
		AI_PlayAniBS(hero,"T_STAND_2_FALL",BS_FALL);
		if (Npc_HasEquippedArmor(hero))	{
			var C_Item armor;	armor = Npc_GetEquippedArmor(hero);
			Npc_RemoveInvItem(hero,Hlp_GetInstanceID(armor));
		};
		Npc_RemoveInvItems(hero,ItMi_Gold,Npc_HasItems(hero,ItMi_Gold));
		B_StealAllFromNpcInventory(hero,100,ITEM_KAT_ARMOR|ITEM_KAT_FF|ITEM_KAT_NF|ITEM_KAT_NONE);
		B_SetTimePlus(12,Hlp_Random(60));
		hero.attribute[ATR_HITPOINTS] = 1;
		//Wld_PlayEffect("HERO_HURT", hero, hero, 0, 5, DAM_BLUNT, 0);
		Wld_StopEffect("SLEEP_BLEND");
		PrintScreen(PRINT_WhereAmI,-1,-1,FONT_Screen,3);
		B_RemoveNpc(VLK_492_Rengaru);
	};
	
	//у Гримбальда родилась идея
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OUT_1210_Grimbald)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_GotIdea))	{
		//B_Say(self,other,"$SC_HEYWAITASECOND");
		//AI_Wait(self,0.8);
		AI_StartState(self,ZS_Talk,0,"");
	};

	//ЕЛЕНА -----------------------------------------------
	if (C_HeroIs_Elena())	{
		if ((MIS_Elena_Present == LOG_Running) && !MIS_Elena_Present_TalkedAllMarketOnce)	{
			if (VLK_410_Baltram.aivar[AIV_TalkedToPlayer] 
				 && VLK_468_Canthar.aivar[AIV_TalkedToPlayer]
				 && VLK_407_Hakon.aivar[AIV_TalkedToPlayer]
				 && VLK_408_Jora.aivar[AIV_TalkedToPlayer]
				 && VLK_409_Zuris.aivar[AIV_TalkedToPlayer])	{
				B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_Market);
				MIS_Elena_Present_TalkedAllMarketOnce = TRUE;
			};
		};	
		
		//Брайан ушел переплавлять кольца
		if (C_NpcIs(self, VLK_457_Brian) && (MIS_Elena_Present_BrianReturn == TRUE))	{
			AI_StartState(self,ZS_Smith_Once,1,"NW_CITY_SMITH_FIRE");
		};
	};
	
	//Лечение Сагитты
	if (Sagitta_BigHeal)	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		Sagitta_BigHeal = FALSE;
	};
	
	//РУПЕРТ - попойка
	if (C_HeroIs_Rupert())	{
		if (C_NpcIs(self,VLK_425_Regis) && (Rupert_Binge > 0))	{
			Wld_PlayEffect("TIMELAPSE_BLEND", hero,hero,0,0,0,FALSE);
			if (Rupert_Binge == 1)	{
				B_SetTimePlus(0,Hlp_Random(30) + 15);
				AI_Teleport(self,"FP_STAND_CITY_TAVERN_02");
				AI_Teleport(hero,"FP_STAND_CITY_TAVERN_01");
			}
			else if (Rupert_Binge >= 100)	{
				hero.attribute[ATR_HITPOINTS] = 10;
				B_SetTimePlus(12,Hlp_Random(120));
				Rupert_Binge = -1;
			}
			else	{
				B_SetTimePlus(0,Hlp_Random(30) + 30);
				Snd_Play("Geldbeutel");
				Snd_Play("DRINKBOTTLE");
			};
		};
	};
	//Гарад - ковка меча, пропуск времени
	if (C_NpcIs(self, VLK_412_Harad))	{
		if (Harad_Rupert_Smith_SpendTime)	{
			Harad_Rupert_Smith_SpendTime = FALSE;
			B_SetTime(Harad_Rupert_Smith_Time / 60 - 24 * Wld_GetDay(), Harad_Rupert_Smith_Time % 60 + 1);
		};
		return;
	};
	
	//Трокар - вставить кабана
	if (C_NpcIs(self,OUT_1230_Trocar) && Trocar_InsertKeiler)	{
		B_InsertNpc(Keiler_Hog_Trocar,"NW_TROLLAREA_RITUAL_11");
		AI_GotoWP(self,"NW_TROLLAREA_RITUAL_11A");
		B_Attack(OUT_1230_Trocar,Keiler_Hog_Trocar,AR_MonsterVsHuman,0);
		Trocar_InsertKeiler = FALSE;
		return;
	};
	
	//Аттила вбивает умишко в голову ГГ
	if (C_NpcIs(self,VLK_469_Halvor))	{
		if (MIS_KhorinisPost_HalvorFight)	{
			B_StartOtherRoutine(self,"START");
			B_StartOtherRoutine(VLK_494_Attila,"START");
			B_Attack(self,other,AR_NONE,0);
			Npc_ClearAIQueue(VLK_494_Attila);
			AI_WaitTillEnd(VLK_494_Attila,self);
			B_Attack(VLK_494_Attila,other,AR_NONE,0);
			MIS_KhorinisPost_HalvorFight = FALSE;
			MIS_KhorinisPost_HalvorGimmePacket = TRUE;
		};
		return;
	};
	
	//удовольствия от Вани
	if (C_NpcIs(self,VLK_491_Vanja))	{
		if (Vanja_Ready)	{
			Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
			AI_UnequipArmor(other);
			AI_UnequipWeapons(other);
			AI_Wait(other, 1.5);
			Bromor_Paid = FALSE;
			Vanja_Ready = FALSE;
			B_SetTimePlus(2, 15 + Hlp_Random(30));
			AI_StopFX(hero,"SLEEP_BLEND");
			AI_PrintScreen(PRINT_SomePleasure, -1, 48, FONT_Screen, 2);
			AI_PrintScreen(PRINT_SomePleasure2, -1, 55, FONT_Screen, 2);
			B_StartOtherRoutine(self,"START");
		};
		return;
	};
	
	//Борка уходит с дороги
	//UNFINISHED 1 раз
	if (C_HeroIs_Sarah() && C_NpcIs(self,VLK_434_Borka))	{
		if (Borka_Sarah_AgreedToPass)	{
			AI_GotoWP(self,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
		};
	};
	
	//главарь контрабандистов тоже атакует
	if (C_NpcIs(self, BDT_801_Chief) && MIS_KhorinisPost_FailChief)	{
		B_Attack(self, hero, AR_KILL, 1);
	};
	
	//старик Берни исчезает после разговора
	B_RemoveGhost();
	
	//ОДО - в Ульфа больше не лезет пиво
	if (C_HeroIs_Odo() && C_NpcIs(self,NOV_602_Ulf)) {
		IF ((Ulf_Beer_Count >= Wld_GetDay() * 3 + 5) && !Hlp_StrCmp(Npc_GetNearestWP(self),"NW_MONASTERY_GRASS_06"))	{
			Npc_ClearAIQueue(self);
			AI_SetWalkmode(self,NPC_RUN);
			AI_GotoWP(self,"NW_MONASTERY_GRASS_06");
			AI_StartState(self,ZS_Pee,0,"NW_MONASTERY_GRASS_06");
		};		
	};
};
