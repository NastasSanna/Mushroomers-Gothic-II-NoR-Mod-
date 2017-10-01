
instance TRADER_Halvor(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

var int Trade_Halvor_Fish_Day;
var int Trade_Halvor_SmellyFish_Day;
func void B_GiveTradeInv_Halvor(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Halvor))	{
		B_InsertNpc(TRADER_Halvor,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Halvor);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Fish,5);
		CreateInvItems(slf,ItFo_SmellyFish,7);
		CreateInvItems(slf,ItMi_Addon_Shell_01,3);
		CreateInvItems(slf,ItMi_Addon_Shell_02,2);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if ((Npc_HasItems(slf, ItFo_Fish) < 2) && (Trade_Halvor_Fish_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItFo_Fish,5);
		Trade_Halvor_Fish_Day = Wld_GetDay() + 1;
	};
	if ((Npc_HasItems(slf, ItFo_SmellyFish) < 2) && (Trade_Halvor_SmellyFish_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItFo_SmellyFish,3);
		Trade_Halvor_SmellyFish_Day = Wld_GetDay() + 1;
	};
};

func void B_CreateTradeItems_Halvor(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Halvor))	{
		B_InsertNpc(TRADER_Halvor,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Halvor,ItemInst,amount);
};

