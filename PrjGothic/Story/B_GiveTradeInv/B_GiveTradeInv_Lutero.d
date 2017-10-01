
instance TRADER_Lutero(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Lutero(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Lutero))	{
		B_InsertNpc(TRADER_Lutero,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Lutero);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItSc_Shrink,1);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItMi_Sulfur,1);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,itat_LurkerSkin,1);
		CreateInvItems(slf,ItMi_GoldRing,1);

		slf.aivar[AIV_ChapterInv] = 1;
	};
};

func void B_CreateTradeItems_Lutero(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Lutero))	{
		B_InsertNpc(TRADER_Lutero,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Lutero,ItemInst,amount);
};

