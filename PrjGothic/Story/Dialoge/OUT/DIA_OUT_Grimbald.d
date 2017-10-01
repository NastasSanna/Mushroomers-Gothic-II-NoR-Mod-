
instance DIA_Grimbald_EXIT(DIA_Proto_End)
{
	npc = OUT_1210_Grimbald;
};


///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Grimbald_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1210_Grimbald;			nr = 30;
	condition = DIA_Grimbald_Elena_ShadowFur_cond;
	information = DIA_Grimbald_Elena_ShadowFur_info;
	description = "Скажи, а у тебя есть шкура мракориса?";
};
func int DIA_Grimbald_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Grimbald_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Grimbald_Elena_ShadowFur_16_00");	//Скажи, а у тебя есть шкура мракориса?
	AI_Output(self,other,"DIA_Grimbald_Elena_ShadowFur_07_01");	//Была. На стоянке осталась.
};


///////////////////////////// ВСЕ ///////////////////////////////

//=============================================
func void DIA_Grimbald_Success_GoEast()
{
	if (C_HeroIs_Talbin())	{
		AI_Output(other,self,"DIA_Grimbald_Success_GoEast_07_01");	//Ты можешь передохнуть в нашем лагере неподалеку от Мертвой гарпии.
		AI_Output(self,other,"DIA_Grimbald_Success_GoEast_07_02");	//Я надеялся, что ты это скажешь. Я останусь на несколько дней, если ты не против.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_Success_GoEast_07_03");	//Я загляну в лагерь охотников возле Мертвой гарпии. Ищи меня там, если понадоблюсь.
	};
	B_StartOtherRoutine(self,"GOEAST");
};
//==================================================
instance DIA_Grimbald_Start(C_INFO)
{
	npc = OUT_1210_Grimbald;
	condition = DIA_NoCond_cond;
	information = DIA_Grimbald_Start_Info;
	important = TRUE;
};
func void DIA_Grimbald_Start_Info()
{
	B_StartOtherRoutine(self,"START");
	AI_StopAim(self);
	AI_Output(self,other,"DIA_Grimbald_Start_07_00");	//Демон меня задери! Я же чуть стрелу не пустил!
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Grimbald_Start_07_01");	//Думал, орки мой схорон нашли. Ну и собирался помереть с честью...
	AI_Output(self,other,"DIA_Grimbald_Start_07_02");	//А ты тут какими судьбами?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Start_03_03");	//Грибы собираю.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Start_07_03");	//Ты не поверишь - на грибы охочусь.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Start_10_03");	//Да вот, за грибами вышел.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Start_14_03");	//Да вот, за грибами вышел.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Start_16_03");	//Собираю грибы.
	};
	AI_Output(self,other,"DIA_Grimbald_Start_07_04");	//Не самое удачное место.
	AI_Output(self,other,"DIA_Grimbald_Start_07_05");	//Если ты пройдешь еще чуть дальше в горы, то наткнешься на отряд орков.
	AI_Output(self,other,"DIA_Grimbald_Start_07_06");	//Эти твари спустились с гор, напали на наш лагерь и убили всех моих товарищей!
	AI_Output(self,other,"DIA_Grimbald_Start_07_07");	//Пара минут - и я остался один. Я тогда решил, что жизнь дороже, и дал деру со всех лопаток.
	AI_Output(self,other,"DIA_Grimbald_Start_07_08");	//Спрятался в этой пещере. Тут у нас вроде как склад.
	B_LogEntry_Create(TOPIC_GrimbaldOrcs,LOG_MISSION,TOPIC_GrimbaldOrcs_Start);
	MIS_GrimbaldOrcs = LOG_Running;
};
//==================================================
instance DIA_Grimbald_HowLongAUHere(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 1;
	condition = DIA_Grimbald_HowLongAUHere_cond;
	information = DIA_Grimbald_HowLongAUHere_Info;
	description = "Давно ты тут сидишь?";
};
func int DIA_Grimbald_HowLongAUHere_cond()
{
	if (MIS_GrimbaldOrcs != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_Grimbald_HowLongAUHere_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_03_00");	//Давно ты тут сидишь?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_07_00");	//Давно ты тут сидишь?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_10_00");	//Давно ты тут сидишь?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_14_00");	//Давно ты тут сидишь?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_16_00");	//Давно ты тут сидишь?
	};
	AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_01");	//Несколько дней. 
	AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_02");	//Я надеялся, что орки уйдут, и я своих друзей хотя бы похороню по-человечески...
	if (MIS_GrimbaldOrcs_GetBow == 0)	{
		AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_03");	//Да и вещи там кое-какие остались...
	};
};

