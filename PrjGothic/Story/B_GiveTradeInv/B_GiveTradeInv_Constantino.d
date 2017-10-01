
instance TRADER_Constantino(TRADER_Proto)
{
	TRADER_SetVisuals();
};

var int LAST_TRADE_TIME_Constantino_02;
var int LAST_TRADE_TIME_Constantino_03;

func void B_GiveTradeInv_Constantino(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Constantino))	{
		B_InsertNpc(TRADER_Constantino,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Constantino);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,4);
		CreateInvItems(slf,ItPo_Health_03,3);
		CreateInvItems(slf,ItPo_Mana_01,5);
		CreateInvItems(slf,ItPo_Mana_02,3);
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Perm_DEX,1);
		CreateInvItems(slf,ItPo_Perm_STR,1);
		CreateInvItems(slf,ItPo_Perm_Health,2);
		CreateInvItems(slf,ItPo_Perm_Mana,2);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	//всегда в наличии
	if (Npc_HasItems(slf,ItPo_Health_01) < 2)	{
		CreateInvItems(slf,ItPo_Health_01,1 + Hlp_Random(5));
	};
	if (Npc_HasItems(slf,ItPo_Mana_01) < 2)	{
		CreateInvItems(slf,ItPo_Mana_01,1 + Hlp_Random(5));
	};
	//появлются спустя 12 часов
	if (Wld_GetFullTime() - LAST_TRADE_TIME_Constantino_02 > 12 * 60)	{ 
		if (Npc_HasItems(slf,ItPo_Health_02) < 2)	{
			CreateInvItems(slf,ItPo_Health_02,1 + Hlp_Random(5));
		};
		if (Npc_HasItems(slf,ItPo_Mana_02) < 2)	{
			CreateInvItems(slf,ItPo_Mana_02,1 + Hlp_Random(5));
		};
		LAST_TRADE_TIME_Constantino_02 = Wld_GetFullTime();
	};
	//появлются спустя сутки
	if (Wld_GetFullTime() - LAST_TRADE_TIME_Constantino_03 > 24 * 60)	{ 
		if (Npc_HasItems(slf,ItPo_Health_03) < 2)	{
			CreateInvItems(slf,ItPo_Health_03,1 + Hlp_Random(5));
		};
		if (Npc_HasItems(slf,ItPo_Mana_03) < 2)	{
			CreateInvItems(slf,ItPo_Mana_03,1 + Hlp_Random(5));
		};
		LAST_TRADE_TIME_Constantino_03 = Wld_GetFullTime();
	};
};

func void B_CreateTradeItems_Constantino(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Constantino))	{
		B_InsertNpc(TRADER_Constantino,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Constantino,ItemInst,amount);
};

