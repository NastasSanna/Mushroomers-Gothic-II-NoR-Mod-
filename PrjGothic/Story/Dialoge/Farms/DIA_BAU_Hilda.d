
instance DIA_Hilda_END(DIA_Proto_End)
{
	npc = BAU_951_Hilda;
};

// ===================================================
instance DIA_Hilda_TastySmell(C_Info)
{
	npc = BAU_951_Hilda;				nr = 1;
	condition = DIA_Hilda_TastySmell_Cond;
	information = DIA_Hilda_TastySmell_Info;
	description = "Что ты готовишь?";
};
func int DIA_Hilda_TastySmell_Cond()
{
	if (Npc_GetDistToWP(self, "NW_FARM1_INHOUSE_02") < PERC_DIST_INTERMEDIAT) {
		return TRUE;
	};
};
func void DIA_Hilda_TastySmell_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hilda_AskRecipe_03_00");	//Ммм, грибочками пахнет... У меня аж слюнки потекли.
		AI_Output(other,self,"DIA_Hilda_AskRecipe_03_01");	//Что ты готовишь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hilda_AskRecipe_07_00");	//Ммм, грибочками пахнет... У меня аж слюнки потекли.
		AI_Output(other,self,"DIA_Hilda_AskRecipe_07_01");	//Что ты готовишь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hilda_AskRecipe_10_00");	//Ммм, грибочками пахнет... У меня аж слюнки потекли.
		AI_Output(other,self,"DIA_Hilda_AskRecipe_10_01");	//Что ты готовишь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hilda_AskRecipe_14_00");	//Ммм, грибочками пахнет... У меня аж слюнки потекли.
		AI_Output(other,self,"DIA_Hilda_AskRecipe_14_01");	//Что ты готовишь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hilda_AskRecipe_16_00");	//Ммм, грибочками пахнет... У меня аж слюнки потекли.
		AI_Output(other,self,"DIA_Hilda_AskRecipe_16_01");	//Что ты готовишь?
	};
	AI_Output(self,other,"DIA_Hilda_AskRecipe_17_02");	//Это рагу из масляков. Их полно растет под елками.
};

// ===================================================
instance DIA_Hilda_Perm(C_Info)
{
	npc = BAU_951_Hilda;				nr = 100;
	condition = DIA_NoCond_cond;
	information = DIA_Hilda_Perm_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};
func void DIA_Hilda_Perm_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_VLK_News_03_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_VLK_News_07_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_VLK_News_10_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_VLK_News_14_00");	//Есть какие-нибудь новости?
	} else	{
		AI_Output(other,self,"DIA_VLK_News_16_00");	//Есть какие-нибудь новости?
	};
	var int rnd;	rnd = Hlp_Random(2);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_VLK_News_17_01");	//Говорят, на материке дела все хуже. Хорошо, что нас это не касается.
	}
	else	{
		AI_Output(self,other,"DIA_VLK_News_17_03");	//Зиму обещают холодную.
	};
};

// Кулинарные изыски ===================================================
instance DIA_Hilda_AskRecipe(C_Info)
{
	npc = BAU_951_Hilda;				nr = 10;
	condition = DIA_Hilda_AskRecipe_cond;
	information = DIA_Hilda_AskRecipe_Info;
	description = "А необычные грибы ты умеешь готовить? Дамские уши, например.";
};
func int DIA_Hilda_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Hilda_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hilda_AskRecipe_03_03");	//А необычные грибы ты умеешь готовить? Дамские уши, например.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hilda_AskRecipe_07_03");	//А необычные грибы ты умеешь готовить? Дамские уши, например.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hilda_AskRecipe_10_03");	//А необычные грибы ты умеешь готовить? Дамские уши, например.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hilda_AskRecipe_14_03");	//А необычные грибы ты умеешь готовить? Дамские уши, например.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hilda_AskRecipe_16_03");	//А необычные грибы ты умеешь готовить? Дамские уши, например.
	};
	AI_Output(self,other,"DIA_Hilda_AskRecipe_17_04");	//А, эти, смешные... Лобарт их не любит, но у меня есть бабушкин рецепт маринада.
	AI_Output(self,other,"DIA_Hilda_AskRecipe_17_05");	//Я тебе его отдам за маленькую услугу.
	AI_Output(self,other,"DIA_Hilda_AskRecipe_17_06");	//Сходи к городскому кузнецу Карлу, наточи мне нож.
	B_GiveInvItems(self,other,ItMw_MR_1h_KitchenKnife_Unsharpen,1);
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_Hilda);
};
// ===================================================
instance DIA_Hilda_GiveKnife(C_Info)
{
	npc = BAU_951_Hilda;				nr = 11;
	condition = DIA_Hilda_GiveKnife_cond;
	information = DIA_Hilda_GiveKnife_Info;
	description = "Вот твой нож.";
};
func int DIA_Hilda_GiveKnife_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItMW_MR_1h_KitchenKnife))	{
		return TRUE;
	};
};
func void DIA_Hilda_GiveKnife_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Hilda_GiveKnife_03_00");	//Вот твой нож.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Hilda_GiveKnife_07_00");	//Вот твой нож.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Hilda_GiveKnife_10_00");	//Вот твой нож.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Hilda_GiveKnife_14_00");	//Вот твой нож.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Hilda_GiveKnife_16_00");	//Вот твой нож.
	};
	B_GiveInvItems(other,self,ItMw_MR_1h_KitchenKnife,1);
	B_GivePlayerXP(XP_Cookery_HildaSharpen);
	AI_Output(self,other,"DIA_Hilda_GiveKnife_17_01");	//Вот спасибо. Держи рецепт.
	AI_Output(self,other,"DIA_Hilda_GiveKnife_17_02");	//Жалко отдавать, да и держать без дела жалко.
	B_GiveInvItems(self,other,ItWr_EarRecipe_Hilda,1);
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_HildaGet);
};

