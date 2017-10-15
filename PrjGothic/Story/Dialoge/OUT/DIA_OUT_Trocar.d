
instance DIA_Trocar_EXIT(DIA_Proto_End)
{
	npc = OUT_1230_Trocar;
};

///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Trocar_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1230_Trocar;			nr = 20;
	condition = DIA_Trocar_Elena_ShadowFur_cond;
	information = DIA_Trocar_Elena_ShadowFur_info;
	description = "А шкура мракориса у тебя есть?";
};
func int DIA_Trocar_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && Npc_KnowsInfo(other,DIA_Trocar_WhoAU)
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Trocar_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Trocar_Elena_ShadowFur_16_00");	//А шкура мракориса у тебя есть?
	AI_Output(self,other,"DIA_Trocar_Elena_ShadowFur_12_01");	//Нет. Пока за этим кабаном гонялся, больше ни на что внимания не обращал.
};

///////////////////////////// ВСЕ ///////////////////////////////
//=====================================================
instance DIA_Trocar_Start(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Trocar_Start_info;
	important = TRUE;
};
func void DIA_Trocar_Start_info()
{
	self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] & ~BEHAV_Hidden;	//больше не прячется
	AI_Output(self,other,"DIA_Trocar_Start_12_01");	//Эй! Какого лешего ты тут шляешься?
	AI_SetWalkmode(self,NPC_RUN);
	AI_GotoNpc(self,other);
	AI_TurnToNpc(self,other);
	AI_WaitTillEnd(other,self);
	AI_TurnToNpc(other,self);
	AI_LookAtNpc(self,other);
	AI_LookAtNpc(other,self);
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_Start_03_02");	//Могу задать тебе тот же вопрос.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_Start_07_02");	//И тебе привет, Трокар.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_Start_10_02");	//Могу задать тебе тот же вопрос.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_Start_14_02");	//Могу задать тебе тот же вопрос.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_Start_16_02");	//Могу задать тебе тот же вопрос.
	};
	AI_Output(self,other,"DIA_Trocar_Start_12_03");	//У меня тут была засидка, пока кое-кто не пришел и не начал топать как тролль.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_Start_03_04");	//А на кого ты охотился?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_Start_07_04");	//А на кого была засидка?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_Start_10_04");	//А на кого была засидка?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_Start_14_04");	//А на кого была засидка?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_Start_16_04");	//А на кого ты охотился?
	};
	AI_Output(self,other,"DIA_Trocar_Start_12_05");	//Вот на него!
	AI_StopProcessInfos(self);
	AI_ReadyRangedWeapon(self);
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_DrawWeapon;
	Trocar_InsertKeiler = TRUE;
};

//=====================================================
instance DIA_Trocar_HogKilled(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 2;
	condition = DIA_Trocar_HogKilled_cond;
	information = DIA_Trocar_HogKilled_info;
	important = TRUE;
};
func int DIA_Trocar_HogKilled_cond()
{
	if (C_NpcIsDown(Keiler_Hog_Trocar))	{
		return TRUE;
	};
};
func void DIA_Trocar_HogKilled_info()
{
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_01");	//Наконец-то! Я третьи сутки охочусь на эту тварь.
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_02");	//Я ранил его в лесу, но он оказался толстокожим и сумел сбежать. Я пришел сюда по его следу.
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_03");	//Чтобы не спугнуть его снова, я устроил засидку на дереве. Но эта скотина не желала высовывать свой пятак из зарослей.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Trocar_HogKilled_12_04m");	//Пока не появился ты.
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_HogKilled_12_04f");	//Пока не появилась ты.
	};
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_05");	//Это просто какое-то невероятное везение, что он решил выйти на весь тот шум, что мы тут устроили.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_Thanks_03_06");	//Будем считать, что это было “спасибо за помощь“!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_Thanks_07_06");	//Будем считать, что это было “спасибо за помощь“!
		B_LogEntry(TOPIC_FindTrocar, TOPIC_FindTrocar_Found);
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_Thanks_10_06");	//Будем считать, что это было “спасибо за помощь“!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_Thanks_14_06");	//Будем считать, что это было “спасибо за помощь“!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_Thanks_16_06");	//Будем считать, что это было “спасибо за помощь“!
	};
	AI_Output(self,other,"DIA_Trocar_Thanks_12_07");	//Помощь? Пффф!
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08a");	//От бабы?
	}
	else if (C_HeroIs_Odo() && C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08b");	//От монастырской крысы?
	}
	else if (C_HeroIs_Rupert() || C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08c");	//От такого увальня?
	}
	else if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08d");	//От старика?
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08e");	//От тебя-то?
	};
	AI_Output(self,other,"DIA_Trocar_Thanks_12_09");	//Это тебе надо благодарить меня за спасение!
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_440_Bartok,"TROCARMEET");
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_DrawWeapon;
	B_GivePlayerXP(XP_Trocar_Found);
};

