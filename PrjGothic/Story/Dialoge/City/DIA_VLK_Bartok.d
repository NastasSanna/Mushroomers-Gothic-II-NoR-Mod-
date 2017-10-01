
instance DIA_Bartok_EXIT(DIA_Proto_End)
{
	npc = VLK_440_Bartok;
};

//=====================================================
instance DIA_Bartok_Start(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 1;
	condition = DIA_Bartok_Start_cond;
	information = DIA_Bartok_Start_info;
	description = "Чем занимаешься?";
	permanent = TRUE;
};
func int DIA_Bartok_Start_cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Bartok_Start_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_Start_03_00");	//Чем занимаешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_Start_07_00");	//Чем занимаешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_Start_10_00");	//Чем занимаешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_Start_14_00");	//Чем занимаешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_Start_16_00");	//Чем занимаешься?
	};
	if (Wld_IsTime(7,0,20,15))	{
		AI_Output(self,other,"DIA_Bartok_Start_04_01");	//Охочусь. Я работаю на торговца Боспера.
		AI_Output(self,other,"DIA_Bartok_Start_04_02");	//Моя работа - доставать шкуры для него.
	}
	else	{
		AI_Output(self,other,"DIA_Bartok_Start_04_03");	//В данный момент - расслабляюсь.
	};
};

//=====================================================
instance DIA_Bartok_Competition(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Bartok_Competition_info;
	description = "Ты участвуешь в конкурсе Константино?";
};

func void DIA_Bartok_Competition_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_Competition_03_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_Competition_07_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_Competition_10_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_Competition_14_00");	//Ты участвуешь в конкурсе Константино?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_Competition_16_00");	//Ты участвуешь в конкурсе Константино?
	};
	AI_Output(self,other,"DIA_Bartok_Competition_04_01");	//Нет. Боспер будет недоволен, если я стану работать на кого-то другого.
	AI_Output(self,other,"DIA_Bartok_Competition_04_02");	//Да я и не особо разбираюсь в грибах.
};

//=====================================================
instance DIA_Bartok_Alone(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 3;
	condition = DIA_Bartok_Alone_cond;
	information = DIA_Bartok_Alone_info;
	description = "Ты тут один?";
};
func int DIA_Bartok_Alone_cond()
{
	if (C_HeroIs_Talbin() || Wld_IsTime(7,0,19,30) && !Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		if (C_HeroIs_Talbin())	{
			DIA_Bartok_Alone.description = "А где Трокар?";
		};
		return TRUE;
	};
};
func void DIA_Bartok_Alone_info()
{
	if (C_HeroIs_Talbin())	{
			AI_Output(other,self,"DIA_Bartok_Talbin_Alone_07_00");	//А где Трокар?
			AI_Output(other,self,"DIA_Bartok_Talbin_Alone_07_01");	//Я вас давненько по отдельности не видел.
		AI_Output(self,other,"DIA_Bartok_Talbin_Alone_04_02");	//Ну мы же не сиамские близнецы. Разошлись на время.
	}
	else	{
		if (hero.voice == 3)	{			//Одо/Руперт
			AI_Output(other,self,"DIA_Bartok_Alone_03_00");	//Ты тут один?
		} else if (hero.voice == 10)	{	//Эрол
			AI_Output(other,self,"DIA_Bartok_Alone_10_00");	//Ты тут один?
		} else if (hero.voice == 14)	{	//Тилл
			AI_Output(other,self,"DIA_Bartok_Alone_14_00");	//Ты тут один?
		} else	{							//Елена/Сара
			AI_Output(other,self,"DIA_Bartok_Alone_16_00");	//Ты тут один?
		};
		AI_Output(self,other,"DIA_Bartok_Alone_04_01");	//Да. Обычно мы охотимся с моим другом Трокаром. Но сейчас мы на время разошлись.
	};
	AI_Output(self,other,"DIA_Bartok_Alone_04_02");	//Я его уже несколько дней не видел. Понятия не имею, куда он отправился.
	if (C_HeroIs_Sarah() || C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Bartok_Alone_04_03");	//Если вдруг встретишь его, будь добра, скажи, чтобы зашел в Мертвую гарпию. Он там у Орлана на стойке нож забыл.
	}
	else if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Bartok_Alone_04_04");	//Если вдруг встретите его, передайте, что он в Мертвой гарпии нож забыл.
			AI_Output(other,self,"DIA_Bartok_Alone_10_05");	//А, так это его нож у Орлана третий день на стойке валяется.
	} 
	else 	{
		AI_Output(self,other,"DIA_Bartok_Alone_04_06");	//Если вдруг встретишь его, скажи, чтобы двигал к Мертвой гарпии. Он у Орлана на стойке нож забыл.
	};
};

