
instance DIA_Gaan_EXIT(DIA_Proto_End)
{
	npc = BAU_961_Gaan;
};

///////////////////////////// ТАЛБИН ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Talbin_WhyDontBelieve(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 1;
	condition = DIA_Gaan_Talbin_WhyDontBelieve_cond;
	information = DIA_Gaan_Talbin_WhyDontBelieve_info;
	description = "Почему ты не веришь Малаку?";
};
func int DIA_Gaan_Talbin_WhyDontBelieve_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_WhyDontBelieve_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_WhyDontBelieve_07_00");	//Почему ты не веришь Малаку?
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_01");	//Потому что он лжет. Я всю жизнь прожил на Хоринисе, а здешние леса и пастбища знаю, как свои пять пальцев.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_02");	//Никто и никогда не видел здесь белых волков! И я не думаю, чтобы они могли переплыть море, чтобы попасть сюда с материка.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_03");	//Кроме того, один раз крестьяне уже подшутили надо мной. Я дюжину дней кряду гонялся за собственной тенью.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_04");	//Второй раз я на эту удочку не попадусь.
};
//-----------------------------------------
instance DIA_Gaan_Talbin_MalakDoesntLie(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 2;
	condition = DIA_Gaan_Talbin_MalakDoesntLie_cond;
	information = DIA_Gaan_Talbin_MalakDoesntLie_info;
	description = "Я не думаю, что Малак лжет.";
};
func int DIA_Gaan_Talbin_MalakDoesntLie_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Gaan_Talbin_WhyDontBelieve)
		 && !Npc_KnowsInfo(other,DIA_Gaan_Talbin_MalakLies)
		 && !MIS_Talbin_WhiteWolf_Dead)	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_MalakDoesntLie_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakDoesntLie_07_00");	//Я не думаю, что Малак лжет. Он выглядит очень испуганным.
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakDoesntLie_03_01");	//Овцу он потерял, вот и трясется. Уснул где-нибудь под кустом, а теперь сваливает на выдуманного волка!
};
//-----------------------------------------
instance DIA_Gaan_Talbin_MalakLies(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 3;
	condition = DIA_Gaan_Talbin_MalakLies_cond;
	information = DIA_Gaan_Talbin_MalakLies_info;
	description = "Думаю ты прав, Малак лжет.";
};

func int DIA_Gaan_Talbin_MalakLies_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Gaan_Talbin_WhyDontBelieve)
		 && !Npc_KnowsInfo(other,DIA_Gaan_Talbin_MalakDoesntLie)
		 && !MIS_Talbin_WhiteWolf_Dead)	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_MalakLies_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakLies_07_00");	//Думаю ты прав, Малак лжет. Откуда бы тут взяться белому волку?
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakLies_03_01");	//Вот и я о чем.
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakLies_07_02");	//Но я все-таки пойду проверю, что он там видел.
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakLies_03_03");	//Дело твое. А я не собираюсь тратить свое время на выдумки.
};
//-----------------------------------------
instance DIA_Gaan_Talbin_WhiteWolfDead(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 5;
	condition = DIA_Gaan_Talbin_WhiteWolfDead_cond;
	information = DIA_Gaan_Talbin_WhiteWolfDead_info;
	description = "Я нашел белого волка.";
};
func int DIA_Gaan_Talbin_WhiteWolfDead_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf > 0)
		 && Npc_HasItems(other,ItAt_IceWolfFur))	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_WhiteWolfDead_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_00");	//Я нашел белого волка.
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_01");	//Посмотри-ка на его его шкуру!
	AI_Output(self,other,"DIA_Gaan_Talbin_WhiteWolfDead_03_02");	//Это... не может быть! Мех белый, как снег! А какая она огромная! Никогда ничего подобного не видел.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhiteWolfDead_03_03");	//Официально признаю - я идиот.
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_04");	//Бывает.
	B_GivePlayerXP(XP_Talbin_WhiteWolf_GaanTold);
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Gaan_Talbin_Perm(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 9;
	condition = DIA_Gaan_Talbin_Perm_cond;
	information = DIA_Gaan_Talbin_Perm_info;
	description = "Как дела на ферме?";
	permanent = TRUE;
};
func int DIA_Gaan_Talbin_Perm_cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_Perm_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_Perm_07_00");	//Как дела на ферме?
	AI_Output(self,other,"DIA_Gaan_Talbin_Perm_03_01");	//Все спокойно.
	if (MIS_Talbin_WhiteWolf == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_Gaan_Talbin_Perm_03_02");	//Если не считать Малака, который теперь подкалывает меня при каждом удобном случае.
	};
};


