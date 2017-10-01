
const int Value_Ri_ProtFire = 250;
const int Ri_ProtFire = 3;
const int Value_Ri_ProtEdge = 250;
const int Ri_ProtEdge = 3;
const int Value_Ri_ProtMage = 250;
const int Ri_ProtMage = 3;
const int Value_Ri_ProtPoint = 250;
const int Ri_ProtPoint = 3;
const int Value_Ri_ProtFire02 = 500;
const int Ri_ProtFire02 = 5;
const int Value_Ri_ProtEdge02 = 500;
const int Ri_ProtEdge02 = 5;
const int Value_Ri_ProtMage02 = 500;
const int Ri_ProtMage02 = 5;
const int Value_Ri_ProtPoint02 = 500;
const int Ri_ProtPoint02 = 5;
const int Value_Ri_ProtTotal = 600;
const int Ri_TProtFire = 2;
const int Ri_TProtEdge = 3;
const int Ri_TProtMage = 2;
const int Ri_TProtPoint = 3;
const int Value_Ri_ProtTotal02 = 1000;
const int Ri_TProtFire02 = 3;
const int Ri_TProtEdge02 = 5;
const int Ri_TProtMage02 = 3;
const int Ri_TProtPoint02 = 5;
const int Value_Ri_Dex = 300;
const int Ri_Dex = 3;
const int Value_Ri_Dex02 = 500;
const int Ri_Dex02 = 5;
const int Value_Ri_Mana = 500;
const int Ri_Mana = 5;
const int Value_Ri_Mana02 = 1000;
const int Ri_Mana02 = 10;
const int Value_Ri_Strg = 300;
const int Ri_Strg = 3;
const int Value_Ri_Strg02 = 500;
const int Ri_Strg02 = 5;
const int Value_Ri_Hp = 200;
const int Ri_Hp = 20;
const int Value_Ri_Hp02 = 400;
const int Ri_Hp02 = 40;
const int Value_Ri_HpMana = 1300;
const int Ri_HpMana_Hp = 30;
const int Ri_HpMana_Mana = 10;
const int Value_Ri_DexStrg = 800;
const int Ri_DexStrg_Dex = 4;
const int Ri_DexStrg_Strg = 4;
const int Value_Ri_Acrobat = 750;
const int Value_HP_Regen = 900;

instance ItRi_Prot_Fire_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtFire;
	visual = "ItRi_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_01;
	on_unequip = UnEquip_ItRi_Prot_Fire_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо защиты от пламени";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] += Ri_ProtFire;
};

func void UnEquip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire;
};


instance ItRi_Prot_Fire_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtFire02;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_02;
	on_unequip = UnEquip_ItRi_Prot_Fire_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо огня";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] += Ri_ProtFire02;
};

func void UnEquip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire02;
};


instance ItRi_Prot_Point_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01;
	on_unequip = UnEquip_ItRi_Prot_Point_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо деревянной кожи";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItRi_Prot_Point_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtPoint02;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_02;
	on_unequip = UnEquip_ItRi_Prot_Point_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо каменной кожи";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_02()
{
	self.protection[PROT_POINT] += Ri_ProtPoint02;
};

func void UnEquip_ItRi_Prot_Point_02()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint02;
};


instance ItRi_Prot_Edge_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_01;
	on_unequip = UnEquip_ItRi_Prot_Edge_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо железной кожи";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItRi_Prot_Edge_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge02;
	visual = "ItRi_Prot_Edge_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_02;
	on_unequip = UnEquip_ItRi_Prot_Edge_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо рудной кожи";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge02;
	self.protection[PROT_BLUNT] += Ri_ProtEdge02;
};

func void UnEquip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge02;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge02;
};


instance ItRi_Prot_Mage_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtMage;
	visual = "ItRi_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_01;
	on_unequip = UnEquip_ItRi_Prot_Mage_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо силы духа";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage;
};

func void UnEquip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage;
};


instance ItRi_Prot_Mage_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtMage02;
	visual = "ItRi_Prot_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_02;
	on_unequip = UnEquip_ItRi_Prot_Mage_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо защиты";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage02;
};

func void UnEquip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage02;
};


instance ItRi_Prot_Total_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtTotal;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_01;
	on_unequip = UnEquip_ItRi_Prot_Total_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо непобедимости";
	text[1] = NAME_Prot_Magic;
	count[1] = Ri_TProtMage;
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_TProtFire;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_TProtPoint;
	text[4] = NAME_Prot_Edge;
	count[4] = Ri_TProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] += Ri_TProtEdge;
	self.protection[PROT_BLUNT] += Ri_TProtEdge;
	self.protection[PROT_POINT] += Ri_TProtPoint;
	self.protection[PROT_FIRE] += Ri_TProtFire;
	self.protection[PROT_MAGIC] += Ri_TProtMage;
};

func void UnEquip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] -= Ri_TProtEdge;
	self.protection[PROT_BLUNT] -= Ri_TProtEdge;
	self.protection[PROT_POINT] -= Ri_TProtPoint;
	self.protection[PROT_FIRE] -= Ri_TProtFire;
	self.protection[PROT_MAGIC] -= Ri_TProtMage;
};


instance ItRi_Prot_Total_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtTotal02;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_02;
	on_unequip = UnEquip_ItRi_Prot_Total_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо неуязвимости";
	text[1] = NAME_Prot_Magic;
	count[1] = Ri_TProtMage02;
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_TProtFire02;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_TProtPoint02;
	text[4] = NAME_Prot_Edge;
	count[4] = Ri_TProtEdge02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] += Ri_TProtEdge02;
	self.protection[PROT_BLUNT] += Ri_TProtEdge02;
	self.protection[PROT_POINT] += Ri_TProtPoint02;
	self.protection[PROT_FIRE] += Ri_TProtFire02;
	self.protection[PROT_MAGIC] += Ri_TProtMage02;
};