// ОРКИ МЕРТВЫ ==================================================
instance DIA_Grimbald_OrcsDead(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 2;
	condition = DIA_Grimbald_OrcsDead_cond;
	information = DIA_Grimbald_OrcsDead_Info;
	description = "Орки мертвы.";
};
func int DIA_Grimbald_OrcsDead_cond()
{
	if ((MIS_GrimbaldOrcs_DeadCnt == 3) && (MIS_GrimbaldOrcs >= LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Grimbald_OrcsDead_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_03_00");	//Орки мертвы.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_07_00");	//Орки мертвы.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_10_00");	//Орки мертвы.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_14_00");	//Орки мертвы.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_16_00");	//Орки мертвы.
	};
	if (MIS_GrimbaldOrcs == LOG_SUCCESS)	{	//уже достал лук и ушел
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_01");	//Ха! Эти твари все-таки получили свое. Но я туда больше не вернусь.
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_02");	//Можешь взять себе все, что там найдешь.
		B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
	}
	else if ((MIS_GrimbaldOrcs_GetBow >= MIS_GrimbaldOrcs_GetBow_Go) || (MIS_GrimbaldOrcs_DeadCnt_Seen >= 2))	{	//был неподалеку
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_03");	//Да, я видел. Эти твари все-таки получили свое!
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_04");	//Я похороню своих товарищей, а потом двинусь на восток.
		if (Npc_HasItems(self, ItKe_Chest_Hunters))	{
			AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_04");	//Возьми ключ от нашего сундука. Все, что там найдешь - твое.
			B_GiveInvItems(self,other,ItKe_Chest_Hunters,1);
		};
		B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
		DIA_Grimbald_Success_GoEast();
		MIS_GrimbaldOrcs = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_OrcsDead);
		self.npcType = NPCTYPE_FRIEND;
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_05");	//Что?! Я тебе не верю.
		Info_ClearChoices(DIA_Grimbald_OrcsDead);
		Info_AddChoice(DIA_Grimbald_OrcsDead,"Сходи и посмотри сам, если не веришь.",DIA_Grimbald_OrcsDead_Go2See);
	};
};
func void DIA_Grimbald_OrcsDead_Go2See()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_03_00");	//Сходи и посмотри сам, если не веришь.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_07_00");	//Сходи и посмотри сам, если не веришь.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_10_00");	//Сходи и посмотри сам, если не веришь.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_14_00");	//Сходи и посмотри сам, если не веришь.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_16_00");	//Сходи и посмотри сам, если не веришь.
	};
	AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_01");	//Именно так я и сделаю! И если ты врешь, тебя ждет хорошая взбучка!
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_02");	//Даже если ты женщина.
	}
	else if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_03");	//Хоть ты и старик.
	};
	B_StartOtherRoutine(self,"CHECK");
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_OrcsDead_Liar);
};

// ==================================================
instance DIA_Grimbald_OrcsDead_True(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_OrcsDead_True_cond;
	information = DIA_Grimbald_OrcsDead_True_Info;
	important = TRUE;
};
func int DIA_Grimbald_OrcsDead_True_cond()
{
	if (Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead)
		&& (Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Grimbald_OrcsDead_True_Info()
{
	AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_01");	//Это правда! Хоть я и не верю своим глазам.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_02");	//Наверное, в армии короля не хватает таких людей, чтобы война закончилась.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_03");	//Возможно, если бы Робар набрал в свою армию таких женщин, он бы давно победил.
	};
	if (Npc_HasItems(self, ItKe_Chest_Hunters))	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_04");	//Возьми ключ от нашего сундука. Все, что там найдешь - твое.
		B_GiveInvItems(self,other,ItKe_Chest_Hunters,1);
	};
	//UNTESTED
	B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
	DIA_Grimbald_Success_GoEast();
	MIS_GrimbaldOrcs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_OrcsDead);
	self.npcType = NPCTYPE_FRIEND;
};

