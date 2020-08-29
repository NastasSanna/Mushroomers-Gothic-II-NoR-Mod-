

instance DIA_Dyrian_EXIT(DIA_Proto_End)
{
	npc = NOV_604_Dyrian;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
var int Dyrian_Odo_KnowBooks;
instance DIA_Dyrian_HowWork_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_HowWork_Odo_Cond;
	information = DIA_Dyrian_HowWork_Odo_Info;
	permanent = TRUE;
	description = "Как твое задание?";
};
func int DIA_Dyrian_HowWork_Odo_Cond()
{
	if (C_HeroIs_Odo() && !Dyrian_Odo_KnowBooks)	{
		return TRUE;
	};
};
func void DIA_Dyrian_HowWork_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_HowWork_Odo_03_00");	//Как твое задание?
	var C_NPC oth;	oth = Hlp_GetNpc(other);
	Npc_PerceiveAll(self);
	if (Wld_DetectNpc(self,-1,NOFUNC,GIL_KDF))	{
		if (Hlp_IsValidNpc(other))	{
			if (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)	{
				other = Hlp_GetNpc(oth);
				AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_05");	//(громко) Я усердно работаю, брат.
				return;
			};
		};
	};
	other = Hlp_GetNpc(oth);
	Dyrian_Odo_KnowBooks = TRUE;
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_01");	//Ох, и не спрашивай. Мне поручили подметать комнаты Магов, и я мету и мету, каждый день.
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_02");	//А мне бы хотелось изучать книги в библиотеке.
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_03");	//Да просто почитать, хоть что-нибудь!
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_04");	//Когда я пришел в Монастырь, думал, что буду сутками учиться, но пока даже не видел, как выглядит библиотека.
};

//===================================================
instance DIA_Dyrian_HowAU_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HowAU_Odo_Cond;
	information = DIA_Dyrian_HowAU_Odo_Info;
	permanent = TRUE;
	description = "Как ты?";
};
func int DIA_Dyrian_HowAU_Odo_Cond()
{
	if (C_HeroIs_Odo() && Dyrian_Odo_KnowBooks)	{
		return TRUE;
	};
};
func void DIA_Dyrian_HowAU_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_HowAU_Odo_03_00");	//Как ты?
	if (!Dyrian_HasBook) {
		AI_Output(self,other,"DIA_Dyrian_HowAU_Odo_13_01");	//Мне было бы гораздо лучше, если бы я мог почитать что-нибудь перед сном...
	}
	else {
		AI_Output(self,other,"DIA_Dyrian_HowAU_Odo_13_02");    //Теперь, когда у меня есть что почитать, мне гораздо лучше!
	};
};

