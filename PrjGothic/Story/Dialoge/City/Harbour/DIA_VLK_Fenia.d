
instance DIA_Fenia_EXIT(DIA_Proto_End)
{
	npc = VLK_476_Fenia;
};

/////////////////////////////////////// ЕЛЕНА //////////////////////////////////////////////

// ==============================================
instance DIA_Fenia_Elena_AboutCup(C_INFO)
{
	nr = 10;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Elena_AboutCup_cond;
	information = DIA_Fenia_Elena_AboutCup_info;
	description = "Ты не знаешь, кто здесь мог бы мне помочь кое-что достать?";
};
func int DIA_Fenia_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !Npc_KnowsInfo(other,DIA_Kardif_Elena_AboutCup)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Fenia_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Fenia_Elena_AboutCup_16_00");	//Ты не знаешь, кто здесь мог бы мне помочь кое-что достать?
	AI_Output(self,other,"DIA_Fenia_Elena_AboutCup_17_01");	//Ищешь приключений, подруга?
	AI_Output(self,other,"DIA_Fenia_Elena_AboutCup_17_02");	//Попробуй спросить у Кардифа в кабаке, он знает все обо всех здесь. Если не побоишься, конечно.
};

/////////////////////////////////////// САРА //////////////////////////////////////////////

// ==============================================
instance DIA_Fenia_Sarah_Hello(C_INFO)
{
	nr = 20;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Sarah_MR_Hello_cond;
	information = DIA_Fenia_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Fenia_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Fenia_Sarah_MR_Hello_17_01");	//Сара! Давненько тебя не видела.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Fenia);
};
// ==============================================
instance DIA_Fenia_Sarah_HowAU(C_INFO)
{
	nr = 21;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Sarah_HowAU_cond;
	information = DIA_Fenia_Sarah_HowAU_info;
	description = "Как дела?";
};
func int DIA_Fenia_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_OldFriends == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_HowAU_info()
{
		AI_Output(other,self,"DIA_Fenia_Sarah_HowAU_16_00");	//Как дела?
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_01");	//Да как обычно... Разве что, скажу по секрету, рыбаки не приносят свежей рыбы уже третий день.
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_02");	//Говорят, море неспокойное. А с берега много ли наловишь?
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_03");	//А покупателям все равно - если рыба несвежая, все шишки достаются мне.
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fenia);
};

// ==============================================
instance DIA_Fenia_Sarah_HaveRum(C_INFO)
{
	npc = VLK_476_Fenia;			nr = 22;
	condition = DIA_Fenia_Sarah_HaveRum_cond;
	information = DIA_Fenia_Sarah_HaveRum_info;
	description = "У тебя случайно нет белого рома?";
};
func int DIA_Fenia_Sarah_HaveRum_cond()
{
	if (C_HeroIs_Sarah() && Wld_IsTime(19,30,4,0) && !Npc_IsNear(self,VLK_469_Halvor)
		 && MIS_Sarah_BadHabit_MoeAsked
		 && !MIS_Sarah_BadHabit_MoeTalked && !Npc_HasItems(other,ItFo_Addon_Rum))	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_HaveRum_info()
{
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_00");	//У тебя случайно нет белого рома? Мне очень надо.
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_01");	//Очень-очень?
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_02");	//Очень-очень-очень.
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_03");	//Ну тогда, в счет нашей старой дружбы, найдется бутылочка. Только не говори, где ты ее взяла, иначе меня Халвор живьем съест.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_04");	//Сколько я тебе должна?
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_05");	//(подмигивает) За что? Я тебе ничего не давала.
};
//*/

/////////////////////////////////////// ВСЕ /////////////////////////////////////////////
// ТОРГОВЛЯ ==============================================
instance DIA_Fenia_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_MR_Hello_cond;
	information = DIA_Fenia_MR_Hello_info;
	important = TRUE;
};
func int DIA_Fenia_MR_Hello_cond()
{
	if (!C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{	//кроме Сары
		return TRUE;
	};
};
func void DIA_Fenia_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Fenia_MR_Hello_17_00");	//Подходи, не робей, покупай!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Fenia);
};
//-----------------------------------------
instance DIA_Fenia_Trade(C_INFO)
{
	nr = 90;
	npc = VLK_476_Fenia;
	condition = DIA_NoCond_cond;
	information = DIA_Fenia_Trade_info;
	description = "Покажи мне свои товары.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Fenia_Trade_info()
{
	B_GiveTradeInv_Fenia(self);
};
