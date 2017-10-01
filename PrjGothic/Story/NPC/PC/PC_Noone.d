
instance PC_Noone(C_NPC)
{
	name[0] = "";
	id = 1600;
	voice = 15;
	flags = NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	noFocus = TRUE;
	
	B_SetAttitude(self,ATT_FRIENDLY);
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	
	attribute[ATR_HITPOINTS_MAX]	= 50;
	attribute[ATR_HITPOINTS]		= 50;

	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisual(self,"Irrlicht_friendly.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
