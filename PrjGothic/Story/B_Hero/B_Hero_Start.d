
//начальное размещение персонажей и индивидуальные особенности
//однократно при старте игры в основном мире
var int B_Hero_Start_Once;
func void B_EquipBest(var C_NPC npc)
{
	AI_EquipBestArmor(npc);
	AI_EquipBestMeleeWeapon(npc);
	AI_EquipBestRangedWeapon(npc);
};

//окружение ГГ
func void B_Hero_PreStart()
{
	if (CurrentLevel != NEWWORLD_ZEN)	{return;};
	if (C_HeroIs_Elena())	{
		B_SetNameByIndex(Bau_900_Onar,1);
		B_SetNameByIndex(BAU_910_Maria,1);
		B_SetNameByIndex(BAU_914_Baeuerin,1);
		B_SetNameByIndex(BAU_902_Gunnar,1);
		B_SetNameByIndex(Bau_903_Bodo,1);
		B_SetNameByIndex(BAU_908_Hodges,1);
		B_StartOtherRoutine(Bau_900_Onar,"PRESTART");
		Bau_900_Onar.npcType = NPCTYPE_FRIEND;
		BAU_910_Maria.npcType = NPCTYPE_FRIEND;
		BAU_907_Wasili.npcType = NPCTYPE_FRIEND;
		Mob_CreateItems("CHEST_ELENA",ItMw_1h_Elena_MySword,1);
	}
	else	if (C_HeroIs_Till())	{
		B_SetNameByIndex(BAU_930_Sekob,1);
		B_SetNameByIndex(BAU_936_Rosi,1);
		B_StartOtherRoutine(BAU_930_Sekob,"PRESTART");
		B_StartOtherRoutine(BAU_936_Rosi,"PRESTART");
		Wld_InsertNpc(Molerat_Cross,"NW_FARM4_WOOD_MONSTER_MORE_02");
		BAU_930_Sekob.aivar[AIV_IgnoreFlags] = BAU_930_Sekob.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
		BAU_936_Rosi.npcType = NPCTYPE_FRIEND;
	}
	else	if (C_HeroIs_Talbin())	{
		B_StartOtherRoutine(OUT_1200_Engrom,"PRESTART");
		OUT_1200_Engrom.npcType = NPCTYPE_FRIEND;
		B_SetNameByIndex(BAU_963_Malak,1);
		B_StartOtherRoutine(BAU_963_Malak,"PRESTART");
		BAU_963_Malak.npcType = npctype_main;
		BAU_961_Gaan.npcType = NPCTYPE_FRIEND;
		B_StartOtherRoutine(BAU_961_Gaan,"PRESTART");
		Wld_InsertItem(ItMw_Nagelkeule, "FP_ITEM_TALBIN_WEAPON");
	}
	else	if (C_HeroIs_Erol())	{
		B_StartOtherRoutine(OUT_1202_Orlan,"PRESTART");
		OUT_1202_Orlan.npcType = NPCTYPE_FRIEND;
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_01");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_02");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_03");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_04");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_05");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_06");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_07");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_08");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_09");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_10");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_11");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_12");
		Wld_InsertItem(ItWr_OldStonePlate_Erol,"FP_ITEM_STONEPLATE_EROL_13");
	}
	else	if (C_HeroIs_Sarah())	{
		B_SetNameByIndex(Vlk_424_Alwin,1);
		B_SetNameByIndex(VLK_442_Arbeiter,1);
		B_SetNameByIndex(VLK_443_Arbeiter,1);
		B_SetNameByIndex(VLK_443_Arbeiter,1);
		Hanna_Paid = TRUE;
		VLK_414_Hanna.npcType = NPCTYPE_FRIEND;
		VLK_478_Irene.npcType = NPCTYPE_FRIEND;
		VLK_476_Fenia.npcType = NPCTYPE_FRIEND;
		VLK_471_Edda.npcType = NPCTYPE_FRIEND;
		VLK_435_Nadja.npcType = NPCTYPE_FRIEND;
	}
	else	if (C_HeroIs_Rupert())	{
		B_StartOtherRoutine(VLK_425_Regis,"PRESTART");
		VLK_425_Regis.npcType = NPCTYPE_FRIEND;
	}
	else	if (C_HeroIs_Odo())	{
		AI_Teleport(NOV_602_Ulf,"NW_MONASTERY_PLACE_01");
		B_StartOtherRoutine(NOV_602_Ulf,"PRESTART");
		KDF_500_Pyrokar.npcType = npctype_main;
		KDF_502_Ulthar.npcType = npctype_main;
		KDF_503_Karras.npcType = npctype_main;
		KDF_504_Parlan.npcType = npctype_main;
		KDF_505_Marduk.npcType = npctype_main;
		KDF_506_Neoras.npcType = npctype_main;
		KDF_507_Talamon.npcType = npctype_main;
		KDF_508_Gorax.npcType = npctype_main;
		NOV_601_Igaraz.npcType = npctype_main;
		NOV_602_Ulf.npcType = npctype_main;
		NOV_603_Agon.npcType = npctype_main;
		NOV_604_Dyrian.npcType = npctype_main;
		NOV_605_Opolos.npcType = npctype_main;
		Nov_608_Garwig.npcType = npctype_main;
	};
	//перепрятываем Вино
	Vino_HidePlace = Hlp_Random(3);
	if (Vino_HidePlace == 0)	{
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_UP_01");
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_XARDAS_UP_02");
	}
	else if (Vino_HidePlace == 1)	{
		B_StartOtherRoutine(BAU_952_Vino,"DRUNK1");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_UP_03");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_UP_04");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_01");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_01");
	}
	else if (Vino_HidePlace == 2)	{
		B_StartOtherRoutine(BAU_952_Vino,"DRUNK2");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_01");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_01");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_CITYWALL_RIGHT_03_03");
	};
	//способности соперников
	Cmp_Skill_Elena = Hlp_Random(50) + 50;
	Cmp_Skill_Sarah = Hlp_Random(35) + 50;
	Cmp_Skill_Erol = Hlp_Random(35) + 60;
	Cmp_Skill_Odo = Hlp_Random(45) + 50;
	Cmp_Skill_Rupert = Hlp_Random(35) + 45;
	Cmp_Skill_Talbin = Hlp_Random(40) + 50;
	Cmp_Skill_Till = Hlp_Random(55) + 30;
};

