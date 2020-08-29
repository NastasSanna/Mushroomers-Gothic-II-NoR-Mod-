
instance TRADER_Gorax(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Gorax(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Gorax))	{
		B_InsertNpc(TRADER_Gorax,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Gorax);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Wine,7);
		
		CreateInvItems(slf,ItPo_Health_01,15);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItPo_Mana_01,30);
		CreateInvItems(slf,ItPo_Mana_02,20);

		CreateInvItems(slf,ItMi_Sulfur,5);
		CreateInvItems(slf,ItMi_Coal,4);
		CreateInvItems(slf,ItMi_Aquamarine,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_HolyWater,3);

		CreateInvItems(slf,ItBE_Addon_NOV_01,1);
		CreateInvItems(slf,ItMW_Addon_Stab01,1);
		CreateInvItems(slf,ItRi_Mana_01,1);
		CreateInvItems(slf,ItMw_1h_Nov_Mace,1);
		
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_LightHeal,7);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_FullHeal,3);
		
		CreateInvItems(slf,ItSc_SumGobSkel,5);
		CreateInvItems(slf,ItSc_SumWolf,5);
		CreateInvItems(slf,ItSc_Firebolt,5);
		CreateInvItems(slf,ItSc_Icebolt,5);
		CreateInvItems(slf,ItSc_InstantFireball,5);
		CreateInvItems(slf,ItSc_Windfist,4);
		CreateInvItems(slf,ItSc_Firestorm,4);
		CreateInvItems(slf,ItSc_ThunderBall,2);
		CreateInvItems(slf,ItSc_IceCube,3);
		CreateInvItems(slf,ItSc_LightningFlash,5);
		CreateInvItems(slf,ItSc_HarmUndead,2);
		CreateInvItems(slf,ItSc_ChargeFireBall,3);
		CreateInvItems(slf,ItSc_IceWave,1);

		CreateInvItems(slf,ItSc_TrfGiantBug,1);
		CreateInvItems(slf,ItSc_TrfWolf,1);
		CreateInvItems(slf,ItSc_TrfSheep,3);
		CreateInvItems(slf,ItSc_TrfScavenger,3);
		
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItPo_Health_02) < 10)
	{
		CreateInvItems(slf,ItPo_Health_02,5);
	};
	if (Npc_HasItems(slf, ItPo_Health_03) < 1)
	{
		CreateInvItems(slf,ItPo_Health_02,3);
	};
	if (Npc_HasItems(slf, ItPo_Mana_02) < 10)
	{
		CreateInvItems(slf,ItPo_Mana_02,4);
	};
	if (Npc_HasItems(slf, ItPo_Mana_03) < 1)
	{
		CreateInvItems(slf,ItPo_Mana_03,3);
	};
	if (Npc_HasItems(slf, ItSc_Firebolt) < 3)
	{
		CreateInvItems(slf,ItSc_Firebolt,3);
	};
	if (Npc_HasItems(slf, ItSc_InstantFireball) < 3)
	{
		CreateInvItems(slf,ItSc_InstantFireball,3);
	};
	if (Npc_HasItems(slf, ItSc_Icebolt) < 3)
	{
		CreateInvItems(slf,ItSc_Icebolt,3);
	};
	if (Npc_HasItems(slf, ItSc_MediumHeal) < 3)
	{
		CreateInvItems(slf,ItSc_MediumHeal,3);
	};
	if (Npc_HasItems(slf, ItSc_FullHeal) < 1)
	{
		CreateInvItems(slf,ItSc_FullHeal,1);
	};
	if (Npc_HasItems(slf, ItMw_1h_Nov_Mace) < 1)
	{
		CreateInvItems(slf,ItMw_1h_Nov_Mace,1);
	};
	if (Npc_HasItems(slf, ItMi_Flask) < 3)
	{
		CreateInvItems(slf,ItMi_Flask,5);
	};
};

func void B_CreateTradeItems_Gorax(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Gorax))	{
		B_InsertNpc(TRADER_Gorax,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Gorax,ItemInst,amount);
};