//МЕСТЬ И ЛУК ==================================================
instance DIA_Grimbald_WannaRevenge(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 4;
	condition = DIA_Grimbald_WannaRevenge_cond;
	information = DIA_Grimbald_WannaRevenge_Info;
	description = "А ты не думал отомстить оркам?";
};
func int DIA_Grimbald_WannaRevenge_cond()
{
	if (!Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))	{
		return TRUE;
	};
};
func void DIA_Grimbald_WannaRevenge_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_03_00");	//А ты не думал отомстить оркам?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_07_00");	//А ты не думал отомстить оркам?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_10_00");	//А ты не думал отомстить оркам?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_14_00");	//А ты не думал отомстить оркам?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_16_00");	//А ты не думал отомстить оркам?
	};
	AI_Output(self,other,"DIA_Grimbald_WannaRevenge_07_01");	//Да я только об этом и думаю! Но в одиночку мне с ними не справиться.
	AI_Output(self,other,"DIA_Grimbald_WannaRevenge_07_02");	//А от городской стражи помощи не дождешься. Им бы только пиво в таверне хлебать, да собирать налоги.
};
//==================================================
instance DIA_Grimbald_ICanHelp(C_Info)
{
	npc = OUT_1210_Grimbald;
	nr = 5;
	condition = DIA_Grimbald_ICanHelp_Cond;
	information = DIA_Grimbald_ICanHelp_Info;
	description = "Хочешь, я помогу тебе?";
};
func int DIA_Grimbald_ICanHelp_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Grimbald_WannaRevenge)
		&& (MIS_GrimbaldOrcs != LOG_SUCCESS)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))	{
		return TRUE;
	};
};
func void DIA_Grimbald_ICanHelp_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_03_00");	//Хочешь, я помогу тебе?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_07_00");	//Хочешь, я помогу тебе?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_10_00");	//Хочешь, я помогу тебе?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_14_00");	//Хочешь, я помогу тебе?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_16_00");	//Хочешь, я помогу тебе?
	};
	if (C_HeroIs_Talbin())	{
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_01");	//Нет. Я не хочу закапывать еще и твой труп. И тем более не хочу, чтобы нас закопали вместе.
	}
	else	{
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_02");	//Ты? Поможешь напасть на орков?
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_03");	//Не самая удачная шутка.
	};
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"Да я этих орков одной левой...",DIA_Grimbald_ICanHelp_EasyKillOrc);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"Я серьезно.",DIA_Grimbald_ICanHelp_Seriosly);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"Да, ты прав.",DIA_Grimbald_ICanHelp_UAreRight);
};
func void DIA_Grimbald_ICanHelp_EasyKillOrc()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_03_00");	//Да я этих орков одной левой... Раскидаю и сверху прихлопну!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_07_00");	//Да я этих орков одной левой... Если в ней будет арбалет, конечно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_10_00");	//Да я этих орков... Я еще не забыл свой коронный хук с левой!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_14_00");	//Да я этих орков... Раскидаю и сверху прихлопну!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_16_00");	//Да я этих орков одной левой... Проще пареной репы.
	};
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_01");	//Ты?..
	Mdl_StartFaceAni(self,"T_HURT",1.0,1);
	AI_PointAtNpc(self,other);
	AI_Wait(self,1.2);
	Mdl_StartFaceAni(self,"S_FRIENDLY",1.0,1);
	AI_StopPointAt(self);
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_02");	//ПХА-ХА-ХААА!!!
	AI_Wait(self,0.8);
	AI_StopPointAt(self);
	B_GivePlayerXP(XP_GrimbaldOrcs_MakeLaugh);
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_03");	//Ну, насмешил!
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_04");	//Ну, насмешила!
	};
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_05");	//(вытирая слезы) Спасибо, а то я совсем скис.
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_06");	//Хватит уже тут сидеть. Пойду лучше в лес на другой стороне острова.
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_07");	//Э-эх. А лук-то мой у орков остался. Славный был лук, жаль.
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	MIS_GrimbaldOrcs_FeelBetter = TRUE;
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_GotIdea;
};
func void DIA_Grimbald_ICanHelp_UAreRight()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_03_00");	//Да, ты прав.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_07_00");	//Да, ты прав.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_10_00");	//Да, ты прав.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_14_00");	//Да, ты прав.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_16_00");	//Да, ты прав.
	};
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_01");	//Конечно, прав. Орки - это не пара грибочков.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_03_02");	//Я просто хотел помочь.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_07_02");	//Я просто хотел помочь.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_10_02");	//Я просто хотел помочь.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_14_02");	//Я просто хотел помочь.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_16_02");	//Я просто хотела помочь.
	};
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_03");	//Спасибо, но я уже смирился, и с тем, что я теперь один, и с тем, что все наши пожитки достались оркам.
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_04");	//Лук мой жаль, хороший был... Почти как еще одного товарища потерял.
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_GotIdea;
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
};
func void DIA_Grimbald_ICanHelp_Seriosly()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_00");	//Я серьезно. Я смогу помочь.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_00");	//Я вообще-то серьезно.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_00");	//Я говорю серьезно. Я еще не настолько стар.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_00");	//Я говорю серьезно. Я смогу помочь.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_00");	//Я серьезно. Я не такая уж слабая.
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_01");	//Я тоже. Но это ОРКИ. Не пара волков или падальщиков.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_02");	//Что мне сделать, чтобы доказать?..
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_02");	//Что мне сделать, чтобы доказать?..
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_02");	//Что мне сделать, чтобы доказать?...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_02");	//Что мне сделать, чтобы доказать?...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_02");	//Как мне доказать?..
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_03");	//Вот только не надо мне ничего доказывать.
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_04");	//Хватит с меня трупов трех моих друзей. Они были не самыми слабыми ребятами, знаешь ли.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_05");	//И все же...
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_05");	//И все же...
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_05");	//И все же...
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_05");	//И все же...
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_05");	//И все же...
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_06");	//Я сказал - нет.
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_Unbealief);
};


