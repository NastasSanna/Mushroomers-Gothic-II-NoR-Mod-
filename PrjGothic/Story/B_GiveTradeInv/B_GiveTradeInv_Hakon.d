
instance TRADER_Hakon(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Hakon(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Hakon))	{
		B_InsertNpc(TRADER_Hakon,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Hakon);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItBE_Addon_Leather_01,1);
		CreateInvItems(slf,ItBe_Addon_Prot_TOTAL,1);
		CreateInvItems(slf,ItAm_Prot_Edge_01,1);
		
		CreateInvItems(slf,ItMw_ShortSword3,1);
		CreateInvItems(slf,ItMw_ShortSword4,1);
		CreateInvItems(slf,ItMw_Richtstab,1);
		CreateInvItems(slf,ItMw_Schwert3,1);
		CreateInvItems(slf,ItMw_Streitkolben,1);
		CreateInvItems(slf,ItMw_Schiffsaxt,1);
		CreateInvItems(slf,ItMw_Schlachtaxt,1);
		CreateInvItems(slf,ItMw_Steinbrecher,1);
		CreateInvItems(slf,ItMw_Doppelaxt,2);
		CreateInvItems(slf,ItMw_Streitkolben,1);

		CreateInvItems(slf,ItMiSwordraw,5);
		
		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Hakon(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Hakon))	{
		B_InsertNpc(TRADER_Hakon,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Hakon,ItemInst,amount);
};