//=====================================================
func void DIA_Trocar_OfOldTimes()
{
	AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_00");	//Хотя теперь охота не та, что прежде.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_01");	//Ты бы слышал, о каких зверях рассказывал мой дед!
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_01f");	//Ты бы слышала, о каких зверях рассказывал мой дед!
	};
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_03_02");	//Например?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_07_02");	//Например?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_10_02");	//Например?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_14_02");	//Например?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_16_02");	//Например?
	};
	AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_03");	//Например, про белого мракориса. Или про полосатых варгов. А еще про крысиного короля.
	DIA_Trocar_TellTales = TRUE;
};
// ----------------------------------------------
instance DIA_Trocar_WhoAU(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 3;
	condition = DIA_Trocar_WhoAU_cond;
	information = DIA_Trocar_WhoAU_info;
	description = "Кто ты?";
};
func int DIA_Trocar_WhoAU_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_WhoAU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_WhoAU_03_00");	//Кто ты?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_WhoAU_10_00");	//Кто ты?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_WhoAU_14_00");	//Кто ты?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_WhoAU_16_00");	//Кто ты?
	};
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_01");	//Меня зовут Трокар.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_02");	//Я охочусь обычно со своим другом, Бартоком. Но мы на время разбежались.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_03");	//Барток - отличный товарищ, но ему не хватает авантюризма.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_04");	//Охотиться поближе к городу, сдавать шкуры Босперу и пропивать полученные деньги в таверне - вот его горизонт.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_05");	//Я так не могу. Охота - это кураж, это гонка со зверем. Поэтому я иногда ухожу поохотиться без него.
	B_LogEntry(TOPIC_FindTrocar, TOPIC_FindTrocar_Found);
	DIA_Trocar_OfOldTimes();
};

//------------------------------------------------------
instance DIA_Trocar_Talbin_WhyAlone(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 4;
	condition = DIA_Trocar_Talbin_WhyAlone_cond;
	information = DIA_Trocar_Talbin_WhyAlone_info;
	description = "Ты почему один?";
};
func int DIA_Trocar_Talbin_WhyAlone_cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_Talbin_WhyAlone_info()
{
		AI_Output(other,self,"DIA_Trocar_Talbin_WhyAlone_07_00");	//Ты почему один?
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_01");	//Бартока слишком трудно вытащить на серьезную охоту.
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_02");	//К чему рисковать, если денег и так хватает? - вот его позиция. Так и закиснуть недолго.
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_03");	//Так что я иногда ухожу поохотиться в одиночку.
	DIA_Trocar_OfOldTimes();
};

