

// ОБЫЧНЫЙ ==============================================
instance DIA_Stadtwache_309_Ambient(C_INFO)
{
	nr = 0;
	npc = Mil_309_Stadtwache;
	condition = DIA_WhenAsked_cond;
	information = DIA_Stadtwache_309_Ambient_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Stadtwache_309_Ambient_info()
{
	AI_Output(self,other,"DIA_Stadtwache_309_Ambient_06_00");	//Проходи, не стой в воротах!
	AI_StopProcessInfos(self);
};
//-------------------------------------------------------
instance DIA_Stadtwache_310_Ambient(C_INFO)
{
	nr = 0;
	npc = Mil_310_Stadtwache;
	condition = DIA_WhenAsked_cond;
	information = DIA_Stadtwache_310_Ambient_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Stadtwache_310_Ambient_info()
{
	AI_Output(self,other,"DIA_Stadtwache_310_Ambient_07_00");	//Чего тебе? Иди своей дорогой!
	AI_StopProcessInfos(self);
};
//-------------------------------------------------------
instance DIA_Stadtwache_332_Ambient(C_INFO)
{
	nr = 0;
	npc = Mil_332_Stadtwache;
	condition = DIA_WhenAsked_cond;
	information = DIA_Stadtwache_332_Ambient_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Stadtwache_332_Ambient_info()
{
	AI_Output(self,other,"DIA_Stadtwache_332_Ambient_04_00");	//Проходи, не задерживайся!
	AI_StopProcessInfos(self);
};
//-------------------------------------------------------
instance DIA_Stadtwache_333_Ambient(C_INFO)
{
	nr = 0;
	npc = Mil_333_Stadtwache;
	condition = DIA_WhenAsked_cond;
	information = DIA_Stadtwache_333_Ambient_info;
	important = TRUE;
	permanent = TRUE;
};
func void DIA_Stadtwache_333_Ambient_info()
{
	AI_Output(self,other,"DIA_Stadtwache_333_Ambient_06_00");	//(зевая) Добро пожаловать в город Хоринис, и так далее и тому подобное...
	if (HERO_WalkFromCity)
	{
		AI_Output(self,other,"DIA_Stadtwache_333_Ambient_06_01");	//А, ты же из города... Ну, тогда, счастливого пути!
	};
	AI_StopProcessInfos(self);
};

