
instance TRADER_Orlan(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

var int Orlan_Arrows_Day;
var int Orlan_Bolts_Day;

func void B_GiveTradeInv_Orlan(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Orlan))	{
		B_InsertNpc(TRADER_Orlan,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Orlan);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItLsTorch,3);
		CreateInvItems(slf,ItRw_Arrow,21);
		CreateInvItems(slf,ItRw_Bolt,5);
		
		CreateInvItems(slf,ItFo_Water,4);
		CreateInvItems(slf,ItFo_Beer,10);
		CreateInvItems(slf,ItFo_Bread,4);
		CreateInvItems(slf,ItFo_Milk,4);
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItMi_Pan,1);
		
		CreateInvItems(slf,ItMw_Zweihaender1,1);
		CreateInvItems(slf,ItMw_Bartaxt,1);
		CreateInvItems(slf,ItMw_Spicker,1);
		CreateInvItems(slf,ItMw_Schiffsaxt,1);
		CreateInvItems(slf,ItMw_Rabenschnabel,1);
		CreateInvItems(slf,ItMw_Rapier,1);
		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItRw_Bow_L_03,1);
		CreateInvItems(slf,ItRw_Bow_M_01,1);
		
		CreateInvItems(slf,ItBe_Addon_STR_5,1);
		CreateInvItems(slf,ItRi_Prot_Point_02,1);
		CreateInvItems(slf,ItAm_Dex_Strg_01,1);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItFo_Water) < 5)
	{
		CreateInvItems(slf,ItFo_Water,5);
	};
	if (Npc_HasItems(slf, ItFo_Beer) < 5)
	{
		CreateInvItems(slf,ItFo_Beer,5);
	};
	if (Npc_HasItems(slf, ItFo_Wine) < 5)
	{
		CreateInvItems(slf,ItFo_Wine,5);
	};
	if (Npc_HasItems(slf, ItFo_Bread) < 3)
	{
		CreateInvItems(slf,ItFo_Bread,3);
	};
	if (Npc_HasItems(slf, ItFo_Bacon) < 2)
	{
		CreateInvItems(slf,ItFo_Bacon,1);
	};
	if ((Npc_HasItems(slf, ItRw_Arrow) < 10) && (Orlan_Arrows_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItRw_Arrow,50);
		Bosper_Arrows_Day = Wld_GetDay() + 1;
	};
	if ((Npc_HasItems(slf, ItRw_Bolt) < 10) && (Orlan_Bolts_Day <= Wld_GetDay()))	{
		CreateInvItems(slf,ItRw_Bolt,50);
		Bosper_Bolts_Day = Wld_GetDay() + 1;
	};
};

func void B_CreateTradeItems_Orlan(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Orlan))	{
		B_InsertNpc(TRADER_Orlan,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Orlan,ItemInst,amount);
};