// ИДЕЯ ФИКС ==================================================
instance DIA_Grimbald_Idea(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 6;
	condition = DIA_Grimbald_Idea_cond;
	information = DIA_Grimbald_Idea_Info;
	important = TRUE;
};
func int DIA_Grimbald_Idea_cond()
{
	if ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_GotIdea)
		&& (Npc_IsInState(self,ZS_Talk))
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Idea_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Idea_07_00");	//Подожди минутку!
	AI_Output(self,other,"DIA_Grimbald_Idea_07_01");	//У меня появилась одна идея...
	AI_Output(self,other,"DIA_Grimbald_Idea_07_02");	//Для того, чтобы забрать лук, не обязательно драться с орками. Нужно их только отвлечь.
	AI_Output(self,other,"DIA_Grimbald_Idea_07_03");	//Если они уйдут со стоянки хотя бы минут на пять, мне этого хватит.
	Info_ClearChoices(DIA_Grimbald_Idea);
	Info_AddChoice(DIA_Grimbald_Idea,"Так какой план?",DIA_Grimbald_Idea_Plan);
};
func void DIA_Grimbald_Idea_Plan()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_03_00");	//Так какой план?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_07_00");	//Так какой план?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_10_00");	//Так какой план?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_14_00");	//Так какой план?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_16_00");	//Так какой план?
	};
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_01");	//Сейчас там осталось трое орков. Заметив тебя, они наверняка бросятся в атаку.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_02");	//Не дерись - это чистое самоубийство. Просто заставь их гнаться за тобой и уведи подальше.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_03");	//А я в это время сбегаю за луком.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_04");	//Я понимаю, это опасно, но лучших идей у меня нет.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_05");	//У меня есть немного травы глорха, но будет лучше, если ты достанешь зелье.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_06");	//Скажи, если будешь готов.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_06a");	//Скажи, если будешь готова.
	};
		B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_Plan);
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Planned;
};
//-------------------------------------------------
instance DIA_Grimbald_RepeatPlan(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 7;
	condition = DIA_Grimbald_RepeatPlan_cond;
	information = DIA_Grimbald_RepeatPlan_Info;
	permanent = TRUE;
	description = "Напомни свой план.";
};
func int DIA_Grimbald_RepeatPlan_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned) || (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Ready))
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_RepeatPlan_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_03_00");	//Напомни свой план.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_07_00");	//Напомни свой план.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_10_00");	//Напомни свой план.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_14_00");	//Напомни свой план.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_16_00");	//Напомни свой план.
	};
	AI_Output(self,other,"DIA_Grimbald_RepeatPlan_07_01");	//Твоя задача - отвлечь орков. Заставь всех троих уйти достаточно далеко от стоянки.
	AI_Output(self,other,"DIA_Grimbald_RepeatPlan_07_02");	//В это время я сбегаю за луком. Мне потребуется минут пять.
};
//-------------------------------------------------
instance DIA_Grimbald_WhyMe(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 8;
	condition = DIA_Grimbald_WhyMe_cond;
	information = DIA_Grimbald_WhyMe_Info;
	description = "А почему я отвлекаю орков?";
};
func int DIA_Grimbald_WhyMe_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_WhyMe_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_WhyMe_03_00");	//А почему я отвлекаю орков?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_WhyMe_07_00");	//А почему я отвлекаю орков?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_WhyMe_10_00");	//А почему я отвлекаю орков?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_WhyMe_14_00");	//А почему я отвлекаю орков?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_WhyMe_16_00");	//А почему я отвлекаю орков?
	};
	AI_Output(self,other,"DIA_Grimbald_WhyMe_07_01");	//Ты не знаешь, где что лежит, и будешь долго возиться.
	AI_Output(self,other,"DIA_Grimbald_WhyMe_07_02");	//И я рискую ничуть не меньше. Если они вернутся слишком быстро...
};

