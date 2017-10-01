/**************************************************************************

								ПОЯСА
  
***************************************************************************/

const int Value_ItBE_Addon_Leather_01 = 250;
const int Value_ItBE_Addon_Leather_02 = 250;
const int Value_ItBE_Addon_SLD_01 = 250;
const int Value_ItBE_Addon_NOV_01 = 250;
const int Value_ItBE_Addon_MIL_01 = 250;
const int Value_ItBE_Addon_KDF_01 = 250;
const int Value_ItBE_Addon_MC = 250;
const int Value_ItBE_Addon_STR_5 = 500;
const int Value_ItBE_Addon_STR_10 = 1000;
const int Value_ItBE_Addon_DEX_5 = 500;
const int Value_ItBE_Addon_DEX_10 = 1000;
const int Value_ItBE_Addon_Prot_Edge = 500;
const int Value_ItBE_Addon_Prot_Point = 500;
const int Value_ItBE_Addon_Prot_Magic = 500;
const int Value_ItBE_Addon_Prot_Fire = 500;
const int Value_ItBE_Addon_Prot_EdgPoi = 1000;
const int Value_ItBE_Addon_Prot_Total = 2000;
const int BA_Bonus01 = 5;
const int BA_Bonus02 = 5;
const int Belt_Prot_01 = 5;
const int BeltBonus_STR01 = 5;
const int BeltBonus_STR02 = 10;
const int BeltBonus_DEX01 = 5;
const int BeltBonus_DEX02 = 10;
const int BeltBonus_ProtEdge = 10;
const int BeltBonus_ProtPoint = 10;
const int BeltBonus_ProtMagic = 10;
const int BeltBonus_ProtFire = 10;
const int BeltBonus_ProtEdgPoi = 7;
const int BeltBonus_ProtTotal = 7;

// БОНУСЫ ПОЯСОВ ==============================================================

// Кожанка --------------------------------------------------------------------

