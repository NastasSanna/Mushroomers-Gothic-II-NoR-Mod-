
instance TRADER_Canthar(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Canthar(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Canthar))	{
		B_InsertNpc(TRADER_Canthar,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Canthar);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItAm_Prot_Mage_01,1);
		CreateInvItems(slf,ItMw_1h_Bau_Axe,3);
		CreateInvItems(slf,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(slf,ItMw_Nagelkeule,1);
		CreateInvItems(slf,ItMw_ShortSword3,1);
		CreateInvItems(slf,ItMw_Hellebarde,1);
		CreateInvItems(slf,ItMw_Piratensaebel,1);
		CreateInvItems(slf,ItMw_Schwert2,2);
		CreateInvItems(slf,ItMw_Zweihaender3,1);
		CreateInvItems(slf,ItMw_Rabenschnabel,1);
		CreateInvItems(slf,ItMw_Streitkolben,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Canthar(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Canthar))	{
		B_InsertNpc(TRADER_Canthar,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Canthar,ItemInst,amount);
};