//сам ГГ
func void B_Hero_Start()
{
	if (CurrentLevel != NEWWORLD_ZEN)	{return;};
	if (B_Hero_Start_Once)	{return;};
	B_Hero_Start_Once = TRUE;
	hero.flags = hero.flags & ~NPC_FLAG_IMMORTAL;
	Npc_ClearInventory(hero);
	B_RemoveEquipped(hero);
	var C_NPC slf;	slf = Hlp_GetNpc(self);
	self = Hlp_GetNpc(hero);
	if (C_HeroIs_Elena())	{
		B_HeroGiveInv_Elena();
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_ELENA") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_ELENA");
		};
	}
	else	if (C_HeroIs_Till())	{
		B_HeroGiveInv_Till();
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_TILL") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_TILL");
		};
	}
	else	if (C_HeroIs_Talbin())	{
		B_HeroGiveInv_Talbin();
		Hero_CanSneak = 1;
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_TALBIN") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_TALBIN");
		};
	}
	else	if (C_HeroIs_Erol())	{
		B_HeroGiveInv_Erol();
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_EROL") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_EROL");
		};
	}
	else	if (C_HeroIs_Sarah())	{
		B_HeroGiveInv_Sarah();
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_SARAH") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_SARAH");
		};
	}
	else	if (C_HeroIs_Rupert())	{
		B_HeroGiveInv_Rupert();
		B_EquipBest(hero);
		if (Npc_GetDistToWP(hero,"START_RUPERT") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_RUPERT");
		};
	}
	else	if (C_HeroIs_Odo())	{
		B_HeroGiveInv_Odo();
		if (Npc_GetDistToWP(hero,"START_ODO") > TA_DIST_SELFWP_MAX)	{
			AI_Teleport(hero,"START_ODO");
		};
		B_EquipBest(hero);
		CreateInvItem(hero,ItMi_Broom);
		AI_UseItemToState(hero,ItMi_Broom,1);
	};
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	Npc_SetTalentSkill(hero,NPC_TALENT_PATRONGOD,PATRONGOD);
	self = Hlp_GetNpc(slf);
};

/* НЕ РАБОТАЕТ! Локация меняется, но не на StartVob
func void Game_ChangeLevel(var string Level, var string StartVob)
{
	//virtual void __thiscall oCGame::ChangeLevel(zSTRING const & zSTRING const &)	0x006C7290
	const int oCGame__ChangeLevel = 7107216;
	CALL_zStringPtrParam(StartVob);
	CALL_zStringPtrParam(Level);
	CALL__thiscall(MEM_ReadInt (MEMINT_oGame_Pointer_Address),oCGame__ChangeLevel);
};
//*/

//РАБОТАЕТ!
func void Game_TriggerChangeLevel(var string Level, var string StartVob)
{
	//virtual void __thiscall oCGame::TriggerChangeLevel(zSTRING const & zSTRING const &)	0x006C7AF0		0	8
	const int oCGame__TriggerChangeLevel = 7109360;
	CALL_zStringPtrParam(StartVob);
	CALL_zStringPtrParam(Level);
	CALL__thiscall(MEM_ReadInt (MEMINT_oGame_Pointer_Address),oCGame__TriggerChangeLevel);
};

func void TRG_TP_2_NW_FUNC()
{
	//*/
	if (C_HeroIs_Elena())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_ELENA");
		return;
	};
	if (C_HeroIs_Erol())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_EROL");
		return;
	};
	if (C_HeroIs_Odo())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_ODO");
		return;
	};
	if (C_HeroIs_Rupert())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_RUPERT");
		return;
	};
	if (C_HeroIs_Sarah())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_SARAH");
		return;
	};
	if (C_HeroIs_Talbin())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_TALBIN");
		return;
	};
	if (C_HeroIs_Till())	{
		Game_TriggerChangeLevel("Mushroomers\NEWWORLD_MR.ZEN","START_TILL");
		return;
	};
	/*/
	if (C_HeroIs_Elena())	{
		AI_Teleport(hero,"SW_2_NW_START_ELENA");
		return;
	};
	if (C_HeroIs_Erol())	{
		AI_Teleport(hero,"SW_2_NW_START_EROL");
		return;
	};
	if (C_HeroIs_Odo())	{
		AI_Teleport(hero,"SW_2_NW_START_ODO");
		return;
	};
	if (C_HeroIs_Rupert())	{
		AI_Teleport(hero,"SW_2_NW_START_RUPERT");
		return;
	};
	if (C_HeroIs_Sarah())	{
		AI_Teleport(hero,"SW_2_NW_START_SARAH");
		return;
	};
	if (C_HeroIs_Talbin())	{
		AI_Teleport(hero,"SW_2_NW_START_TALBIN");
		return;
	};
	if (C_HeroIs_Till())	{
		AI_Teleport(hero,"SW_2_NW_START_TILL");
		return;
	};
	//*/
};