//=====================================================
instance DIA_Bartok_MetTrocar(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 4;
	condition = DIA_Bartok_MetTrocar_cond;
	information = DIA_Bartok_MetTrocar_info;
	important = TRUE;
};
func int DIA_Bartok_MetTrocar_cond()
{
	if (Npc_KnowsInfo(other,DIA_Trocar_HogKilled) && Npc_KnowsInfo(other,DIA_Bartok_Start))	{
		return TRUE;
	};
};
func void DIA_Bartok_MetTrocar_info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Bartok_MetTrocar_04_01m");	//Спасибо, что нашел этого упрямого барана.
	}
	else	{
		AI_Output(self,other,"DIA_Bartok_MetTrocar_04_01f");	//Спасибо, что нашла этого упрямого барана.
	};
	AI_Output(self,other,"DIA_Bartok_MetTrocar_04_02");	//Три дня гоняться за одним кабаном где-то в глухомани! Уму непостижимо!
	B_GivePlayerXP(XP_Ambient);
};

// БАЙКИ ОХОТНИКОВ ====================================
// Про проклятого охотника
//=====================================================
instance DIA_Bartok_WhyDontHuntFarAway(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 10;
	condition = DIA_Bartok_WhyDontHuntFarAway_cond;
	information = DIA_Bartok_WhyDontHuntFarAway_info;
	description = "Почему ты не уходишь далеко от города?";
};
func int DIA_Bartok_WhyDontHuntFarAway_cond()
{
	if (DIA_Trocar_TellTales && Npc_KnowsInfo(other,DIA_Bartok_Start))	{
		return TRUE;
	};
};
func void DIA_Bartok_WhyDontHuntFarAway_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_00");	//Почему ты не уходишь далеко от города?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_00");	//Почему ты не уходишь далеко от города?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_00");	//Почему ты не уходишь далеко от города?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_00");	//Почему ты не уходишь далеко от города?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_00");	//Почему ты не уходишь далеко от города?
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_01");	//Что, Трокар опять травил свои байки и жаловался, что я не хожу с ним искать приключений на пятую точку?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_02");	//Ну, вроде того.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_02");	//Ну, вроде того.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_02");	//Ну, вроде того.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_02");	//Ну, вроде того.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_02");	//Можно и так сказать.
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_03");	//Знаешь, я из всех этих историй сделал один вывод - лучше не совать в рот кусок, который не сможешь проглотить.
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_04");	//Иначе закончишь, как тот проклятый охотник. А я хочу умереть в своей постели, глубоким стариком.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_05");	//Что еще за проклятый охотник?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_05");	//Что еще за проклятый охотник?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_05");	//Что еще за проклятый охотник?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_05");	//Что еще за проклятый охотник?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_05");	//Что еще за проклятый охотник?
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_06");	//Неужели Трокар не рассказал тебе? Это единственная байка его деда, в которую действительно я верю.
	DIA_Bartok_TellTales = TRUE; 
};
//---------------------------------------
instance DIA_Bartok_Tell_CursedHunter(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 11;
	condition = DIA_Bartok_Tell_CursedHunter_cond;
	information = DIA_Bartok_Tell_CursedHunter_info;
	description = "Расскажи про проклятого охотника.";
	permanent = TRUE;
};
func int DIA_Bartok_Tell_CursedHunter_cond()
{
	if (DIA_Bartok_TellTales)	{
		return TRUE;
	};
};
func void DIA_Bartok_Tell_CursedHunter_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_03_00");	//Расскажи про проклятого охотника.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_07_00");	//Расскажи про проклятого охотника.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_10_00");	//Расскажи про проклятого охотника.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_14_00");	//Расскажи про проклятого охотника.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_16_00");	//Расскажи про проклятого охотника.
	};
	if (!Tale_CursedHunter_Once)	{
		AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_01");	//Ладно, хотя рассказчик из меня не очень.
	};
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_02");	//В общем, у Трокарова деда был приятель, Берт. Они часто охотились вместе, как мы с Трокаром.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_03");	//Но однажды Берт отправился на охоту один. Он выследил стаю волков и всех их перебил. Потом снял шкуры и направился в город.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_04");	//Он шел по мосту, ведущему от “Мертвой гарпии“ к ферме Акила. Вдруг он заметил волка, со всех лап несущегося по дороге под мостом.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_05");	//Берт выхватил лук, хорошенько прицелился и выпустил стрелу. Стрела прошла у волка между ребер, и он покатился по дороге.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_06");	//Берт побежал на нижнюю дорогу, но когда добежал, то вместо волка увидел молодого Мага Огня, у которого из бока торчала стрела.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_07");	//Маг испустил дух на руках у Берта, но перед этим успел проклясть его. Сказал, что не будет ему удачи и что умрет Берт в страшной нищете.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_08");	//Берт сначала испугался, но со временем забыл о проклятии. Законы тогда были не такие строгие, и его не осудили.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_09");	//Охоту он забросил и стал купцом. Стал продавать вино, табак, пряности, а еще ковры из Варанта. Разбогател страшно.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_10");	//Сам ходил на большом барке, и еще владел двумя люгерами. Но однажды на его барк напали пираты.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_11");	//Барк очень вместителен, и у него хорошая огневая мощь, но маневренность плохая. Пираты смогли подойти вплотную и взяли его на абордаж.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_12");	//Самого Берта раздели буквально до нитки и бросили на необитаемом острове. Там он и помер, нищим, как и пожелал проклявший его маг.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_13");	//Когда нашли его тело, на нем даже штанов не было. Вот к чему привела его жадность.
	if (!Tale_CursedHunter_Once)	{
		Tale_CursedHunter_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
