
instance TRADER_Bosper(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

var int Bosper_Arrows_Day;
var int Bosper_Bolts_Day;

func void B_GiveTradeInv_Bosper(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Bosper))	{
		B_InsertNpc(TRADER_Bosper,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Bosper);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItRw_Bolt,50);
		CreateInvItems(slf,ItRw_Bow_L_01,3);
		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItRw_Bow_L_03,2);
		CreateInvItems(slf,ItRw_Bow_L_04,1);
		CreateInvItems(slf,ItRw_Bow_M_01,1);
		CreateInvItems(slf,ItRw_Bow_M_02,1);
		CreateInvItems(slf,ItRw_Bow_M_03,1);
		CreateInvItems(slf,ItRw_Bow_H_01,1);
		CreateInvItems(slf,ItRw_Crossbow_L_01,1);
		CreateInvItems(slf,ItRw_Crossbow_L_02,1);
		CreateInvItems(slf,ItRw_Crossbow_M_02,1);
		CreateInvItems(slf,ItBE_Addon_Leather_01,1);
		CreateInvItems(slf,ItAt_WolfFur,9);
		CreateInvItems(slf,ItAt_Addon_KeilerFur,14);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if ((Npc_HasItems(slf, ItRw_Arrow) < 10) && (Bosper_Arrows_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItRw_Arrow,100);
		Bosper_Arrows_Day = Wld_GetDay() + 1;
	};
	if ((Npc_HasItems(slf, ItRw_Bolt) < 10) && (Bosper_Bolts_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItRw_Bolt,100);
		Bosper_Bolts_Day = Wld_GetDay() + 1;
	};
};

func void B_CreateTradeItems_Bosper(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Bosper))	{
		B_InsertNpc(TRADER_Bosper,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Bosper,ItemInst,amount);
};

