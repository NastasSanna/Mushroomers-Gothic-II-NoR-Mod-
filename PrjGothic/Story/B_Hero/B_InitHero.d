

//при каждом запуске игры
func void B_InitHero_Overlays(var C_NPC slf)
{
	MEM_Debug(slf.name);
	if (slf.aivar[AIV_Gender] == FEMALE)	{
		var C_ITEM arm;	arm = Npc_GetEquippedArmor(slf);
		if (Hlp_IsItem(arm,ITAR_Leather_Baby))	{
			Mdl_RemoveOverlayMDS(slf,"Humans_Babe.mds");
		}
		else 	{
			Mdl_ApplyOverlayMds(slf,"Humans_Babe.MDS");
		};
	};
	B_SetSkillOverlay(slf);
	if (Npc_GetTalentSkill(slf,NPC_TALENT_ACROBAT))	{
		MEM_Debug("NPC_TALENT_ACROBAT");
		//Mdl_ApplyOverlayMds(slf,"Humans_Acrobatic.MDS");
		Npc_SetTalentSkill(slf,NPC_TALENT_ACROBAT,0);
		Npc_SetTalentSkill(slf,NPC_TALENT_ACROBAT,1);
	};
};

func void B_InitHero()
{
	if (!Hlp_IsValidNpc(hero))	{return;};
	NpcInv_UnpackAllItems(hero);
	B_InitHero_Overlays(hero);
	if (C_HeroIs_Elena())	{
		MOBNAME_Chest_Elena = MOBNAME_Chest_My;
		Npc_GetInvItem(hero,ItKe_Chest_Elena);
		if (Hlp_IsValidItem(item))	{
			item.text[3] = "от моего сундука";
		};
	}
	else	{
		MOBNAME_Chest_Elena = MOBNAME_Chest;
	};
	if (C_HeroIs_Till())	{
	};
	if (C_HeroIs_Talbin())	{
		MOBNAME_Chest_Talbin = MOBNAME_Chest_My;
		Npc_GetInvItem(hero,ItKe_Chest_Talbin);
		if (Hlp_IsValidItem(item))	{
			item.text[3] = "от моего сундука";
		};
	}
	else	{
		MOBNAME_Chest_Talbin = MOBNAME_Chest;
		MOBNAME_Chest_Engrom = MOBNAME_Chest;
		MOBNAME_MR_WhiteWolfFur = "";
		MOBNAME_MR_WhiteWolfTrace = "";
	};
	if (C_HeroIs_Erol())	{
		MOBNAME_GRAVE = "ћогила";
	};
	if (C_HeroIs_Sarah())	{
	};
	if (C_HeroIs_Rupert())	{
	};
	if (C_HeroIs_Odo())	{
		MOBNAME_BED_ODO = "ћо€ кровать";
	};
};