// ПОЕХАЛИ! ==================================================
instance DIA_Grimbald_Ready(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 9;
	condition = DIA_Grimbald_Ready_cond;
	information = DIA_Grimbald_Ready_Info;
	description = "Я готов!";
};
func int DIA_Grimbald_Ready_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned)
		&& (MIS_GrimbaldOrcs_DeadCnt < 3)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grimbald_Ready.description = "Я готова!";
		};
		return TRUE;
	};
};
func void DIA_Grimbald_Ready_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Ready_03_00");	//Я готов!
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Ready_07_00");	//Я готов!
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Ready_10_00");	//Я готов!
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Ready_14_00");	//Я готов!
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Ready_16_00");	//Я готова!
	};
	AI_Output(self,other,"DIA_Grimbald_Ready_07_01");	//Хорошо. Возьми эту траву - пригодится.
	B_GiveInvItems(self,other,ItPl_Speed_Herb_01,2);
	AI_Output(self,other,"DIA_Grimbald_Ready_07_03");	//Я буду ждать у выхода из пещеры, и как только вы пройдете мимо, стрелой понесусь на стоянку.
	AI_Output(self,other,"DIA_Grimbald_Ready_07_04");	//После этого тебе нужно продержаться еще несколько минут, иначе я труп.
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Ready;
	Info_ClearChoices(DIA_Grimbald_Ready);
	Info_AddChoice(DIA_Grimbald_Ready,"Пошли!",DIA_Grimbald_Ready_Go);
};
func void DIA_Grimbald_Ready_Go()
{
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_DrawWeapon;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"READY");
};
// УСПЕХ! ==================================================
instance DIA_Grimbald_Success(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 10;
	condition = DIA_Grimbald_Success_cond;
	information = DIA_Grimbald_Success_Info;
	important = TRUE;
};
func int DIA_Grimbald_Success_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Return))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Success_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Success_07_00");	//Все получилось просто отлично! Я забрал свой лук и еще кое-что прихватил.
	AI_Output(self,other,"DIA_Grimbald_Success_07_01");	//Вот, возьми шкуру мракориса. И 100 золотых.
	//B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	//B_GiveInvItems(self,other,ItMi_Gold,100);
	ItemTrans_items[0] = ItAt_ShadowFur;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 100;
	B_ItemsTransaction(self,other);
	MobContainer_RemoveItem("CHEST_HUNTERS_BOW",ItAt_ShadowFur);
	MobContainer_RemoveItem("CHEST_HUNTERS_BOW",ItMi_Gold);
	AI_Output(self,other,"DIA_Grimbald_Success_07_02");	//Если бы ни ты, я бы все еще сходил с ума в этой пещере.
	AI_Output(self,other,"DIA_Grimbald_Success_07_03");	//Пора убираться отсюда. Пойду в Восточный лес.
	DIA_Grimbald_Success_GoEast();
	MIS_GrimbaldOrcs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_Bow);
	B_GivePlayerXP(XP_GrimbaldOrcs_OrcsGone);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_DrawWeapon;
	self.npcType = NPCTYPE_FRIEND;
};



