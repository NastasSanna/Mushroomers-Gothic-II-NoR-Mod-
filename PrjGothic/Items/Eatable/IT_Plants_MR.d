
const int Value_BurnTea = 20;
const int Value_RedMoss = 300;

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
