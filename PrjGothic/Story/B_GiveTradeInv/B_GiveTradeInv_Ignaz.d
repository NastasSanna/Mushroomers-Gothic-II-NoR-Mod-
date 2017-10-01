
instance TRADER_Ignaz(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Ignaz(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Ignaz))	{
		B_InsertNpc(TRADER_Ignaz,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Ignaz);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
//		CreateInvItems(slf,ItMr_DragonTears,1);
		CreateInvItems(slf,ItMr_Ivy,3);
		CreateInvItems(slf,ItMr_LadysEar,4);
		CreateInvItems(slf,ItPl_Mushroom_01,3);
		CreateInvItems(slf,ItPl_Mushroom_02,1);
		
		CreateInvItems(slf,ItPo_Mana_01,1);
		CreateInvItems(slf,ItPo_Health_01,1);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItPo_Health_Addon_04,3);
		CreateInvItems(slf,ItPo_Mana_Addon_04,3);
		
		CreateInvItems(slf,ItMi_Flask,10);
		
		CreateInvItems(slf,ItSc_TrfSheep,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,ItSc_TrfGiantRat,1);
		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,3);
		CreateInvItems(slf,ItSc_TrfLurker,1);
		CreateInvItems(slf,ItSc_TrfWaran,1);
		CreateInvItems(slf,ItSc_TrfSnapper,3);
		CreateInvItems(slf,ItSc_TrfWarg,1);
		CreateInvItems(slf,ItSc_TrfShadowbeast,1);
		CreateInvItems(slf,ItSc_TrfDragonSnapper,1);
		CreateInvItems(slf,ItSc_TrfFireWaran,1);
		CreateInvItems(slf,ItSc_Sleep,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Ignaz(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Ignaz))	{
		B_InsertNpc(TRADER_Ignaz,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Ignaz,ItemInst,amount);
};

