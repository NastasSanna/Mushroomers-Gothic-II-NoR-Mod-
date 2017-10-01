
instance DIA_Engrom_EXIT(DIA_Proto_End)
{
	npc = OUT_1200_Engrom;
};

/////////////////////////////////////// ТАЛБИН /////////////////////////////////////////////

//===================================================
instance DIA_Engrom_Start_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 0;
	condition = DIA_Engrom_Start_Talbin_Cond;
	information = DIA_Engrom_Start_Talbin_Info;
	important = TRUE;
};
func int DIA_Engrom_Start_Talbin_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_Start_Talbin_Info()
{
	Engrom_ArmHurt_Day = Wld_GetDay() + 4;
	Engrom_ArmHurt_Hour = 18;
	var int x; 	x=0;
	START_DIA_Finished = TRUE;
	AI_GotoNpc(other,self);
	AI_StandUp(self);
	AI_TurnToNpc(self,other);
	AI_TurnToNpc(other,self);
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_00");	//Угадай, на кого мы охотимся сегодня?
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_01");	//На кого?
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_02");	//На грибы!
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_03");	//Ээээ... не понял. Это шутка такая?
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_04");	//Да нет, я серьезно. Алхимик из города, Константино, видать, захотел грибочков, да так сильно, что объявил конкурс по их сбору.
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_05");	//Он целую неделю будет щедро платить всем, кто принесет ему грибы, а в конце выдаст победителю приз!
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_06");	//Да? Ну тогда пойдем...
	Info_ClearChoices(DIA_Engrom_Start_Talbin);
	Info_AddChoice(DIA_Engrom_Start_Talbin,"Пошли!",DIA_Engrom_Start_Talbin_Go);
	Info_AddChoice(DIA_Engrom_Start_Talbin,"Знаешь, давай я в этот раз один...",DIA_Engrom_Start_Talbin_Stay);
};
func void DIA_Engrom_Start_Talbin_Go()
{
	Engrom_Follows = TRUE;
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_Go_07_00");	//Пошли! Заодно и поохотимся. Убьем двух падальщиков одним выстрелом.
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Go_12_01");	//Ладно. Хотя мое плечо все еще ноет. Не знаю, смогу ли я нормально стрелять.
	B_StartOtherRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};
func void DIA_Engrom_Start_Talbin_Stay()
{
	Engrom_Follows = FALSE;
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_Stay_07_00");	//Знаешь, давай я в этот раз один... Думаю, тебе лучше передохнуть после нашей прошлой охоты. Как, кстати, твое плечо?
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Stay_12_01");	//Уже лучше. Но стрелять все равно неудобно. Думаю, через неделю как раз пройдет.
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Stay_12_02");	//Но если что, зови. Когда я отказывался от охоты с тобой?
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_FollowMe_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 1;
	condition = DIA_Engrom_FollowMe_Talbin_Cond;
	information = DIA_Engrom_FollowMe_Talbin_Info;
	description = "Пойдем со мной.";
};
func int DIA_Engrom_FollowMe_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == FALSE))	{
		return TRUE;
	};
};
func void DIA_Engrom_FollowMe_Talbin_Info()
{
	Engrom_Follows = TRUE;
	AI_Output(other,self,"DIA_Engrom_FollowMe_Talbin_07_00");	//Пойдем со мной.
	if (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) <= Engrom_ArmHurt_Day)	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_01");	//Иду.
	}
	else if (Engrom_ArmHurt == TRUE)	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_02");	//Мое плечо все еще болит.
		Engrom_ArmHurt = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_03");	//Что-то у меня плечо опять разболелось... Я лучше останусь.
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_04");	//Все равно не смогу целиться нормально.
		Engrom_ArmHurt = TRUE;
	};
	B_StartOtherRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_ArmHurt_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 3;
	condition = DIA_Engrom_ArmHurt_Talbin_Cond;
	information = DIA_Engrom_ArmHurt_Talbin_Info;
	important = TRUE;
};
func int DIA_Engrom_ArmHurt_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == TRUE) && (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) >= Engrom_ArmHurt_Day))	{
		return TRUE;
	};
};
func void DIA_Engrom_ArmHurt_Talbin_Info()
{
	Engrom_Follows = FALSE;
	Engrom_ArmHurt = TRUE;
	Mdl_StartFaceAni(self,"T_HURT",1,5);
	AI_Output(self,other,"DIA_Engrom_ArmHurt_Talbin_12_01");	//Погоди! Мое плечо... Ух, зараза, как больно!
	AI_Output(self,other,"DIA_Engrom_ArmHurt_Talbin_12_02");	//Я лучше вернусь в лагерь.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_Talbin_Perm(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 4;
	condition = DIA_Engrom_Talbin_Perm_Cond;
	information = DIA_Engrom_Talbin_Perm_Info;
	description = "Как твое плечо?";
	permanent = TRUE;
};
func int DIA_Engrom_Talbin_Perm_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_Talbin_Perm_Info()
{
	AI_Output(other,self,"DIA_Engrom_Talbin_Perm_07_03");	//Как твое плечо?
	if (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) < Engrom_ArmHurt_Day)	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_01");	//Терпимо.
	}
	else if (Engrom_ArmHurt == TRUE)	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_02");	//Болит, зараза.
	}
	else	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_03");	//Опять разболелось. Даже ложку держать больно, не то что арбалет.
		Engrom_ArmHurt = TRUE;
	};
};