func void SetLeatherBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((LeatherArmor_Equipped == FALSE) || (LeatherBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus02;
			self.protection[PROT_FIRE]	+= BA_Bonus02;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((LeatherArmor_Equipped == TRUE) && (LeatherBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus02;
			self.protection[PROT_FIRE]	-= BA_Bonus02;
		};	
		// запомнить, что надето
		LeatherArmor_Equipped = nArmorEquipped;
		LeatherBelt_Equipped = nBeltEquipped;
	};
};

// Ополчения ------------------------------------------------------------------

func void SetMilBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((MilArmor_Equipped == FALSE) || (MilBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus01;
			self.protection[PROT_FIRE]	+= BA_Bonus01;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((MilArmor_Equipped == TRUE) && (MilBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus01;
			self.protection[PROT_FIRE]	-= BA_Bonus01;
		};	
		// запомнить, что надето
		MilArmor_Equipped = nArmorEquipped;
		MilBelt_Equipped = nBeltEquipped;
	};
};

// Наемника -------------------------------------------------------------------

func void SetSldBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((SldArmor_Equipped == FALSE) || (SldBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus01;
			self.protection[PROT_FIRE]	+= BA_Bonus01;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((SldArmor_Equipped == TRUE) && (SldBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus01;
			self.protection[PROT_FIRE]	-= BA_Bonus01;
		};	
		// запомнить, что надето
		SldArmor_Equipped = nArmorEquipped;
		SldBelt_Equipped = nBeltEquipped;
	};
};

// Послушника -----------------------------------------------------------------

func void SetNovBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((NovArmor_Equipped == FALSE) || (NovBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus01;
			self.protection[PROT_FIRE]	+= BA_Bonus01;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((NovArmor_Equipped == TRUE) && (NovBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus01;
			self.protection[PROT_FIRE]	-= BA_Bonus01;
		};	
		// запомнить, что надето
		NovArmor_Equipped = nArmorEquipped;
		NovBelt_Equipped = nBeltEquipped;
	};
};

// Мага Огня ------------------------------------------------------------------

func void SetKDFBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((KDFArmor_Equipped == FALSE) || (KDFBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus01;
			self.protection[PROT_FIRE]	+= BA_Bonus01;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((KDFArmor_Equipped == TRUE) && (KDFBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus01;
			self.protection[PROT_FIRE]	-= BA_Bonus01;
		};	
		// запомнить, что надето
		KDFArmor_Equipped = nArmorEquipped;
		KDFBelt_Equipped = nBeltEquipped;
	};
};

// Из краулера ----------------------------------------------------------------

func void SetMCBeltBonus(var int nArmorEquipped, var int nBeltEquipped)
{
	if(Npc_IsPlayer(self))
	{
		// если теперь надеты и пояс, и броня, а раньше что-то отсутствовало - добавить бонус
		if (((nArmorEquipped == TRUE) && (nBeltEquipped == TRUE)) &&
			((MCArmor_Equipped == FALSE) || (MCBelt_Equipped == FALSE)))
		{
			self.protection[PROT_EDGE]	+= BA_Bonus01;
			self.protection[PROT_BLUNT]	+= BA_Bonus01;
			self.protection[PROT_POINT]	+= BA_Bonus01;
			self.protection[PROT_MAGIC]	+= BA_Bonus01;
			self.protection[PROT_FIRE]	+= BA_Bonus01;
		};
		// если раньше были надеты и пояс, и броня, а теперь что-то снято - убрать бонус 
		if (((nArmorEquipped == FALSE) || (nBeltEquipped == FALSE)) &&
			((MCArmor_Equipped == TRUE) && (MCBelt_Equipped == TRUE)))
		{
			self.protection[PROT_EDGE]	-= BA_Bonus01;
			self.protection[PROT_BLUNT]	-= BA_Bonus01;
			self.protection[PROT_POINT]	-= BA_Bonus01;
			self.protection[PROT_MAGIC]	-= BA_Bonus01;
			self.protection[PROT_FIRE]	-= BA_Bonus01;
		};	
		// запомнить, что надето
		MCArmor_Equipped = nArmorEquipped;
		MCBelt_Equipped = nBeltEquipped;
	};
};

// ============================================================================

instance ItBE_Addon_Leather_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Leather_01;
	visual = "ItMI_Belt_06.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_Leather_01;
	on_unequip = UnEquip_ItBE_Addon_Leather_01;
	description = "Кожаный ремень";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArLeather;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_Leather_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetLeatherBeltBonus(LeatherArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_Leather_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetLeatherBeltBonus(LeatherArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBE_Addon_SLD_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_SLD_01;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_SLD_01;
	on_unequip = UnEquip_ItBE_Addon_SLD_01;
	description = "Пояс наемника";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArSLD;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_SLD_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetSLDBeltBonus(SLDArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_SLD_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetSLDBeltBonus(SLDArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBE_Addon_NOV_01(C_Item)
{
	name = NAME_Addon_BeltMage;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_NOV_01;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_NOV_01;
	on_unequip = UnEquip_ItBE_Addon_NOV_01;
	description = "Кушак готовности";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArNOV;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_NOV_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetNOVBeltBonus(NOVArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_NOV_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetNOVBeltBonus(NOVArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBE_Addon_MIL_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_MIL_01;
	visual = "ItMi_Belt_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_MIL_01;
	on_unequip = UnEquip_ItBE_Addon_MIL_01;
	description = "Пояс ополчения";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArMIL;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_MIL_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetMilBeltBonus(MILArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_MIL_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetMilBeltBonus(MILArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBE_Addon_KDF_01(C_Item)
{
	name = NAME_Addon_BeltMage;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_KDF_01;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_KDF_01;
	on_unequip = UnEquip_ItBE_Addon_KDF_01;
	description = "Кушак огня";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArKDF;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_KDF_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetKDFBeltBonus(KDFArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_KDF_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetKDFBeltBonus(KDFArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBE_Addon_MC(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_MC;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_MC;
	on_unequip = UnEquip_ItBE_Addon_MC;
	description = "Пояс из краулера";
	text[1] = NAME_Prot_Edge;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArMC;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBE_Addon_MC()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	SetMCBeltBonus(MCArmor_Equipped, TRUE);
};

func void UnEquip_ItBE_Addon_MC()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	SetMCBeltBonus(MCArmor_Equipped, FALSE);
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_STR_5(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_STR_5;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_STR_5;
	on_unequip = UnEquip_ItBe_Addon_STR_5;
	description = "Пояс силы";
	text[2] = NAME_Bonus_Str;
	count[2] = BeltBonus_STR01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_STR_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR01);
};

func void UnEquip_ItBe_Addon_STR_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR01);
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_STR_10(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_STR_10;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_STR_10;
	on_unequip = UnEquip_ItBe_Addon_STR_10;
	description = "Пояс силы";
	text[2] = NAME_Bonus_Str;
	count[2] = BeltBonus_STR02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_STR_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR02);
};

func void UnEquip_ItBe_Addon_STR_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR02);
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_DEX_5(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_DEX_5;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_DEX_5;
	on_unequip = UnEquip_ItBe_Addon_DEX_5;
	//description = "Пояс мастерства";
	description = "Пояс охотника";
	text[2] = NAME_Bonus_Dex;
	count[2] = BeltBonus_DEX01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_DEX_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX01);
};

func void UnEquip_ItBe_Addon_DEX_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX01);
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_DEX_10(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_DEX_10;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_DEX_10;
	on_unequip = UnEquip_ItBe_Addon_DEX_10;
	description = "Пояс ловкости";
	text[2] = NAME_Bonus_Dex;
	count[2] = BeltBonus_DEX02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_DEX_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX02);
};

func void UnEquip_ItBe_Addon_DEX_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX02);
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_EDGE(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_Edge;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_EDGE;
	on_unequip = UnEquip_ItBe_Addon_Prot_EDGE;
	description = "Пояс защиты";
	text[2] = NAME_Prot_Edge;
	count[2] = BeltBonus_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_EDGE()
{
	self.protection[PROT_EDGE] += BeltBonus_ProtEdge;
	self.protection[PROT_BLUNT] += BeltBonus_ProtEdge;
};

func void UnEquip_ItBe_Addon_Prot_EDGE()
{
	self.protection[PROT_EDGE] -= BeltBonus_ProtEdge;
	self.protection[PROT_BLUNT] -= BeltBonus_ProtEdge;
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_Point(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_Point;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_Point;
	on_unequip = UnEquip_ItBe_Addon_Prot_Point;
	description = "Пояс защиты";
	text[2] = NAME_Prot_Point;
	count[2] = BeltBonus_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_Point()
{
	self.protection[PROT_POINT] += BeltBonus_ProtPoint;
};

func void UnEquip_ItBe_Addon_Prot_Point()
{
	self.protection[PROT_POINT] -= BeltBonus_ProtPoint;
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_MAGIC(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_Magic;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_MAGIC;
	on_unequip = UnEquip_ItBe_Addon_Prot_MAGIC;
	description = "Пояс магической защиты";
	text[2] = NAME_Prot_Magic;
	count[2] = BeltBonus_ProtMagic;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_MAGIC()
{
	self.protection[PROT_MAGIC] += BeltBonus_ProtMagic;
};

func void UnEquip_ItBe_Addon_Prot_MAGIC()
{
	self.protection[PROT_MAGIC] -= BeltBonus_ProtMagic;
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_FIRE(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_Fire;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_FIRE;
	on_unequip = UnEquip_ItBe_Addon_Prot_FIRE;
	description = "Пояс огненного человека";
	text[2] = NAME_Prot_Fire;
	count[2] = BeltBonus_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_FIRE()
{
	self.protection[PROT_FIRE] += BeltBonus_ProtFire;
};

func void UnEquip_ItBe_Addon_Prot_FIRE()
{
	self.protection[PROT_FIRE] -= BeltBonus_ProtFire;
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_EdgPoi(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_EdgPoi;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_EdgPoi;
	on_unequip = UnEquip_ItBe_Addon_Prot_EdgPoi;
	description = "Пояс защиты";
	text[2] = NAME_Prot_Edge;
	count[2] = BeltBonus_ProtEdgPoi;
	text[3] = NAME_Prot_Point;
	count[3] = BeltBonus_ProtEdgPoi;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_EdgPoi()
{
	self.protection[PROT_EDGE] += BeltBonus_ProtEdgPoi;
	self.protection[PROT_BLUNT] += BeltBonus_ProtEdgPoi;
	self.protection[PROT_POINT] += BeltBonus_ProtEdgPoi;
};

func void UnEquip_ItBe_Addon_Prot_EdgPoi()
{
	self.protection[PROT_EDGE] -= BeltBonus_ProtEdgPoi;
	self.protection[PROT_BLUNT] -= BeltBonus_ProtEdgPoi;
	self.protection[PROT_POINT] -= BeltBonus_ProtEdgPoi;
};

// ----------------------------------------------------------------------------

instance ItBe_Addon_Prot_TOTAL(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_Total;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_TOTAL;
	on_unequip = UnEquip_ItBe_Addon_Prot_TOTAL;
	description = "Пояс протектора";
	text[1] = NAME_Prot_Edge;
	count[1] = BeltBonus_ProtTotal;
	text[2] = NAME_Prot_Point;
	count[2] = BeltBonus_ProtTotal;
	text[3] = NAME_Prot_Magic;
	count[3] = BeltBonus_ProtTotal;
	text[4] = NAME_Prot_Fire;
	count[4] = BeltBonus_ProtTotal;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void Equip_ItBe_Addon_Prot_TOTAL()
{
	self.protection[PROT_EDGE] += BeltBonus_ProtTotal;
	self.protection[PROT_BLUNT] += BeltBonus_ProtTotal;
	self.protection[PROT_POINT] += BeltBonus_ProtTotal;
	self.protection[PROT_MAGIC] += BeltBonus_ProtTotal;
	self.protection[PROT_FIRE] += BeltBonus_ProtTotal;
};

func void UnEquip_ItBe_Addon_Prot_TOTAL()
{
	self.protection[PROT_EDGE] -= BeltBonus_ProtTotal;
	self.protection[PROT_BLUNT] -= BeltBonus_ProtTotal;
	self.protection[PROT_POINT] -= BeltBonus_ProtTotal;
	self.protection[PROT_MAGIC] -= BeltBonus_ProtTotal;
	self.protection[PROT_FIRE] -= BeltBonus_ProtTotal;
};

