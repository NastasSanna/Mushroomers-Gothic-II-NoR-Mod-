
instance TRADER_Zuris(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Zuris(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Zuris))	{
		B_InsertNpc(TRADER_Zuris,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Zuris);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPl_Health_Herb_01,6);
		CreateInvItems(slf,ItPl_Health_Herb_02,2);
		CreateInvItems(slf,ItPl_Health_Herb_03,1);
		CreateInvItems(slf,ItPl_Mana_Herb_01,4);
		CreateInvItems(slf,ItPl_Mana_Herb_02,3);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPo_Mana_01,7);
		CreateInvItems(slf,ItPo_Mana_02,3);
		CreateInvItems(slf,ItPo_Mana_03,1);
		CreateInvItems(slf,ItPo_Health_01,10);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,ItSc_Light,6);
		CreateInvItems(slf,ItSc_Firebolt,20);
		CreateInvItems(slf,ItSc_Icebolt,8);
		CreateInvItems(slf,ItSc_InstantFireball,10);
		CreateInvItems(slf,ItSc_LightningFlash,5);
		CreateInvItems(slf,ItSc_HarmUndead,3);
		CreateInvItems(slf,ItSc_Firestorm,3);
		CreateInvItems(slf,ItSc_IceWave,1);
		CreateInvItems(slf,ItSc_Zap,5);
		CreateInvItems(slf,ItSc_IceCube,3);
		CreateInvItems(slf,ItSc_Windfist,3);
		CreateInvItems(slf,ItSc_IceWave,1);
		CreateInvItems(slf,ItSc_Firerain,1);
		CreateInvItems(slf,ItSc_Thunderstorm,1);
		CreateInvItems(slf,ItAm_Prot_Mage_01,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItPo_Mana_01) < 5)
	{
		CreateInvItems(slf,ItPo_Mana_01,5);
	};
	if (Npc_HasItems(slf, ItPo_Health_01) < 5)
	{
		CreateInvItems(slf,ItPo_Health_01,5);
	};
	if (Npc_HasItems(slf, ItPo_Mana_02) < 5)
	{
		CreateInvItems(slf,ItPo_Mana_02,5);
	};
	if (Npc_HasItems(slf, ItPo_Health_02) < 5)
	{
		CreateInvItems(slf,ItPo_Health_02,5);
	};
};

func void B_CreateTradeItems_Zuris(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Zuris))	{
		B_InsertNpc(TRADER_Zuris,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Zuris,ItemInst,amount);
};