//===================================================
instance DIA_Engrom_GoHome_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 2;
	condition = DIA_Engrom_GoHome_Talbin_Cond;
	information = DIA_Engrom_GoHome_Talbin_Info;
	description = "Можешь возвращаться в лагерь.";
};
func int DIA_Engrom_GoHome_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == TRUE))	{
		return TRUE;
	};
};
func void DIA_Engrom_GoHome_Talbin_Info()
{
	Engrom_Follows = FALSE;
		AI_Output(other,self,"DIA_Engrom_GoHome_Talbin_07_00");	//Можешь возвращаться в лагерь.
	AI_Output(self,other,"DIA_Engrom_GoHome_Talbin_12_01");	//Хорошо. Жду тебя там.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_Talbin_Final(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 10;
	condition = DIA_Engrom_Talbin_Final_Condition;
	information = DIA_Engrom_Talbin_Final_Info;
	description = "Ну что, мы победили!";
};
func int DIA_Engrom_Talbin_Final_Condition()
{
	if ((C_HeroIs_Talbin()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Engrom_Talbin_Final.description = "Проиграли...";
		};
		return TRUE;
	};
};
func void DIA_Engrom_Talbin_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_WON_03_00");	//Ну что, мы победили!
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_WON_01");	//Шутишь? Ты-то - и лучший грибник Хориниса? Ха!
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_WON_02");	//И что там за приз?
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_WON_03_03");	//Да книжка про грибы... Константино совсем на них свихнулся.
	}
	else	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_LOST_03_01");	//Проиграли...
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_LOST_03_02");	//Нашел из-за чего киснуть! Когда это ты из охотников стал грибником?
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_LOST_03_03");	//Да не кисну я! Просто охота было поглядеть на приз.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_03_00");	//Зато золотишка поднакопили.
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_01");	//А вот это славно.
	};
};


///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Engrom_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1200_Engrom;			nr = 20;
	condition = DIA_Engrom_Elena_ShadowFur_cond;
	information = DIA_Engrom_Elena_ShadowFur_info;
	description = "Я бы хотела купить шкуру мракориса.";
};
func int DIA_Engrom_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Engrom_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Engrom_Elena_ShadowFur_16_00");	//Я бы хотела купить шкуру мракориса.
	AI_Output(self,other,"DIA_Engrom_Elena_ShadowFur_12_01");	//Увы, сейчас такой нет.
	AI_Output(self,other,"DIA_Engrom_Elena_ShadowFur_12_02");	//Талбин сейчас охотится только на грибы, а у меня плечо болит, зараза.
};


/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////
var int DIA_Engrom_HowAU_Others_Once;
instance DIA_Engrom_HowAU_Others(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 10;
	condition = DIA_Engrom_HowAU_Others_Cond;
	information = DIA_Engrom_HowAU_Others_Info;
	description = "Как дела?";
	permanent = TRUE;
};
func int DIA_Engrom_HowAU_Others_Cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_HowAU_Others_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_03_00");	//Как дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_10_00");	//Как дела?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_14_00");	//Как дела?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_16_00");	//Как дела?
	};
	if (DIA_Engrom_HowAU_Others_Once == FALSE)	{
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_01");	//Довольно паршиво. Я повредил руку на прошлой охоте и не могу толком стрелять.
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_02");	//А мой приятель, Талбин, вместо охоты занялся сбором грибов.
		if (Npc_GetDistToNpc(self,CMP_Talbin) > PERC_DIST_DIALOG)	{
			if ((Npc_GetDistToNpc(self,CMP_Talbin) < PERC_DIST_ACTIVE_MAX) && !C_BodyStateContains(self,BS_SIT))	{
				AI_PlayAni(self,"T_SEARCH");
			};
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_03");	//Я сначала думал, он перебрал или умом тронулся. Прибежал из таверны с горящими глазами и заявил, что идет охотиться на грибы.
		};
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_04");	//Похоже, он серьезно намерен выиграть конкурс.
		DIA_Engrom_HowAU_Others_Once = TRUE;
	}
	else	{
		if (Hlp_Random(2) == 0)	{
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_05");	//Все так же.
		}
		else	{
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_06");	//Ничего нового.
		};
	};
};