//===================================================
instance DIA_Gaan_Talbin_preTeachMandibles(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 50;
	condition = DIA_Gaan_Talbin_preTeachMandibles_cond;
	information = DIA_Gaan_Talbin_preTeachMandibles_info;
	description = "Ты знаешь, как правильно вынимать жвала насекомых?";
};
func int DIA_Gaan_Talbin_preTeachMandibles_cond()
{
	if (C_HeroIs_Talbin()
		 && MIS_Talbin_Hunt_NeedTeacherMandibles && !player_talent_takeanimaltrophy[TROPHY_Mandibles])	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_preTeachMandibles_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_preTeachMandibles_07_00");	//Ты знаешь, как правильно вынимать жвала насекомых?
	AI_Output(self,other,"DIA_Gaan_Talbin_preTeachMandibles_03_01");	//Знаю.
	AI_Output(self,other,"DIA_Gaan_Talbin_preTeachMandibles_03_02");	//Готов поделиться опытом за 150 золотых.
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Gaan);
};
//-----------------------------------------
instance DIA_Gaan_Talbin_TeachMandibles(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 51;
	condition = DIA_Gaan_Talbin_TeachMandibles_cond;
	information = DIA_Gaan_Talbin_TeachMandibles_info;
	description = "Научи меня вынимать жвала. (150 зол.)";
	permanent = TRUE;
};
func int DIA_Gaan_Talbin_TeachMandibles_cond()
{
	if (Npc_KnowsInfo(other,DIA_Gaan_Talbin_preTeachMandibles) && !player_talent_takeanimaltrophy[TROPHY_Mandibles])	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_TeachMandibles_info()
{
	AI_Output(other,self,"DIA_Gaan_Talbin_TeachMandibles_07_00");	//Научи меня вынимать жвала.
	if (C_NpcHasGold(other,150))	{
		B_GiveGold(other,self,150);
		AI_Output(self,other,"DIA_Gaan_Talbin_TeachMandibles_03_01");	//Чтобы не повредив отделить жвала от черепа, их нужно оттянуть как можно дальше и сильным точным ударом перерубить у основания.
		player_talent_takeanimaltrophy[TROPHY_Mandibles] = TRUE;
		B_LogNote(TOPIC_TalentAnimalTrophy,"...извлекать жвала у ползунов и полевых хищников.");
		B_InsertNpc(Minecrawler,"NW_MAGECAVE_23");
		B_InsertNpc(Minecrawler,"NW_TROLLAREA_TROLLLAKECAVE_03");
		B_InsertNpc(Minecrawler,"NW_RITUALFOREST_CAVE_05");
		B_InsertNpc(MinecrawlerWarrior,"NW_RITUALFOREST_CAVE_07");
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Talbin_TeachMandibles_03_02");	//Как только у тебя будет золото.
	};
};


///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Elena_ShadowFur(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 20;
	condition = DIA_Gaan_Elena_ShadowFur_cond;
	information = DIA_Gaan_Elena_ShadowFur_info;
	description = "Ты можешь продать мне шкуру мракориса?";
};
func int DIA_Gaan_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter)
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Gaan_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Gaan_Elena_ShadowFur_16_00");	//Ты можешь продать мне шкуру мракориса?
	AI_Output(self,other,"DIA_Gaan_Elena_ShadowFur_03_01");	//Мог бы, если бы она была.
	AI_Output(self,other,"DIA_Gaan_Elena_ShadowFur_03_02");	//Но здесь, на верхних пастбищах, мракорисов уже лет сорок не видели.
};


