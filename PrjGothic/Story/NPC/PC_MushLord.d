

instance PC_MushLord(Npc_Default)
{
	name[0] = "√–»¡Œ√";
	npcType = npctype_main;
	guild = GIL_NONE;
	flags = NPC_FLAG_IMMORTAL;
	level = 30;
	voice = 15;
	id = 8888;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Player,0,"Hum_Head_Babe",Face_N_Mud,0,ITAR_MR_GovernorHat);
	start_aistate = ZS_Stand_ArmsCrossed;
	CreateInvItems(self,ItMr_GoldPlate,1);
	CreateInvItems(self,ItMr_GoldPlate_Blessed,1);
	CreateInvItems(self,ItMr_Heart,1);
	CreateInvItems(self,ItMr_Heart_Blessed,1);
	CreateInvItems(self,ItMr_Bottle,10);
	CreateInvItems(self,ItMr_Branch,10);
	CreateInvItems(self,ItMr_BrownOiler,10);
	CreateInvItems(self,ItMr_DragonTears,10);
	CreateInvItems(self,ItMr_Foggy,10);
	CreateInvItems(self,ItMr_Governor,10);
	CreateInvItems(self,ItMr_Ivy,10);
	CreateInvItems(self,ItMr_KeilBig,10);
	CreateInvItems(self,ItMr_KeilSmall,10);
	CreateInvItems(self,ItMr_LadysEar,10);
	CreateInvItems(self,ItMr_NightSparkles,10);
	CreateInvItems(self,ItMr_Oyster,10);
	CreateInvItems(self,ItMr_Piny,10);
	CreateInvItems(self,ItMr_Red,10);
	CreateInvItems(self,ItMr_Stone,10);
	CreateInvItems(self,ItMr_Sunrise,10);
	CreateInvItems(self,ItMr_Trident,10);
	CreateInvItems(self,ItMr_Violet,10);
	CreateInvItems(self,ItPl_Mushroom_01,10);
	CreateInvItems(self,ItPl_Mushroom_02,10);
};