//---------------------------------------------------
instance DIA_Engrom_Others_AboutArm(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 11;
	condition = DIA_Engrom_Others_AboutArm_Cond;
	information = DIA_Engrom_Others_AboutArm_Info;
	description = "Что случилось с твоей рукой?";
};
func int DIA_Engrom_Others_AboutArm_Cond()
{
	if (!C_HeroIs_Talbin() && DIA_Engrom_HowAU_Others_Once)	{
		return TRUE;
	};
};
func void DIA_Engrom_Others_AboutArm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_03_00");	//Что случилось с твоей рукой?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_10_00");	//Что случилось с твоей рукой?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_14_00");	//Что случилось с твоей рукой?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_16_00");	//Что случилось с твоей рукой?
	};
	AI_Output(self,other,"DIA_Engrom_Others_AboutArm_12_01");	//Упал неудачно. Вообще, было бы смешно, если бы не было так больно.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_03_02");	//А что смешного?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_10_02");	//А что смешного?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_14_02");	//А что смешного?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_16_02");	//А что смешного?
	};
	AI_Output(self,other,"DIA_Engrom_Others_AboutArm_12_03");	//Да длинная история.
	DIA_Engrom_TellTales = TRUE;
};

//---------------------------------------------------
instance DIA_Engrom_Others_TellTale_DrunkKeil(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 12;
	condition = DIA_Engrom_Others_TellTale_DrunkKeil_Cond;
	information = DIA_Engrom_Others_TellTale_DrunkKeil_Info;
	description = "Расскажи, что с тобой приключилось.";
	permanent = TRUE;
};
func int DIA_Engrom_Others_TellTale_DrunkKeil_Cond()
{
	if (!C_HeroIs_Talbin() && DIA_Engrom_TellTales)	{
		return TRUE;
	};
};
func void DIA_Engrom_Others_TellTale_DrunkKeil_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_03_00");	//Расскажи, что с тобой приключилось.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_10_00");	//Расскажи, что с тобой приключилось.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_14_00");	//Расскажи, что с тобой приключилось.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_16_00");	//Расскажи, что с тобой приключилось.
	};
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_01");	//Дело было так. Фермер Акил попросил перебить кабанов, разоряющих его поле.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_02");	//Мы с Талбином устроили возле поля небольшой лабаз и стали их прикармливать, чтобы наверняка.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_03");	//Акил выделил для этого целый воз подгнивших овощей и ботвы. Воняла эта куча как смертный грех, но кабанам явно понравилось в ней рыться.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_04");	//Ночью мы затаились на лабазе. Долго ждать не пришлось - из леса вышел довольно крупный секач и стал уплетать овощи.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_05");	//Надо сказать, что зрение у кабанов не очень, а вот слух отличный, сидеть надо очень тихо.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_06");	//И тут, как назло, мне жутко захотелось чихнуть. Это была просто пытка! У меня аж глаза заслезились.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_07");	//Чую - держаться больше не смогу. Тогда я, как смог, прицелился в кабана и шмальнул почти наудачу. И тут же оглушительно чихнул.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_08");	//Кабан от моего чиха не сбежал и даже не пошевелился. Я не мог поверить в удачу - уложить кабана с одного выстрела, даже почти не прицелившись!
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_09");	//Ну, я не удержался и пошел посмотреть поближе. И надо же было мне подскользнуться на какой-то свекле, выкатившейся из кучи!
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_10");	//Я шлепнулся прямо перед рылом кабана. И вдруг этот “мертвец“ завизжал, взбрыкнул и вскочил на ноги! Ну, думаю, - задерет.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_11");	//А он вскочил и стоит, таращится на меня. И как-то странно стоит, враскоряку и пошатываясь. И тут я заметил, что от кучи овощей разит брагой.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_12");	//Видать, они на жаре забродили, а он их нажрался и захмелел. И вовсе не упал от моего выстрела, а просто уснул.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_13");	//Тебе приходилось смотреть прямо на пьяного кабана с расстояния вытянутой руки, лежа в компостной куче? Это были самые ужасные секунды в моей жизни.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_14");	//Тут Талбин начал что-то кричать, чтобы привлечь его внимание. Окосевший хряк какими-то прыжками ломанулся к лабазу и стал выламывать клыками жерди.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_15");	//Я попытался подняться, но мое левое плечо пронзила резкая боль. Встать я кое-как сумел, а вот взвести арбалет - нет.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_16");	//В это время Талбина на вышке шатало как на мачте в бурю. Он тоже никак не мог выстрелить. Кабан уже подломил одну из опор, еще чуток - и лабаз завалился бы.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_17");	//Тут я, наверное, ненадолго сошел с ума. Потому что принялся орать и кидать в кабана свеклой. От такой наглости кабан вконец растерялся и дал стрекача.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_18");	//Талбин выстрелил пару раз ему вслед, но не попал. Так он и ушел пьяными зигзагами в чащу. И больше на поле не появлялся.
	if (!Tale_DrunkKeil_Once)	{
		Tale_DrunkKeil_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

