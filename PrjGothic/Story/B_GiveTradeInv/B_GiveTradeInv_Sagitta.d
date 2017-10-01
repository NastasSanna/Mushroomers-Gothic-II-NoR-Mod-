
instance TRADER_Sagitta(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Sagitta(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Sagitta))	{
		B_InsertNpc(TRADER_Sagitta,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Sagitta);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPl_SwampHerb,9);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItPl_Health_Herb_01,7);
		CreateInvItems(slf,ItPl_Health_Herb_02,4);
		CreateInvItems(slf,ItPl_Mana_Herb_01,3);
		
		CreateInvItems(slf,ItMr_Bottle,2);
		CreateInvItems(slf,ItMr_Branch,1);
		CreateInvItems(slf,ItMr_Governor,2);
		CreateInvItems(slf,ItMr_Red,10);
		CreateInvItems(slf,ItMr_KeilSmall,4);

		CreateInvItems(slf,ItMi_Flask,5);
		
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,10);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Health_Addon_04,2);
		CreateInvItems(slf,ItPo_Mana_01,2);
		CreateInvItems(slf,ItPo_Mana_02,4);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Mana_Addon_04,2);
		CreateInvItems(slf,ItPo_Speed,2);

		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,1);

		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItPo_Health_01) < 3)
	{
		CreateInvItems(slf,ItPo_Health_01,3);
	};
	if (Npc_HasItems(slf, ItPo_Health_02) < 1)
	{
		CreateInvItems(slf,ItPo_Health_02,5);
	};
	if (Npc_HasItems(slf, ItPo_Mana_01) < 1)
	{
		CreateInvItems(slf,ItPo_Mana_01,5);
	};
};

func void B_CreateTradeItems_Sagitta(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Sagitta))	{
		B_InsertNpc(TRADER_Sagitta,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Sagitta,ItemInst,amount);
};

