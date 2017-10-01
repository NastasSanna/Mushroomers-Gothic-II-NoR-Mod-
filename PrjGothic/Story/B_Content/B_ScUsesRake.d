

var int rakeplace[50];
const int Greg_FirstSecret = 1;
const int RAKE_BUDDEL_DIST_MAX = 300;
const int RAKE_BUDDEL_DIST_MIN = 200;

func void RakeTreasureSuccess(var C_Item itm)
{
	Wld_PlayEffect("spellFX_ItemAusbuddeln",itm,itm,0,0,0,FALSE);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	B_GivePlayerXP(XP_Ambient);
};

func void B_SCUsesRake(var C_Npc slf)
{
};

func void B_SCGetTreasure_S1()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		/*if((Npc_GetDistToWP(hero,"NW_LAKE_GREG_TREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[2] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket100,"NW_LAKE_GREG_TREASURE_01");
			RAKEPLACE[2] = TRUE;
			RakeTreasureSuccess(ItSe_GoldPocket100);
		}*/
	};
};

