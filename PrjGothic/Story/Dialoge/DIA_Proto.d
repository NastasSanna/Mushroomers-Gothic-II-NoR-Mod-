
func void b_endproductiondialog()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};
// =================================
func int DIA_NoCond_cond()
{
	return TRUE;
};
// =================================
func int DIA_WhenAsked_cond()
{
	if (Npc_IsInState(self, ZS_Talk) &&  !self.aivar[AIV_NpcStartedTalk])	{ return TRUE;};
};
// =================================
//пока идет конкурс
func int DIA_WhileCompetition_cond()
{
	if (Wld_GetDay() < Competition_LastDay)	{ 
		return TRUE;
	};
	return FALSE;
};
// =================================
prototype DIA_Proto_End(C_INFO)
{
	nr = 999;
	condition = DIA_NoCond_cond;
	information = DIA_Proto_End_info;
	description = Dialog_Ende;
	permanent = true;
};
func void DIA_Proto_End_info()
{
	AI_StopProcessInfos(self);
};



/*

instance DIA__EXIT(DIA_Proto_End)
{
	npc = ;
};

instance DIA_Speaker_dlg(C_INFO)
{
	npc = GIL_xxx_Speaker;
	nr = 0;
	condition = DIA_Speaker_dlg_cond;
	information = DIA_Speaker_dlg_info;
	description = "";
	permanent = true;
	important = true;

};

	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Speaker_dlg_03_00");	//
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Speaker_dlg_07_00");	//
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Speaker_dlg_10_00");	//
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Speaker_dlg_14_00");	//
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Speaker_dlg_16_00");	//
	};

*/