// КАК ТЫ? ==================================================
instance DIA_Grimbald_MR_Perm(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 20;
	condition = DIA_NoCond_cond;
	information = DIA_Grimbald_MR_Perm_Info;
	description = "Как ты?";
	permanent = TRUE;
};
func void DIA_Grimbald_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_03_00");	//Как ты?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_07_00");	//Как ты?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_10_00");	//Как ты?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_14_00");	//Как ты?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_16_00");	//Как ты?
	};
	if ((!MIS_GrimbaldOrcs_FeelBetter) && (MIS_GrimbaldOrcs != LOG_SUCCESS))	{
		AI_Output(self,other,"DIA_Grimbald_MR_Perm_07_01");	//А ты как думаешь? Паршивей некуда.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_MR_Perm_07_02");	//Немного лучше.
	};
};


// ОБУЧЕНИЕ ==================================================
instance DIA_Grimbald_PreTeach_Sneak(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 50;
	condition = DIA_Grimbald_PreTeach_Sneak_cond;
	information = DIA_Grimbald_PreTeach_Sneak_Info;
	description = "Ты можешь научить меня красться?";
};
func int DIA_Grimbald_PreTeach_Sneak_cond()
{
	if (Hero_CanSneak == 0)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_PreTeach_Sneak_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_03_00");	//Ты можешь научить меня красться?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_10_00");	//Ты можешь научить меня красться?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_14_00");	//Ты можешь научить меня красться?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_16_00");	//Ты можешь научить меня красться?
	};
	AI_Output(self,other,"DIA_Grimbald_PreTeach_Sneak_07_01");	//Думаю, да.
	AI_Output(self,other,"DIA_Grimbald_PreTeach_Sneak_07_02");	//Но не бесплатно. Я сейчас не могу себе позволить лишнюю щедрость.	
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Grimbald);
};
//----------------------------------------------
instance DIA_Grimbald_Teach_Sneak(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 51;
	condition = DIA_Grimbald_Teach_Sneak_cond;
	information = DIA_Grimbald_Teach_Sneak_Info;
	description = "Научи меня красться. (200 зол.)";
	permanent = TRUE;
};
func int DIA_Grimbald_Teach_Sneak_cond()
{
	if ((Hero_CanSneak == 0) && Npc_KnowsInfo(other,DIA_Grimbald_PreTeach_Sneak))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Teach_Sneak_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_03_00");	//Научи меня красться. 
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_10_00");	//Научи меня красться. 
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_14_00");	//Научи меня красться. 
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_16_00");	//Научи меня красться. 
	};
	if (B_GiveInvItems(other,self,ItMi_Gold,200))	{
		Hero_CanSneak = TRUE;
		AI_SetWalkmode(self,NPC_SNEAK);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_01");	//Смотри внимательно.
		AI_GotoNpc(self,other);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_02");	//Главное - правильная поза. Наступай только на подушечки ног, как дикий зверь.
		AI_SetWalkmode(self,NPC_WALK);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_03");	//И внимательно смотри под ноги. В тишине хруст самого маленького сучка звучит как горный обвал.
		//в платье красться не получится
		var C_ITEM armor; armor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem(armor,ITAR_BauBabe_L) || Hlp_IsItem(armor,ITAR_BauBabe_M)
			|| Hlp_IsItem(armor,ITAR_VlkBabe_L) || Hlp_IsItem(armor,ITAR_VlkBabe_M) || Hlp_IsItem(armor,ITAR_VlkBabe_H))
		{
			AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_04");	//Правда, я не представляю, как ты будешь красться в этом платье.
			AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_05");	//Сходи к Маттео, торговцу в городе. Возможно, у него найдется что-то более подходящее.
			Npc_SetTalentSkill(other,NPC_TALENT_SNEAK,0);
		}
		else	// а без платья норм
		{
			Npc_SetTalentSkill(other,NPC_TALENT_SNEAK,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_NoMoney");	//Сначала деньги.
	};
};

