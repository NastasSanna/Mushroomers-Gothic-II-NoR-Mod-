
instance TRADER_Bootlegger(TRADER_Proto)
{
	TRADER_SetVisuals();
}; 

func void B_GiveTradeInv_Bootlegger(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Bootlegger))	{
		B_InsertNpc(TRADER_Bootlegger,MEM_FARFARAWAY);
	};
	B_TradeSwap(slf, TRADER_Bootlegger);

	if (slf.aivar[AIV_ChapterInv] == 0)
	{
		CreateInvItems(slf,ItFo_Addon_Rum,8);
		CreateInvItems(slf,ItFo_Addon_Grog,13);
		CreateInvItems(slf,ItFo_Booze,5);
		CreateInvItems(slf,ItFo_Addon_Pfeffer_01,2);
		CreateInvItems(slf,ItPl_SwampHerb,8);
		CreateInvItems(slf,ItMi_Joint,3);
		CreateInvItems(slf,ItMi_Addon_WhitePearl,1);
		CreateInvItems(slf,ItMi_SilverNecklace,1);
		CreateInvItems(slf,ItMi_GoldRing,1);
		CreateInvItems(slf,ItMi_Nugget,1);
		CreateInvItems(slf,ItSc_SumSkel,2);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,1);
		CreateInvItems(slf,ItSc_PalDestroyEvil,1);
		CreateInvItems(slf,ItSc_MediumHeal,2);
		slf.aivar[AIV_ChapterInv] = 1;
	};
	if(Npc_HasItems(slf,ItFo_Booze) < 3)	{
		CreateInvItems(slf,ItFo_Booze,Hlp_Random(5));
	};
	if(Npc_HasItems(slf,ItMi_Joint) < 1)	{
		CreateInvItems(slf,ItMi_Joint,Hlp_Random(3));
	};
};

func void B_CreateTradeItems_Bootlegger(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Bootlegger))	{
		B_InsertNpc(TRADER_Bootlegger,MEM_FARFARAWAY);
	};
	CreateInvItems(TRADER_Bootlegger,ItemInst,amount);
};

