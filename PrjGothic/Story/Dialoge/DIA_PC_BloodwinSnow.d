
instance DIA_BloodwinSnow_EXIT(DIA_Proto_End)
{
	npc = PC_BloodwinSnow;
};

//=====================================================
instance DIA_BloodwinSnow_Hallo(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_BloodwinSnow_Hallo_info;
	important = TRUE;
};
func void DIA_BloodwinSnow_Hallo_info()
{
	if (other.aivar[AIV_Gender] == MALE) {
		AI_Output(self,other,"DIA_BloodwinSnow_Hallo");	 //Далеко забрался. Грибами здесь и не пахнет, правда? Хочешь что-то спросить? (подмигивая) У тебя три вопроса.
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_Hallo_F");	//Далеко забралась. Грибами здесь и не пахнет, правда? Хочешь что-то спросить? (подмигивая) У тебя три вопроса.
	};
	B_GiveAchievement_SnowStudio();
	B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_BloodwinSnow);
};

//=====================================================
instance DIA_BloodwinSnow_WhoAU(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_BloodwinSnow_WhoAU_info;
	description = "Ты кто?";
};
func void DIA_BloodwinSnow_WhoAU_info()
{
	AI_Output(self,other,"DIA_BloodwinSnow_WhoYou");	 //Я - основатель Snow Studio, почетный актер, звукорежиссер и просто хороший человек.
};

//=====================================================
instance DIA_BloodwinSnow_YouLike(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 3;
	condition = DIA_BloodwinSnow_YouLike_cond;
	information = DIA_BloodwinSnow_YouLike_info;
	description = "Когда следующий мод выйдет?";
};
func int DIA_BloodwinSnow_YouLike_cond()
{
	if (Npc_KnowsInfo(other,DIA_BloodwinSnow_WhoAU))	{
		return TRUE;
	};
};
func void DIA_BloodwinSnow_YouLike_info()
{
	AI_Output(self,other,"DIA_BloodwinSnow_YouLike");	//...Сперва скажи, тебе понравилась озвучка в ЭТОМ моде?
	Info_ClearChoices(DIA_BloodwinSnow_YouLike);
	Info_AddChoice(DIA_BloodwinSnow_YouLike,"Нет, могла быть получше.",DIA_BloodwinSnow_YouLike_No);
	Info_AddChoice(DIA_BloodwinSnow_YouLike,"Да, я в восторге!",DIA_BloodwinSnow_YouLike_Yes);
};
func void DIA_BloodwinSnow_YouLike_Yes()
{
	AI_Output(self,other,"DIA_BloodwinSnow_YouLike_Yes");	//Что ж, я рад это слышать. Когда следующий мод выйдет, ты об этом узнаешь. Не забывай заглядывать на Snow сайт в раздел Новости.
	Info_ClearChoices(DIA_BloodwinSnow_YouLike);
};
func void DIA_BloodwinSnow_YouLike_No()
{
	BloodwinSnow_KillPlayer = 100;
	if (other.aivar[AIV_Gender] == MALE) {
		AI_Output(self,other,"DIA_BloodwinSnow_YouLike_No");	//Вот значит как? Ты являешься сюда и заявляешь, что озвучка недостаточно хороша? Взять его, парни! Порубить на куски!
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_YouLike_No_F");	//Вот значит как? Ты являешься сюда и заявляешь, что наша озвучка недостаточно хороша? Взять ее, парни! Порубить на куски!
	};
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] & ~TEMPER_NoFightParker;
	AI_StopProcessInfos(self);
			Wld_InsertNpc(PC_SnowStudioActor_01,"NW_MAGECAVE_14");
			AI_GotoWP(PC_SnowStudioActor_01,"NW_MAGECAVE_15");
			Wld_InsertNpc(PC_SnowStudioActor_02,"NW_MAGECAVE_11");
			AI_GotoWP(PC_SnowStudioActor_02,"NW_MAGECAVE_16");
};

//=====================================================
var int DIA_BloodwinSnow_Inter_Cnt;
instance DIA_BloodwinSnow_Inter(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 4;
	condition = DIA_BloodwinSnow_YouLike_cond;
	information = DIA_BloodwinSnow_Inter_info;
	description = "Расскажи что-нибудь интересное из жизни студии.";
	permanent = TRUE;
};
func void DIA_BloodwinSnow_Inter_info()
{
	if (DIA_BloodwinSnow_Inter_Cnt == 0) {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_1");	//Хмм... Первый мод, за который бралась Snow студия, озвучивали всего два человека. Я и Наемник из готики.
	}
	else if (DIA_BloodwinSnow_Inter_Cnt == 1) {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_2");	//Хмм... Пасхальный мод, также озвученный нами, я ежегодно прохожу на Пасху. И каждый раз ставлю новый рекорд по сбору пасхальных яиц.
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_3");	//Хмм... А знаешь ли ты, что Грибники - крупнейший мод, когда-либо озвученный нами? В нем больше восьми с полтиной тысяч реплик.
	};
	DIA_BloodwinSnow_Inter_Cnt += 1;
	if (DIA_BloodwinSnow_Inter_Cnt > 2) {
		DIA_BloodwinSnow_Inter_Cnt = 0;
	};
};
