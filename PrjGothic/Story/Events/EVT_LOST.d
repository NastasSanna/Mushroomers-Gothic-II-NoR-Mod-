
const string MOBNAME_LOST = "";

func void ZS_BurnBug()
{
	//Vob_BeginMovement(_@(slf));
	Vob_MoveLocal(_@(self),mkf(-250 + Hlp_Random(501)),mkf(1000 + Hlp_Random(300)),mkf(-250 + Hlp_Random(501)));
	//Vob_EndMovement(_@(slf),0);
	Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,0);
	B_Say(self,hero,"$AARGH_3");
};
func int ZS_BurnBug_Loop()
{
	if(Npc_GetStateTime(self) > 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

instance Nobug(Mst_Default_Meatbug)
{
	voice = 1 + Hlp_Random(16);
	name = "¡¿√";
	B_SetVisuals_Meatbug();
	attribute[ATR_HITPOINTS] = 1;
	start_aistate = ZS_BurnBug;
};

func void EVT_LOST()
{
	Wld_InsertNpc(Nobug, "TRG_LOST");
};