// БАЙКИ ОХОТНИКОВ ====================================
// Про говорящую гарпию
//=====================================================
instance DIA_Grimbald_TellStory(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 40;
	condition = DIA_Grimbald_TellStory_Cond;
	information = DIA_Grimbald_TellStory_Info;
	description = "Знаешь какую-нибудь байку?";
	permanent = TRUE;
};
func int DIA_Grimbald_TellStory_Cond()
{
	if (!DIA_Grimbald_TellTales)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_TellStory_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_TellStory_03_00");	//Знаешь какую-нибудь байку?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_TellStory_07_00");	//Знаешь какую-нибудь байку?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_TellStory_10_00");	//Знаешь какую-нибудь байку?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_TellStory_14_00");	//Знаешь какую-нибудь байку?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_TellStory_16_00");	//Знаешь какую-нибудь байку?
	};
	if ((!MIS_GrimbaldOrcs_FeelBetter) && (MIS_GrimbaldOrcs != LOG_SUCCESS))	{
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_01");	//Мне сейчас не до баек!
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_02");	//Могу рассказать про говорящую гарпию.
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Grimbald_TellStory_03_03");	//Про говорящую?
			AI_Output(other,self,"DIA_Grimbald_TellStory_03_04");	//Я видал только чучело гарпии в таверне Орлана. Но оно уж точно говорить не может.
		} else if (hero.voice == 7)	{		//Талбин
			AI_Output(other,self,"DIA_Grimbald_TellStory_07_03");	//Про говорящую?
			AI_Output(other,self,"DIA_Grimbald_TellStory_07_04");	//Видал я гарпий, но они только орать умели дурным голосом.
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Grimbald_TellStory_10_03");	//Про говорящую?
			AI_Output(other,self,"DIA_Grimbald_TellStory_10_04");	//А я думал, что мозгов у гарпий не больше, чем у курицы. Куда там разговаривать.
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Grimbald_TellStory_14_03");	//Про говорящую?
			AI_Output(other,self,"DIA_Grimbald_TellStory_14_04");	//Я видал только чучело гарпии в таверне Орлана. Но оно уж точно говорить не может.
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Grimbald_TellStory_16_03");	//Про говорящую?
			AI_Output(other,self,"DIA_Grimbald_TellStory_16_04");	//Я видела только чучело гарпии в таверне Орлана. А что, живые гарпии немые?
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_05");	//Нет, визжать они могут так, что уши закладывает. Но сам я ни разу не слышал, чтобы они произносили что-то членораздельное.
		};
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_06");	//А та гарпия, о которой я веду речь, говорить умела, совсем как человек.
		DIA_Grimbald_TellTales = TRUE;
	};
};
//--------------------------------------------
instance DIA_Grimbald_Tell_TalkingHarpy(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 41;
	condition = DIA_Grimbald_Tell_TalkingHarpy_Cond;
	information = DIA_Grimbald_Tell_TalkingHarpy_Info;
	description = "Расскажи про говорящую гарпию.";
	permanent = TRUE;
};
func int DIA_Grimbald_Tell_TalkingHarpy_Cond()
{
	if (DIA_Grimbald_TellTales)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Tell_TalkingHarpy_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_00");	//Расскажи про говорящую гарпию.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_00");	//Расскажи про говорящую гарпию.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_00");	//Расскажи про говорящую гарпию.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_00");	//Расскажи про говорящую гарпию.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_00");	//Расскажи про говорящую гарпию.
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_01");	//Дело было так. Один охотник, чтобы поставлять горожанам из верхнего квартала свежайшее мясо, ловил зверей живьем, в специальные ловушки.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_02");	//Богатые господа любят вкусно пожрать, так что он неплохо зарабатывал.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_03");	//Однажды с утра охотник пошел обходить свои ловушки, и в одной из них вместо кабана или кротокрыса нашел гарпию.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_04");	//С виду самая обычная - страшная клыкастая морда, длинные когти и ком вонючих перьев.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_05");	//Но как только охотник подошел к клетке, гарпия заговорила с ним по-человечески.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_06");	//И что она сказала?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_06");	//И что она сказала?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_06");	//И что она сказала?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_06");	//И что она сказала?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_06");	//И что она сказала?
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_07");	//Просила не убивать ее, конечно, и отпустить на свободу.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_08");	//Охотник сначала не соглашался. Он решил, что если показывать говорящую гарпию зевакам на рыночной площади, то можно заработать даже больше, чем с продажи мяса. 
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_09");	//Но гарпия сказала, что раньше жила у очень сильного мага, который и научил ее говорить.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_10");	//И что если охотник даст ей свободу, то она выполнит три любых его желания. 
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_11");	//И как, выполнила?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_11");	//И как, выполнила?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_11");	//И как, выполнила?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_11");	//И как, выполнила?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_11");	//И как, выполнила?
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_12");	//Обманула, стерва! Как только охотник открыл ловушку, гарпия сразу улетела, и больше он ее не видел.
	if (!Tale_SpeakingHarpy_Once)	{
		Tale_SpeakingHarpy_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
