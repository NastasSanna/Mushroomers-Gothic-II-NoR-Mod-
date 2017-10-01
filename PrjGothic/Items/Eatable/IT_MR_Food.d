
const int Value_MrSoup = 10;
const int HP_MrSoup = 25;
const int Dex_MrSoup = 2;

const int Value_FriedEars = 7;
const int HP_FriedEars = 50;
const int ManaMax_FriedEars = 3;

const int Value_KardifLiqueur = 20;
const int HPMax_KardifLiqueur = 5;

const int Value_VinoWine = 30;
const int ManaMax_VinoWine = 3;

// Грибной суп от Теклы ===================================
instance ItFo_MrSoup(C_Item)
{
	name = "Грибной суп";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_MrSoup;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_MrSoup;
	description = name;
	text[2] = NAME_Bonus_HP;		count[2] = HP_MrSoup;
	text[3] = NAME_Bonus_Dex;		count[3] = Dex_MrSoup;
	text[5] = NAME_Value;			count[5] = value;
};

func void Use_MrSoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MrSoup);
	B_RaiseAttribute(self,ATR_DEXTERITY,Dex_MrSoup);
};

// Уши в масле (Кулинарные изыски) ===================================
instance ItFo_FriedEars(C_Item)
{
	name = "Уши в масле";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FriedEars;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FriedEars;
	description = name;
	text[1] = "Жареные грибы “Дамские уши“";
	text[2] = NAME_Bonus_HP;		count[2] = HP_FriedEars;
	text[3] = NAME_Bonus_ManaMax;	count[3] = ManaMax_FriedEars;
	text[5] = NAME_Value;			count[5] = value;
};

func void Use_FriedEars()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FriedEars);
	B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_FriedEars);
};

// Наливка Кардифа (Сара: Старые друзья) ===================================
instance ItFo_KardifLiqueur(C_Item)
{
	name = "Наливка Кардифа";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_KardifLiqueur;
	visual = "ItFo_Wine.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_KardifLiqueur;
	description = name;
	text[1] = "Особая наливка от Кардифа";
	text[2] = NAME_Bonus_HpMax;		count[2] = HPMax_KardifLiqueur;
	text[5] = NAME_Value;			count[5] = value;
};

func void Use_KardifLiqueur()
{
	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_KardifLiqueur);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_KardifLiqueur);
};

// ВИНО от Вино ===================================
instance ItFo_Wine_Vino(C_Item)
{
	name = "Вино";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_VinoWine;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Wine_Vino;
	description = "Вино от Вино";
	text[1] = NAME_Bonus_HP;		count[1] = HP_Wine;
	text[2] = NAME_Bonus_ManaMax;	count[2] = ManaMax_VinoWine;
	text[4] = "Вино уверял, что это хорошее вино.";
	text[5] = NAME_Value;			count[5] = Value_Wine;
};


func void Use_Wine_Vino()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_VinoWine);
	Npc_ChangeAttribute(self,ATR_MANA,ManaMax_VinoWine);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
};

