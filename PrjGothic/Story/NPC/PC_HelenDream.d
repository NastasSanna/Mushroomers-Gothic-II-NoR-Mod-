
instance ITAR_PIR_BABE4_DS(C_Item)		//Одежда пиратки - DarkSaga I
{
	name = "Одежда пиратки";	visual = "ITAR_PIR_L_Addon.3ds";	visual_change = "PIRAT_BABE_ARMOR_V1.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 1000;	
	text[1] = NAME_Prot_EdgePoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};

instance PC_HelenDream(Npc_Default)
{
	name[0] = "Helen Dream";
	guild = GIL_NONE;	
	id = 1630;
	voice = 16;
	npcType = npctype_main;
	B_SetAttributesToChapter(self, 3);
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	B_SetFightSkills(self,50);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_BABE2",FaceBabe_N_OldBrown,BodyTexBabe_N,ITAR_PIR_BABE4_DS);
	
	aivar[AIV_IgnoreFlags] = -1;
	aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;
	aivar[AIV_MaxDistToWp] = 3000;

	start_aistate = ZS_Follow_Player;
};

func void Rtn_Snow_16130()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_MAGECAVE_NS_IN");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_MAGECAVE_NS_IN");
};
