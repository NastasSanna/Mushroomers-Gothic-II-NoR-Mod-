
instance TRADER_Brahim(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Brahim(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Brahim))	{
		B_InsertNpc(TRADER_Brahim,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Brahim);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItWr_Map_NewWorld,3);
		CreateInvItems(slf,ItWr_Map_NewWorld_City,2);
		CreateInvItems(slf,ItRi_HP_01,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Brahim(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Brahim))	{
		B_InsertNpc(TRADER_Brahim,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Brahim,ItemInst,amount);
};