//===================================================
instance DIA_Dyrian_GiveMrBook_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_GiveMrBook_Odo_Cond;
	information = DIA_Dyrian_GiveMrBook_Odo_Info;
	description = "У меня есть для тебя книга.";
	permanent = TRUE;
};
func int DIA_Dyrian_GiveMrBook_Odo_Cond()
{
	if (C_HeroIs_Odo() && Dyrian_Odo_KnowBooks
		&& (Npc_HasItems(other,ItWr_MushroomBook)
			|| Npc_HasItems(other,ItWr_MR_UnderInnosEye)
			|| Npc_HasItems(other,ItWr_MR_SunExtract)
			|| Npc_HasItems(other,ItWr_MR_SmithGuide)
			|| Npc_HasItems(other,ItWr_MR_OnAlchemy)
			|| Npc_HasItems(other,ItWr_MR_OakBranch)
			|| Npc_HasItems(other,ItWr_MR_BiographyBartosLaran)
			|| Npc_HasItems(other,ItWr_HerbBook)))	{
		return TRUE;
	};
	return FALSE;
};
func void DIA_Dyrian_GiveMrBook_Odo_Menu()
{
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	if (!DIA_Dyrian_GiveMrBook_Odo_Cond()) {
		return;
	};
	if ( DIA_Dyrian_GiveMrBook_Odo_Cond()) {
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Знаешь, я передумал (НАЗАД).",DIA_Dyrian_GiveMrBook_Odo_Cancel);
	};
	if (Npc_HasItems(other,ItWr_MushroomBook))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"О грибах Хориниса.",DIA_Dyrian_GiveMrBook_Odo_MR);
	};
	if (Npc_HasItems(other,ItWr_MR_AboutDragons))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"О драконах",DIA_Dyrian_GiveMrBook_Odo_AboutDragons);
	};
	if (Npc_HasItems(other,ItWr_MR_BiographyBartosLaran))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Биография Бартоса Ларанского.",DIA_Dyrian_GiveMrBook_Odo_BiographyBartosLaran);
	};
	if (Npc_HasItems(other,ItWr_MR_OakBranch))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Дубовая ветвь (апокрифическое сказание).",DIA_Dyrian_GiveMrBook_Odo_OakBranch);
	};
	if (Npc_HasItems(other,ItWr_MR_OnAlchemy))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Об алхимии (трактат).",DIA_Dyrian_GiveMrBook_Odo_OnAlchemy);
	};
	if (Npc_HasItems(other,ItWr_MR_SmithGuide))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Наставление кузнецу.",DIA_Dyrian_GiveMrBook_Odo_SmithGuide);
	};
	if (Npc_HasItems(other,ItWr_MR_SunExtract))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Экстракт солнца (наставление по виноделию).",DIA_Dyrian_GiveMrBook_Odo_SunExtract);
	};
	if (Npc_HasItems(other,ItWr_MR_UnderInnosEye))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Под Оком Инноса (географический трактат).",DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye);
	};
	if (Npc_HasItems(other,ItWr_HerbBook))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"О травах (трактат)",DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye);
	};
};
func void DIA_Dyrian_GiveMrBook_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_03_00");	//У меня есть для тебя книга.
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_01");	//А о чем она?
	DIA_Dyrian_GiveMrBook_Odo_Menu();
};
func void DIA_Dyrian_GiveMrBook_Odo_Cancel()
{
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_Cancel_03_00");	//Знаешь, я передумал.
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_Cancel_03_01");	//Я хочу сам еще почитать ее.
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Cancel_Odo_13_02");	//Что ж, это твоя книга. Но если ты еще раз передумаешь - ты знаешь, где меня найти.
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
};
func void DIA_Dyrian_GiveMrBook_Odo_DoGiveMR()
{
	Dyrian_HasBook = TRUE;
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_DoGive_03_00");	//Вот, держи.
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_DoGive_03_01");	//Только береги ее. Я хочу получить ее назад в целости и сохранности.
	B_GiveInvItems(other,self,ItWr_MushroomBook,1);
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_DoGive_13_02");	//Я буду беречь ее как зеницу ока.
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	//Аданос благославляет благие дела (даже если вы колебались)
	B_Adanos_Bless4Good();
};
var int DIA_Dyrian_GiveMrBook_Odo_MR_Once;
func void DIA_Dyrian_GiveMrBook_Odo_MR()
{
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	if (!DIA_Dyrian_GiveMrBook_Odo_MR_Once)	{
		DIA_Dyrian_GiveMrBook_Odo_MR_Once = TRUE;
			AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_03_02");	//О грибах Хориниса. Ее написал городской алхимик Константино.
		AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_03");	//О грибах? Это немного... необычно.
		AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_04");	//Но я люблю узнавать что-то новое. Я с удовольствием прочту ее, если ты не против.
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Знаешь, я передумал.",DIA_Dyrian_GiveMrBook_Odo_Cancel);
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"Вот, держи.",DIA_Dyrian_GiveMrBook_Odo_DoGiveMR);
	}
	else {
		AI_Output(other,self,"DIA_Dyrian_GiveMrBookPerm_Odo_03_00");	//Ладно, я все-таки дам тебе книгу.
		DIA_Dyrian_GiveMrBook_Odo_DoGiveMR();
	};
};
func void DIA_Dyrian_GiveMrBook_Odo_DoGive()
{
	Dyrian_HasBook = TRUE;
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Dyrian_GiveBook_Odo_13_02");	//Спасибо.
	}
	else {
		AI_Output(self,other,"DIA_Dyrian_GiveBook_Odo_13_03");	//Ты настоящий друг.
	};
	B_GivePlayerXP(XP_Ambient);
	DIA_Dyrian_GiveMrBook_Odo_Menu();
};
func void DIA_Dyrian_GiveMrBook_Odo_AboutDragons()
{
	B_GiveInvItems(other,self,ItWr_MR_AboutDragons,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_BiographyBartosLaran()
{
	B_GiveInvItems(other,self,ItWr_MR_BiographyBartosLaran,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_OakBranch()
{
	B_GiveInvItems(other,self,ItWr_MR_OakBranch,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_OnAlchemy()
{
	B_GiveInvItems(other,self,ItWr_MR_OnAlchemy,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_SmithGuide()
{
	B_GiveInvItems(other,self,ItWr_MR_SmithGuide,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_SunExtract()
{
	B_GiveInvItems(other,self,ItWr_MR_SunExtract,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye()
{
	B_GiveInvItems(other,self,ItWr_MR_UnderInnosEye,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