//=====================================================
instance DIA_Trocar_MsgFromBartok(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 5;
	condition = DIA_Trocar_MsgFromBartok_cond;
	information = DIA_Trocar_MsgFromBartok_info;
	description = "Барток просил передать тебе...";
};
func int DIA_Trocar_MsgFromBartok_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Trocar_WhoAU) || C_HeroIs_Talbin())
		 && Npc_KnowsInfo(other,DIA_Bartok_Alone) && (Npc_GetDistToNpc(self,VLK_440_Bartok) > PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Trocar_MsgFromBartok_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_03_00");	//Барток просил передать тебе, что ты забыл нож у Орлана.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_07_00");	//Барток просил передать тебе, что ты забыл нож у Орлана.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_10_00");	//Барток просил передать тебе, что ты забыл нож у Орлана.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_14_00");	//Барток просил передать тебе, что ты забыл нож у Орлана.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_16_00");	//Барток просил передать тебе, что ты забыл нож у Орлана.
	};
	var C_NPC portal_owner;	portal_owner = Npc_GetPortalOwner(self);
	if (C_NpcIs(portal_owner,OUT_1202_Orlan))	{	//(Npc_GetDistToWP(self,self.wp) < PERC_DIST_ACTIVE_MAX)
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_03_01");	//Но ты, наверное, и так уже в курсе.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_07_01");	//Но ты, наверное, и так уже в курсе.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_10_01");	//Но ты, наверное, и так уже в курсе.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_14_01");	//Но ты, наверное, и так уже в курсе.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_16_01");	//Но ты, наверное, и так уже в курсе.
		};
		AI_Output(self,other,"DIA_Trocar_MsgFromBartok_12_02");	//Да, но все равно спасибо.
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_MsgFromBartok_12_03");	//О, спасибо. А я думал, что потерял, когда за кабаном гнался.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		B_LogEntry_Status(TOPIC_FindTrocar, LOG_SUCCESS, TOPIC_FindTrocar_Told);
	}
	else {
		B_LogEntry_Status(TOPIC_FindTrocar, LOG_SUCCESS, TOPIC_FindTrocar_Told_F);
	};
	B_GivePlayerXP(XP_Trocar_Told);
};

//=====================================================
instance DIA_Trocar_Perm(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 10;
	condition = DIA_Trocar_Perm_cond;
	information = DIA_Trocar_Perm_info;
	description = "Что будешь делать дальше?";
	permanent = TRUE;
};
func int DIA_Trocar_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_Perm_03_00");	//Что будешь делать дальше?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_Perm_07_00");	//Что будешь делать дальше?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_Perm_10_00");	//Что будешь делать дальше?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_Perm_14_00");	//Что будешь делать дальше?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_Perm_16_00");	//Что будешь делать дальше?
	};
	AI_Output(self,other,"DIA_Trocar_Perm_12_01");	//Напьюсь и отогреюсь как следует! Я до мозга костей промерз на этом дурацком дереве!
};

