
const int Value_BurnTea = 20;
const int Value_RedMoss = 300;
const int Value_TrollBerry = 500;

// =========================================
instance ItPl_BurnTea(C_ITEM)
{
	name = "Горичай";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BurnTea;
	visual = "ItPl_BurnTea.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_BurnTea;
	description = name;
	text[1] = "Отвар горичая отпугивает гоблинов";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_BurnTea()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Perm_Herb);
};

// =========================================
instance ItPl_RedMoss(C_ITEM)
{
	name = "Красный лишайник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RedMoss;
	visual = "ItPl_RedMoss.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// =========================================
instance ItPl_TrollBerry(C_Item)
{
	name = "Ягода тролля";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_TrollBerry;
	visual = "itfo_plants_trollberrys_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_TrollBerry;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Str;	count[1] = 2;
	text[2] = NAME_Bonus_Dex;	count[2] = 1;
	text[5] = NAME_Value;
	count[5] = Value_TrollBerry;
};


func void Use_TrollBerry()
{
	B_RaiseAttribute(self,ATR_STRENGTH,2);
	B_RaiseAttribute(self,ATR_DEXTERITY,1);
};