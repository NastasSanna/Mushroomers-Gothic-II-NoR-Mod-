
instance TRADER_Jora(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Jora(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Jora))	{
		B_InsertNpc(TRADER_Jora,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Jora);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPl_Health_Herb_01,2);
		CreateInvItems(slf,ItPl_Mushroom_01,4);
		CreateInvItems(slf,ItPl_Mushroom_02,2);
		CreateInvItems(slf,ItMr_Red,5);
		CreateInvItems(slf,ItMr_BrownOiler,3);
		
		CreateInvItems(slf,ItFoMutton,8);
		CreateInvItems(slf,ItFo_Wine,1);
		CreateInvItems(slf,ItFo_Apple,10);
		CreateInvItems(slf,ItFo_Bacon,4);
		CreateInvItems(slf,ItFo_Bread,7);
		CreateInvItems(slf,ItFo_Cheese,5);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItPl_Beet,8);
		
		CreateInvItems(slf,ItMi_Sulfur,1);

		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItRw_Bolt,30);
		
		CreateInvItems(slf,ItMw_1H_Sword_L_03,1);
		CreateInvItems(slf,ItMw_ShortSword2,1);
		CreateInvItems(slf,ItMw_Folteraxt,1);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,ItAm_Prot_Fire_01,1);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItMi_Pan,2);
		CreateInvItems(slf,ItMi_Saw,1);

		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItRw_Arrow) < 10)
	{
		CreateInvItems(slf,ItRw_Arrow,10);
	};
	if (Npc_HasItems(slf, ItRw_Bolt) < 10)
	{
		CreateInvItems(slf,ItRw_Bolt,10);
	};
	if (Npc_HasItems(slf, ItFoMutton) < 4)
	{
		CreateInvItems(slf,ItFoMutton,3);
	};
};

func void B_CreateTradeItems_Jora(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Jora))	{
		B_InsertNpc(TRADER_Jora,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Jora,ItemInst,amount);
};