///////////////////////////// ОСТАЛЬНЫЕ ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Others_AUHunter(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 10;
	condition = DIA_Gaan_Others_AUHunter_cond;
	information = DIA_Gaan_Others_AUHunter_info;
	description = "Ты охотник?";
};
func int DIA_Gaan_Others_AUHunter_cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_AUHunter_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_03_00");	//Ты охотник?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_10_00");	//Ты охотник?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_14_00");	//Ты охотник?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_16_00");	//Ты охотник?
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_01m");	//(с поддельным изумлением) Как ты догадался?
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_01f");	//(с поддельным изумлением) Как ты догадалась?
	};
	AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_02");	//Конечно, я охотник. И я слежу, чтобы дикие звери не приближались к ферме Бенгара.
};
//-----------------------------------------
var int DIA_Gaan_Others_ManyBeasts_WhiteWolfTold;
instance DIA_Gaan_Others_ManyBeasts(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 11;
	condition = DIA_Gaan_Others_ManyBeasts_cond;
	information = DIA_Gaan_Others_ManyBeasts_info;
	description = "А тут много диких зверей?";
};
func int DIA_Gaan_Others_ManyBeasts_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_ManyBeasts_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_03_00");	//А тут много диких зверей?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_10_00");	//А тут много диких зверей?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_14_00");	//А тут много диких зверей?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_16_00");	//А тут много диких зверей?
	};
	AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_01");	//В основном падальщики и луркеры, а в лесу неподалеку кабаны да волки.
	AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_02");	//Но иногда с гор спускаются твари и покрупнее, так что смотри в оба.
	if (Wld_GetDay() < 4)	{
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_03");	//Недавно крестьяне придумали байку про белого волка.
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_04");	//Но я ни за что не поверю, что такая тварь водится на нашем острове. На материке, слыхал, бывают.
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_05");	//Недавно появился белый волк.
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_06");	//Ни за что бы не поверил, если бы мой приятель Талбин не показал мне его шкуру.
		DIA_Gaan_Others_ManyBeasts_WhiteWolfTold = TRUE;
	};
};
//-----------------------------------------
instance DIA_Gaan_Others_ManyMrms(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 12;
	condition = DIA_Gaan_Others_ManyMrms_cond;
	information = DIA_Gaan_Others_ManyMrms_info;
	description = "А грибы тут есть?";
};
func int DIA_Gaan_Others_ManyMrms_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_ManyMrms_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_03_00");	//А грибы тут есть?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_10_00");	//А грибы тут есть?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_14_00");	//А грибы тут есть?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_16_00");	//А грибы тут есть?
	};
	AI_Output(self,other,"DIA_Gaan_Others_ManyMrms_03_01");	//Есть немного. Походи между фермой и лесом, наверняка что-нибудь найдешь.
};
//-----------------------------------------
instance DIA_Gaan_Others_Perm(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 13;
	condition = DIA_Gaan_Others_Perm_cond;
	information = DIA_Gaan_Others_Perm_info;
	description = "Все спокойно?";
	permanent = TRUE;
};
func int DIA_Gaan_Others_Perm_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaan_Others_Perm_03_00");	//Все спокойно?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaan_Others_Perm_10_00");	//Все спокойно?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaan_Others_Perm_14_00");	//Все спокойно?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaan_Others_Perm_16_00");	//Все спокойно?
	};
	AI_Output(self,other,"DIA_Gaan_Others_Perm_03_01");	//Да, все как обычно.
	if (DIA_Gaan_Others_ManyBeasts_WhiteWolfTold == 1)	{
		AI_Output(self,other,"DIA_Gaan_Others_Perm_03_02");	//Не считая белого волка. Об этом крестьяне еще долго будут судачить.
		DIA_Gaan_Others_ManyBeasts_WhiteWolfTold += 1;
	};
};
	
// ВСЕ ================================================
instance DIA_Gaan_PermAll(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 14;
	condition = DIA_Gaan_Others_PermAll_cond;
	information = DIA_Gaan_Others_PermAll_info;
	description = "А проход в Рудниковую долину тебя не напрягает?";
	permanent = TRUE;
};
func int DIA_Gaan_Others_PermAll_cond()
{
	return TRUE;
};
func int DIA_Gaan_Others_PermAll_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Gaan_PermAll_03_00");	//А проход в Рудниковую долину тебя не напрягает?
	} else if (hero.voice == 7)	{	//Талбин
		AI_Output(other,self,"DIA_Gaan_PermAll_07_00");	//А проход в Рудниковую долину тебя не напрягает?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Gaan_PermAll_10_00");	//А проход в Рудниковую долину тебя не напрягает?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Gaan_PermAll_14_00");	//А проход в Рудниковую долину тебя не напрягает?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Gaan_PermAll_16_00");	//А проход в Рудниковую долину тебя не напрягает?
	};
	AI_Output(self,other,"DIA_Gaan_PermAll_03_01");	//Ничуть. За все эти годы оттуда еще никто не вышел.
	AI_Output(self,other,"DIA_Gaan_PermAll_03_02");	//Ворота закрыты скорее для того, чтобы какой-нибудь идиот случайно не угодил за Барьер.
};
