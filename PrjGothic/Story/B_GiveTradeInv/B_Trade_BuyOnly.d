
const int TempInv_Hero = 0;
const int TempInv_Seller = 0;

func void B_Trade_BuyOnly()
{
	NpcInv_UnpackAllItems(hero);
	var int gold_cnt;	gold_cnt = Npc_HasItems(hero, ItMi_Gold);
	Npc_RemoveInvItems(hero, ItMi_Gold, gold_cnt);
	
	//подмена инвентаря
	var oCNpc h;	h = Hlp_GetNpc(hero);
	TempInv_Hero = h.inventory2_inventory_next;
	h.inventory2_inventory_next = 0;
	
	//только золото
	CreateInvItems(hero, ItMi_Gold, gold_cnt);
};


func void B_Trade_BuyOnly_Back()
{
	if (TempInv_Hero == 0)	{
		return;
	};
	var oCNpc h;	h = Hlp_GetNpc(hero);
	//перекидываем вещи обратно
	NpcInv_Merge(_@(h.inventory2_vtbl), TempInv_Hero);
	TempInv_Hero = 0;
	NpcInv_UnpackAllItems(hero);
};


func void B_Trade_SellOnlyMushrooms(var C_NPC slf)
{
	NpcInv_UnpackAllItems(slf);
	//выбираем грибы из инвентаря
	var oCNpc s;	s = Hlp_GetNpc(slf);
	TempInv_Seller = NpcInv_Split(_@(s.inventory2_inventory_Compare), C_ItemIsNotMushroomByPtr);
	NpcInv_SetPrices(s.inventory2_inventory_next, C_SetMushroomPriceByPtr);
};


func void B_Trade_SellOnly_Back(var C_NPC slf)
{
	if (TempInv_Seller == 0)	{
		return;
	};
	var oCNpc s;	s = Hlp_GetNpc(slf);
	//перекидываем вещи обратно
	NpcInv_Merge(_@(s.inventory2_vtbl), TempInv_Seller);
	TempInv_Seller = 0;
	NpcInv_UnpackAllItems(slf);
};

