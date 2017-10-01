
func void b_endproductiondialog()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};

