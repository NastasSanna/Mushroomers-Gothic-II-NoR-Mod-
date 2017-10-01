
const int VALUE_ITAR_MR_GovernorHat = 500;

//для призрака губернатора, с шляпой и воротником-жабо
instance ITAR_MR_GovernorHat(C_Item)
{
	name =  "Костюм губернатора";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Governor;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_L.3ds";
	visual_change = "ARMOR_MR_GovernorHat.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = "Костюм губернатора из прошлого";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

//

INSTANCE ItAr_Guru_M(C_Item)
{
	name 					=	"Одеяние гуру";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	71;
	protection [PROT_BLUNT] = 	71;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	3;

	value 					=	700;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

