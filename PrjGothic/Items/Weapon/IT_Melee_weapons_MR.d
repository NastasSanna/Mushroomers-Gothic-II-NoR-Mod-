
//шпага Елены
prototype Proto_ItMw_1h_Elena_Sword(C_Item)
{
	name = "Шпага";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_VLKSchwert;
	damageTotal = Damage_VLKSchwert + 10;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1h_Elena_Sword(Proto_ItMw_1h_Elena_Sword)
{
	description = "Шпага Елены";
	text[1] = "На рукояти выгравано имя: Елена";
};

instance ItMw_1h_Elena_MySword(Proto_ItMw_1h_Elena_Sword)
{
	description = "Моя шпага";
	text[1] = "На рукояти выгравано мое имя";
};

//рудный меч (для Лемара)
//клон ItMw_1H_Special_01 без бонуса
instance ItMw_1H_Sword_Lehmar(C_Item)
{
	name = "Рудный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 650;
	damageTotal = Damage_Special_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

// ===============================================
const int Value_BrianKnife = 400;
const int Damage_BrianKnife = Damage_Wolfsmesser + 10;
const int Range_BrianKnife = Range_Wolfsmesser + 10;
const int Condition_BrianKnife = Condition_Wolfsmesser + 10;

instance ItMW_MR_1h_BrianKnife(C_Item)
{
	name = "Охотничий нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_BrianKnife;
	damageTotal = Damage_BrianKnife;
	damagetype = DAM_EDGE;
	range = Range_BrianKnife;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_BrianKnife;
	visual = "ItMw_MR_1h_Knife_01.3DS";
	description = name;
	text[0] = "Ученическая работа Брайана - охотничий нож с длинным лезвием.";
	text[1] = "Отлично подходит для разделки туш.";
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;		count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;	count[4] = Waffenbonus_05;
	text[5] = NAME_Value;			count[5] = value;
};

// ===============================================
const int Value_KitchenKnife = 150;
const int Damage_KitchenKnife = 10;
const int Range_KitchenKnife = 35;
const int Condition_KitchenKnife = 5;

prototype Proto_ItMW_MR_1h_KitchenKnife(C_Item)
{
	name = "Кухонный нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_KitchenKnife;
	damageTotal = Damage_KitchenKnife;
	damagetype = DAM_EDGE;
	range = Range_KitchenKnife;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_KitchenKnife;
	visual = "ItMw_MR_1h_Knife_02.3DS";
	description = name;
	text[0] = "Кухонный нож Хильды.";
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;		count[3] = cond_value[2];
	text[5] = NAME_Value;			count[5] = value;
};
instance ItMW_MR_1h_KitchenKnife(Proto_ItMW_MR_1h_KitchenKnife)
{
	text[1] = "Лезвие остро наточено.";
};
instance ItMW_MR_1h_KitchenKnife_Unsharpen(Proto_ItMW_MR_1h_KitchenKnife)
{
	damageTotal = Damage_KitchenKnife / 2;
	text[1] = "Незаточен.";
	count[2] = damageTotal;
};

// ===============================================

instance BUG_BROOM(C_ITEM)
{
	name = "Метла";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	value = Value_Broom;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	damagetype = DAM_BLUNT;
	damageTotal = 10;
	range = 120;
	description = "Боевая метла";
	text[5] = NAME_Value;
	count[5] = value;
};
