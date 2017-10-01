
instance TRADER_Isgaroth(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Isgaroth(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Isgaroth))	{
		B_InsertNpc(TRADER_Isgaroth,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Isgaroth);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItPo_Mana_01,2);
		CreateInvItems(slf,ItPo_Health_01,3);
		CreateInvItems(slf,ItSc_Sleep,1);
		CreateInvItems(slf,ItSc_Light,5);
		CreateInvItems(slf,ItSc_Firebolt,5);
		CreateInvItems(slf,ItSc_Zap,5);
		CreateInvItems(slf,ItSc_LightHeal,5);
		CreateInvItems(slf,ItSc_SumGobSkel,2);
		
		CreateInvItems(slf,ItSc_SumDemon,1);
		CreateInvItems(slf,ItSc_SumSkel,2);
		
		CreateInvItems(slf,ItSc_Fear,2);
		CreateInvItems(slf,ItSc_Light,8);
		CreateInvItems(slf,ItSc_LightHeal,3);
		CreateInvItems(slf,ItSc_MediumHeal,5);
		CreateInvItems(slf,ItSc_FullHeal,3);
		
		CreateInvItems(slf,ItRi_Hp_Mana_01,1);
		CreateInvItems(slf,ItRi_Mana_02,1);
		
		CreateInvItems(slf,ItMi_Coal,2);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Pitch,1);

		slf.aivar[AIV_ChapterInv] = 1;
	};
	if (Npc_HasItems(slf, ItSc_Light) < 3)
	{
		CreateInvItems(slf,ItSc_Light,1);
	};
	if (Npc_HasItems(slf, ItSc_LightningFlash) < 2)
	{
		CreateInvItems(slf,ItSc_LightningFlash,2);
	};
	if (Npc_HasItems(slf, ItSc_Windfist) < 2)
	{
		CreateInvItems(slf,ItSc_Windfist,2);
	};
};

func void B_CreateTradeItems_Isgaroth(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Isgaroth))	{
		B_InsertNpc(TRADER_Isgaroth,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Isgaroth,ItemInst,amount);
};

