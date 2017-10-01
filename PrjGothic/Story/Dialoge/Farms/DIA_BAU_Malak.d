
instance DIA_Malak_EXIT(DIA_Proto_End)
{
	condition = DIA_Malak_EXIT_cond;
	npc = BAU_963_Malak;
};
func int DIA_Malak_EXIT_cond()
{
	if (self.npcType == npctype_main)	{
		return TRUE;
	};
};

///////////////////////////// ТАЛБИН ///////////////////////////////

// ТРИАЛОГ с ГААНОМ -----------------------------------------
var int Malak_Gaan_TRIA_Phrase;
const int Malak_Gaan_TRIA_Phrase_Last = 6;
instance DIA_Malak_Gaan_SawWhiteWolf(C_INFO)
{
	npc = BAU_963_Malak;			nr = 1;
	condition = DIA_Malak_Gaan_SawWhiteWolf_cond;
	information = DIA_Malak_Gaan_SawWhiteWolf_info;
	important = TRUE;
};
func int DIA_Malak_Gaan_SawWhiteWolf_cond()
{
	if (C_HeroIs_Talbin()
		 && ((Npc_GetDistToNpc(self,BAU_961_Gaan) < PERC_DIST_DIALOG) && (Malak_Gaan_TRIA_Phrase == 0) 	//ГГ только подошел
		 || (Malak_Gaan_TRIA_Phrase <= Malak_Gaan_TRIA_Phrase_Last)))	{		//или уже идет триалог
		DIA_Malak_Gaan_SawWhiteWolf.permanent = TRUE;
		//кто и с кем говорит
		if (C_NpcIs(self,BAU_963_Malak))	{
			self.aivar[AIV_TALK_TRIA] = Hlp_GetInstanceID(BAU_961_Gaan);
		}
		else	{
			self.aivar[AIV_TALK_TRIA] = Hlp_GetInstanceID(BAU_963_Malak);
		};
		return TRUE;
	};
};
func void DIA_Malak_Gaan_SawWhiteWolf_info()
{
	if (Malak_Gaan_TRIA_Phrase == 0)	{
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_08_00");	//А я говорю, что видел его! Своими глазами!
		AI_GotoNpc(other,self);
		DIA_Malak_Gaan_SawWhiteWolf.npc = Hlp_GetInstanceID(BAU_961_Gaan);
	}
	else if (Malak_Gaan_TRIA_Phrase == 1)	{
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_03_01");	//А Рухар на прошлой неделе своими глазами видел, как кротокрыс откусил кусок от луны!
			DIA_Malak_Gaan_SawWhiteWolf.npc = Hlp_GetInstanceID(BAU_963_Malak);
	}
	else if (Malak_Gaan_TRIA_Phrase == 2)	{
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_08_02");	//Но я-то не Рухар...
		DIA_Malak_Gaan_SawWhiteWolf.npc = Hlp_GetInstanceID(BAU_961_Gaan);
	}
	else if (Malak_Gaan_TRIA_Phrase == 3)	{
			AI_Output(other,self,"DIA_Malak_Gaan_SawWhiteWolf_07_03");	//О чем спор?
		B_TurnToNpc(self,other);
		B_LookAtNpc(self,other);
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_03_04");	//Да вот, Малак утверждает, что своими глазами видел белого волка.
		DIA_Malak_Gaan_SawWhiteWolf.npc = Hlp_GetInstanceID(BAU_963_Malak);
	}
	else if (Malak_Gaan_TRIA_Phrase == 4)	{
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_08_05");	//Потому что я его ВИДЕЛ! А эта ленивая задница не желает пойти и пристрелить его!
		DIA_Malak_Gaan_SawWhiteWolf.npc = Hlp_GetInstanceID(BAU_961_Gaan);
	}
	else if (Malak_Gaan_TRIA_Phrase == 5)	{
		AI_TurnToNpc(self,BAU_963_Malak);
		AI_LookAtNpc(self,BAU_963_Malak);
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_03_06");	//Я не желаю, чтобы надо мной насмехался весь Хоринис.
		AI_Output(self,other,"DIA_Malak_Gaan_SawWhiteWolf_03_07");	//Белый волк! Это же надо такое выдумать!
	}
	else if (Malak_Gaan_TRIA_Phrase == 6)	{
		//конец трилога
		AI_StopProcessInfos(self);
		DIA_Malak_Gaan_SawWhiteWolf.permanent = FALSE;
		BAU_961_Gaan.aivar[AIV_TALK_TRIA] = 0;
		BAU_963_Malak.aivar[AIV_TALK_TRIA] = 0;
		B_StartOtherRoutine(BAU_961_Gaan,"START");
		B_StartOtherRoutine(BAU_963_Malak,"START");
		B_InsertNpc(Icewolf_Talbin,"NW_BIGMILL_FARM3_RANGERBANDITS_ELVRICH");
		B_LogEntry_Create(TOPIC_Talbin_WhiteWolf,LOG_MISSION,TOPIC_Talbin_WhiteWolf_Start);
		MIS_Talbin_WhiteWolf = LOG_Running;
	};
	Malak_Gaan_TRIA_Phrase += 1;	//следующая реплика
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Malak_WhiteWolfWhere(C_INFO)
{
	npc = BAU_963_Malak;			nr = 2;
	condition = DIA_Malak_WhiteWolfWhere_cond;
	information = DIA_Malak_WhiteWolfWhere_info;
	description = "Где ты видел белого волка?";
	permanent = TRUE;
};
func int DIA_Malak_WhiteWolfWhere_cond()
{
	if (C_HeroIs_Talbin()
		 && (MIS_Talbin_WhiteWolf == LOG_Running) && !MIS_Talbin_WhiteWolf_Dead)	{
		return TRUE;
	};
};
func void DIA_Malak_WhiteWolfWhere_info()
{
		AI_Output(other,self,"DIA_Malak_WhiteWolfWhere_07_00");	//Где ты видел белого волка?
	AI_Output(self,other,"DIA_Malak_WhiteWolfWhere_08_01");	//Да тут, неподалеку, возле озера с двумя водопадами.
	AI_Output(self,other,"DIA_Malak_WhiteWolfWhere_08_02");	//Овца у меня убежала, я и пошел ее искать. Приметил белое за камнем, сунулся - а он оскалился и ка-ак зарычит!
	AI_Output(self,other,"DIA_Malak_WhiteWolfWhere_08_03");	//Ну я и дал деру во все лопатки. Только возле фермы в себя пришел.
	B_LogEntry(TOPIC_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_Where);
};

//-----------------------------------------
instance DIA_Malak_WhiteWolfPrice(C_INFO)
{
	npc = BAU_963_Malak;			nr = 3;
	condition = DIA_Malak_WhiteWolfPrice_cond;
	information = DIA_Malak_WhiteWolfPrice_info;
	description = "Что я получу, если подстрелю твоего волка?";
};
func int DIA_Malak_WhiteWolfPrice_cond()
{
	if (C_HeroIs_Talbin()
		 && (MIS_Talbin_WhiteWolf == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Malak_WhiteWolfPrice_info()
{
		AI_Output(other,self,"DIA_Malak_WhiteWolfPrice_07_00");	//Что я получу, если подстрелю твоего волка?
	AI_Output(self,other,"DIA_Malak_WhiteWolfPrice_08_01");	//У меня нет ничего ценного. Кроме прямых рук.
	AI_Output(self,other,"DIA_Malak_WhiteWolfPrice_08_02");	//Я могу сделать для тебя сотню стрел.
	B_LogEntry(TOPIC_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_Price);
};

//-----------------------------------------
instance DIA_Malak_WhiteWolfDead(C_INFO)
{
	npc = BAU_963_Malak;			nr = 4;
	condition = DIA_Malak_WhiteWolfDead_cond;
	information = DIA_Malak_WhiteWolfDead_info;
	description = "Я нашел белого волка!";
};
func int DIA_Malak_WhiteWolfDead_cond()
{
	if (C_HeroIs_Talbin()
		 && MIS_Talbin_WhiteWolf_Dead && Npc_HasItems(other,ItAt_IceWolfFur))	{
		return TRUE;
	};
};
func void DIA_Malak_WhiteWolfDead_info()
{
		AI_Output(other,self,"DIA_Malak_WhiteWolfDead_07_00");	//Я нашел белого волка! Смотри, вот его шкура.
	AI_Output(self,other,"DIA_Malak_WhiteWolfDead_08_01");	//Тебе удалось!
	AI_Output(self,other,"DIA_Malak_WhiteWolfDead_08_02");	//Ха, теперь-то мы заткнем за пояс этого охотника-недоучку!
	if (Npc_KnowsInfo(other,DIA_Malak_WhiteWolfPrice))	{
		AI_Output(self,other,"DIA_Malak_WhiteWolfDead_08_03");	//Вот, я, как и обещал, выстрогал для тебя сотню стрел.
	}
	else	{
		AI_Output(self,other,"DIA_Malak_WhiteWolfDead_08_04");	//У меня нет денег, но я выстрогал для тебя сотню стрел.
	};
	B_GiveInvItems(self,other,ItRw_Arrow,100);
	AI_Output(self,other,"DIA_Malak_WhiteWolfDead_08_05");	//А еще у меня есть немного ягод.
	B_GiveInvItems(self,other,ItPl_Planeberry,10);
	B_LogEntry_Status(TOPIC_Talbin_WhiteWolf,LOG_SUCCESS,TOPIC_Talbin_WhiteWolf_SuccessMalak);
	MIS_Talbin_WhiteWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Talbin_WhiteWolf_MalakTold);
};
