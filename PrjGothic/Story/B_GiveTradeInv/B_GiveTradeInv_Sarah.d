
instance TRADER_Sarah(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Sarah(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Sarah))	{
		B_InsertNpc(TRADER_Sarah,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Sarah);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItLsTorch,10);

		CreateInvItems(slf,ItMw_Stabkeule,1);
		CreateInvItems(slf,ItMw_Steinbrecher,1);
		CreateInvItems(slf,ItMw_Schwert2,1);
		CreateInvItems(slf,ItMw_Bartaxt,1);
		CreateInvItems(slf,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(slf,ItMw_Inquisitor,1);
		
		CreateInvItems(slf,ItFo_KardifLiqueur,1);
		CreateInvItems(slf,ItFo_Apple,5);
		CreateInvItems(slf,ItFo_Cheese_OldShepherd,4);
		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,1);

		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Sarah(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Sarah))	{
		B_InsertNpc(TRADER_Sarah,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Sarah,ItemInst,amount);
};