// БАЙКИ ОХОТНИКОВ ====================================
// О белом мракорисе, варгах и крысах
//=====================================================
instance DIA_Trocar_WhiteShadowbeast(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 40;
	condition = DIA_Trocar_WhiteShadowbeast_cond;
	information = DIA_Trocar_WhiteShadowbeast_info;
	description = "Расскажи про белого мракориса.";
	permanent = TRUE;
};
func int DIA_Trocar_WhiteShadowbeast_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_WhiteShadowbeast_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_00");	//Расскажи про белого мракориса.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_00");	//Расскажи про белого мракориса.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_00");	//Расскажи про белого мракориса.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_00");	//Расскажи про белого мракориса.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_00");	//Расскажи про белого мракориса.
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_01");	//Один старый охотник встретил такого в горах между Верхними пастбищами и Долиной Рудников.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_02");	//Зверь был огромен, а глаза у него горели красным огнем.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_03");	//Так уж и горели?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_03");	//Так уж и горели?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_03");	//Так уж и горели?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_03");	//Так уж и горели?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_03");	//Так уж и горели?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_04");	//Точно тебе говорю! Он бросился на охотника и тот смог спастись, только забравшись на дерево, которое, на его удачу, росло рядом.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_05");	//Вот только, карабкаясь на дерево, он выронил лук и остался с одним ножом.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_06");	//Мракорис сначала прыгал за ним, но достать не мог. А потом улегся под деревом и стал ждать.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_07");	//И что, дождался?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_07");	//И что, дождался?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_07");	//И что, дождался?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_07");	//И что, дождался?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_07");	//И что, дождался?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_08");	//Нет, конечно. Иначе бы мы этой истории не услышали. Но Иннос точно хранил этого охотника.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_09");	//Незадолго до встречи с мракорисом он нашел в какой-то пещере магический свиток.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_10");	//Заклинание было ему незнакомо, но тут выбирать не приходилось, и он наудачу прочел его.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_11");	//Как же он удивился, когда огромный мракорис вдруг начал сморщиваться, словно рыбий пузырь на огне.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_12");	//Через минуту он уже был не крупнее кротокрыса. Тогда охотник спрыгнул с дерева и всадил нож тварюге прямо в кроваво-красный глаз.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_13");	//Он тут же снял шкуру, и только потом понял, какую глупость сделал.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_14");	//Туша мракориса через некоторое время опять стала огромной, а шкурка так и осталась маленькой. Никто не верил, что он снял ее c мракориса, тем более с белого.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_15");	//А ты сам ее видел?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_15");	//А ты сам ее видел?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_15");	//А ты сам ее видел?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_15");	//А ты сам ее видел?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_15");	//А ты сам ее видел?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_16");	//Нет. Охотник сказал, что продул ее в кости.
	if (!Tale_WhiteShadowbeast_Once)	{
		Tale_WhiteShadowbeast_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
//-----------------------------------------------
instance DIA_Trocar_StripedWarg(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 41;
	condition = DIA_Trocar_StripedWarg_cond;
	information = DIA_Trocar_StripedWarg_info;
	description = "Разве не все варги черной масти?";
	permanent = TRUE;
};
func int DIA_Trocar_StripedWarg_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_StripedWarg_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_StripedWarg_03_00");	//Разве не все варги черной масти?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_StripedWarg_07_00");	//Разве не все варги черной масти?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_StripedWarg_10_00");	//Разве не все варги черной масти?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_StripedWarg_14_00");	//Разве не все варги черной масти?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_StripedWarg_16_00");	//Разве не все варги черной масти?
	};
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_01");	//Не все. Еще бывают бурые, с черными полосками на боках. Таких мой дед однажды встретил в Долине Рудников. Это еще до барьера было.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_02");	//Дед охотился возле одной из тамошних рек, а мясо продавал стражникам на рудниках. У тех вечно были проблемы с провизией.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_03");	//Тогда он заготовил целую гору мяса с кротокрысов и падальщиков. Он как раз коптил последнюю партию, когда вдруг услышал за спиной рычание.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_04");	//Обернувшись, он увидел двух бурых зверюг, скаливших на него огромные клыки. Не растерявшись, дед выхватил арбалет и уложил обоих парой выстрелов.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_05");	//Благо, с такого расстояния он бы попал в них и с завязанными глазами.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_06");	//Только подойдя к тушам, он понял, что это были полосатые варги. А потом к его стоянке вышли несколько орков со здоровенными топорами...
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_StripedWarg_03_07");	//И что? Они его убили?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_StripedWarg_07_07");	//И что? Они его убили?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_StripedWarg_10_07");	//И что? Они его убили?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_StripedWarg_14_07");	//И что? Они его убили?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_StripedWarg_16_07");	//И что? Они его убили?
	};
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_08");	//Еще чего! Дед помер много лет спустя в собственной постели. Кутил три дня в “Красном фонаре“ и пил с дружками в таверне. А потом пришел домой, лег и помер.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_09");	//А в тот раз он, конечно, сильно струхнул. Но один из орков заговорил с ним по-человечески.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_10");	//Правда, орк страшно коверкал все слова, но понять было можно. Оказалось, что это были прирученные варги, с которыми орки охотились.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_11");	//Орки не могли вернуться домой с пустыми руками. Тогда дед предложил им за убитых варгов мясо из своих запасов.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_12");	//Орки согласились и даже дали ему несколько кож с каких-то ящеров. Дед таких никогда не видел.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_13");	//Кожи он потом выгодно продал, но в Долину Рудников больше никогда в жизни не ходил.
	if (!Tale_Wargs_Once)	{
		Tale_Wargs_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

//-----------------------------------------------
instance DIA_Trocar_RatKing(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 42;
	condition = DIA_Trocar_RatKing_cond;
	information = DIA_Trocar_RatKing_info;
	description = "Что еще за крысиный король?";
	permanent = TRUE;
};
func int DIA_Trocar_RatKing_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_RatKing_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_RatKing_03_00");	//Что еще за крысиный король?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_RatKing_07_00");	//Что еще за крысиный король?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_RatKing_10_00");	//Что еще за крысиный король?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_RatKing_14_00");	//Что еще за крысиный король?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_RatKing_16_00");	//Что еще за крысиный король?
	};
	AI_Output(self,other,"DIA_Trocar_RatKing_12_01");	//Крысиный король - это жуткая штука. Говорят, увидеть такого - к большой беде.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_02");	//Брат моего деда как раз рассказывал, что наткнулся на одного - незадолго до своей смерти.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_03");	//Да не просто крысиного короля, а из болотных крыс. Они толстые, как кротокрысы, и такие же неповоротливые. Зато и цапнуть могут нехило. Но не в этом соль.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_04");	//В отличие от обычных крыс, эти редко приближаются к людским жилищам, поэтому их никто почти и не видел.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_05");	//Но брат деда знал, что если добраться до болота в Долине Рудников, то можно быстро добыть целую гору мяса.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_06");	//В тот раз он месил болотную жижу почти полдня, а так и не встретил ни одной крысы. Одних комаров и кровавых мух.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_07");	//Он уже собирался возвращаться, когда услышал хриплый визг болотных крыс.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_08");	//Сначала он обрадовался, что таки добудет мяса. Но когда он выбрался на остров, ему открылась кошмарная картина.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_09");	//На полянке копошились и верещали с десяток болотных крыс, а их хвосты были все перепутаны, словно они срослись между собой в одну многоголовую крысу.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_10");	//Крысы рвались в разные стороны, но в результате не могли сдвинуться с места. Пара из них уже сдохли, задавленные или разорванные товарками.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_11");	//Появления человека они даже не заметили. А брат деда рванул с болота со всех сил.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_12");	//Домой он добрался наполовину седым. А со следующей охоты уже и не вернулся. Его тело дед нашел только через неделю, и оно все было обглодано крысами.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_13");	//Дед узнал брата только по амулету, с которым тот никогда не расставался.
	if (!Tale_RatKing_Once)	{
		Tale_RatKing_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

//-----------------------------------------------
instance DIA_Trocar_SnowWolf(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 43;
	condition = DIA_Trocar_SnowWolf_cond;
	information = DIA_Trocar_SnowWolf_info;
	description = "А про белых волков ты слышал?";
	permanent = TRUE;
};
func int DIA_Trocar_SnowWolf_cond()
{
	if (DIA_Trocar_TellTales && (MIS_Talbin_WhiteWolf != 0 || DIA_Gaan_Others_ManyBeasts_WhiteWolfTold))	{
		return TRUE;
	};
};
func void DIA_Trocar_SnowWolf_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_SnowWolf_03_00");	//А про белых волков ты слышал?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_SnowWolf_07_00");	//А про белых волков ты слышал?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_SnowWolf_10_00");	//А про белых волков ты слышал?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_SnowWolf_14_00");	//А про белых волков ты слышал?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_SnowWolf_16_00");	//А про белых волков ты слышал?
	};
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_01");	//А как же! Я слыхал, что высоко в горах, там, где даже летом не тает снег, живут снежные волки. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_02");	//Добычи там мало, поэтому они постоянно злые и голодные. А еще они очень выносливые, и убить их труднее, чем простых волков. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_03");	//Последний раз их видели лет триста назад, когда на Хоринис пришла очень суровая зима.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_04");	//Все завалило снегом, реки и озера промерзли до дна, а холод стоял такой, что люди боялись выходить из домов.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_05");	//И вот тогда с гор спустились снежные волки. Они резали и овец, и пытавшихся защитить их крестьян. Несколько ферм тогда были полностью опустошены. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_06");	//А потом снежные волки подошли к самому городу и разорвали дозор стражников, которых посылали собирать мертвецов. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_07");	//Тогда многие путники замерзали прямо на дороге, не добравшись до городских ворот. Волки их жрали, а стражники оказались поблизости в разгар пиршества и погибли. 
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Trocar_SnowWolf_03_08");	//И как люди от них избавились?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Trocar_SnowWolf_07_08");	//И как люди от них избавились?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Trocar_SnowWolf_10_08");	//И как люди от них избавились?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Trocar_SnowWolf_14_08");	//И как люди от них избавились?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Trocar_SnowWolf_16_08");	//И как люди от них избавились?
	};
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_09");	//Да никак. Вскоре наступила оттепель, и снежные волки ушли сами. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_10");	//Некоторые старики потом уверяли, что те холода на остров наслал ледяной дракон, прилетевший с севера. Но я в эти бредни не верю. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_11");	//Морские драконы действительно существуют. В этом может убедиться любой, кто отплывет подальше от берега.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_12");	//А вот летающих драконов, да еще наделенных магической силой, точно не бывает. Это сказки.
	if (!Tale_WhiteWolf_Once)	{
		Tale_WhiteWolf_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