func void UnEquip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] -= Ri_TProtEdge02;
	self.protection[PROT_BLUNT] -= Ri_TProtEdge02;
	self.protection[PROT_POINT] -= Ri_TProtPoint02;
	self.protection[PROT_FIRE] -= Ri_TProtFire02;
	self.protection[PROT_MAGIC] -= Ri_TProtMage02;
};


instance ItRi_Dex_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Dex;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_01;
	on_unequip = UnEquip_ItRi_Dex_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо мастерства";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex);
};

func void UnEquip_ItRi_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex);
};


instance ItRi_Dex_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Dex02;
	visual = "ItRi_Dex_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_02;
	on_unequip = UnEquip_ItRi_Dex_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо ловкости";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex02);
};

func void UnEquip_ItRi_Dex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex02);
};


instance ItRi_HP_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_01;
	on_unequip = UnEquip_ItRi_Hp_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо жизни";
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ItRi_Hp_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp02;
	visual = "ItRi_Hp_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_02;
	on_unequip = UnEquip_ItRi_Hp_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо живости";
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp02;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp02;
};

func void UnEquip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp02;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp02 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp02;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ItRi_Str_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Strg;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_01;
	on_unequip = UnEquip_ItRi_Str_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо  силы";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Str_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg);
};

func void UnEquip_ItRi_Str_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg);
};


instance ItRi_Str_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Strg02;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_02;
	on_unequip = UnEquip_ItRi_Str_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо силы";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Str_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg02);
};

func void UnEquip_ItRi_Str_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg02);
};


instance ItRi_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Mana;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_01;
	on_unequip = UnEquip_ItRi_Mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо магии";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana;
};

func void UnEquip_ItRi_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana;
	if(self.attribute[ATR_MANA] >= Ri_Mana)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItRi_Mana_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Mana02;
	visual = "ItRi_Mana_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_02;
	on_unequip = UnEquip_ItRi_Mana_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо астральной силы";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_Mana02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Mana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana02;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana02;
};

func void UnEquip_ItRi_Mana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana02;
	if(self.attribute[ATR_MANA] >= Ri_Mana02)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana02;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItRi_Hp_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_Mana_01;
	on_unequip = UnEquip_ItRi_Hp_Mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо просвещения";
	text[2] = NAME_Bonus_Mana;
	count[2] = Ri_HpMana_Mana;
	text[3] = NAME_Bonus_HP;
	count[3] = Ri_HpMana_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Hp_Mana_01()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_HpMana_Mana;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_HpMana_Mana;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HpMana_Hp;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HpMana_Hp;
};

func void UnEquip_ItRi_Hp_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_HpMana_Mana;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HpMana_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_HpMana_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= Ri_HpMana_Hp)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_HpMana_Hp;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ItRi_Dex_Strg_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_DexStrg;
	visual = "ItRi_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_Strg_01;
	on_unequip = UnEquip_ItRi_Dex_Strg_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Кольцо власти";
	text[2] = NAME_Bonus_Str;
	count[2] = 4;
	text[3] = NAME_Bonus_Dex;
	count[3] = 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_DexStrg_Dex);
};

func void UnEquip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_DexStrg_Dex);
};

///// ГРИБНИКИ ////////////////////////////////

prototype Proto_Ring(C_ITEM)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
//===========================================
instance ItRi_Acrobat(Proto_Ring)
{
	value = Value_Ri_Acrobat;
	visual = "ItRi_Dex_Strg_01.3ds";
	on_equip = Equip_ItRi_Acrobat;
	on_unequip = UnEquip_ItRi_Acrobat;
	description = "Кольцо акробата";
	text[2] = "Бонус: акробатика.";
	text[3] = "Необходима ловкость: 30.";
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_ItRi_Acrobat()
{
	if (Npc_IsPlayer(self))	{
		if (Hero_Acrobat)	{
			PrintScreen("Я и без кольца это умею.",-1,-1,FONT_Screen,2);
		}
		else if (hero.attribute[ATR_DEXTERITY] < 30)	{
			PrintScreen(PRINT_DEXTERITY_MISSING,-1,-1,FONT_Screen,2);
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,-1,FONT_Screen,2);
		};
	};
};

func void UnEquip_ItRi_Acrobat()
{
	if (Npc_IsPlayer(self))	{
		if (!Hero_Acrobat && Npc_GetTalentSkill(self,NPC_TALENT_ACROBAT))	{
			Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
			PrintScreen(PRINT_Addon_AcrobatDebonus,-1,-1,FONT_Screen,2);
		};
	};
};

//===========================================
instance ItRi_HP_Regen(Proto_Ring)
{
	value = Value_HP_Regen;
	visual = "ItRi_Prot_Fire_01.3ds";
	on_equip = Equip_ItRi_HP_Regen;
	on_unequip = UnEquip_ItRi_HP_Regen;
	description = "Кольцо из могилы";
	text[2] = "Постепенно восстанавливает здоровье,";
	text[3] = "расходуя ману.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Equip_ItRi_HP_Regen()
{
	//self.attribute[ATR_REGENERATEHP] += 1;
	Hero_RegenHPFromMana = TRUE;
};
func void UnEquip_ItRi_HP_Regen()
{
	//self.attribute[ATR_REGENERATEHP] -= 1;
	Hero_RegenHPFromMana = FALSE;
};
