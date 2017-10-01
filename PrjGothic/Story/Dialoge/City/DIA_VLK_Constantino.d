
instance DIA_Constantino_EXIT(DIA_Proto_End)
{
	npc = VLK_417_Constantino;
};

//==============================================================================

var int GiveMRs2Constantino_MR;		//какой гриб сдаем? -1 - все
var int GiveMRs2Constantino_cnt;	//сколько? -1 - все
var int GiveMRs2Constantino_sum;	//сколько всего денег
var int GiveMRs2Constantino_XP;		//сколько всего опыта
const int MR_ConstantinoCommentAlways = TRUE;

// передать указанные грибы Константино
// возвращает кол-во, если грибы переданы, иначе FALSE - у ГГ нет такого гриба
func int _GiveMRs2Constantino_DoGive(var int MR_Index, var int itmInst)
{
	//его вообще надо сдавать?
	if ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Index))	{
		//сколько?
		var int cnt;	cnt = GiveMRs2Constantino_cnt;
		if (cnt < 0)	{
			cnt = Npc_HasItems(other,itmInst);
		};
		//отдать, если есть грибы
		if (cnt > 0)	{
			B_GiveInvItems(other, self, itmInst, cnt);
			//запомнить, сколько отдали
			MEM_WriteStatArr(MR_Counter, MR_Index, MEM_ReadStatArr(MR_Counter, MR_Index) + cnt); 	//MR_Counter[MR_Index] += cnt;
			GiveMRs2Constantino_sum += MEM_ReadStatArr(MR_Price, MR_Index) * cnt;	//GiveMRs2Constantino_sum += MR_Price[MR_Index] * cnt;
			return cnt;
		};
	};
	return FALSE;
};
// запись в журнал и доп. опыт при первой сдаче
func int _GiveMRs2Constantino_Log(var int MR_Index)
{
	//если еще не комментировали
	if (!MEM_ReadStatArr(MR_ConstantinoCommentOnce, MR_Index))	{
		//цена гриба
		var int price;	price = MEM_ReadStatArr(MR_Price, MR_Index);
		//строка записи со вставленной ценой
		var string entry;
		entry = MEM_ReadStatStringArr(TOPIC_ConstantinoMushrooms_Comment, MR_Index * 2);
		if (price > 0)	{
			entry = ConcatStrings(entry, IntToString(price));
			entry = ConcatStrings(entry, MEM_ReadStatStringArr(TOPIC_ConstantinoMushrooms_Comment, MR_Index * 2 + 1));
		};
		//в журнал
		B_LogEntry(TOPIC_ConstantinoMushrooms, entry);
		//опыт
		GiveMRs2Constantino_XP += price * XP_ConstantinoMushroom_Once;
		//запомнили, что комментировали
		MEM_WriteStatArr(MR_ConstantinoCommentOnce, MR_Index, TRUE);	//MR_ConstantinoCommentOnce[MR_Index] = TRUE;
		return TRUE;
	};
	return FALSE;
};
// выдать золото и XP после того, как все сдано
func void _GiveMRs2Constantino_Reward()
{
	//золото
	if (GiveMRs2Constantino_sum > 0)	{
		B_GiveGold(self,other, GiveMRs2Constantino_sum);
	};
	//опыт
	GiveMRs2Constantino_XP += GiveMRs2Constantino_sum;
	if (GiveMRs2Constantino_XP > 0)	{
		B_GivePlayerXP(GiveMRs2Constantino_XP);
	};
	//сбросить
	GiveMRs2Constantino_sum = 0;
	GiveMRs2Constantino_XP = 0;
};

//сдача каждого вида грибов
func int B_GiveMRs2Constantino_MR01()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_01, ItPl_Mushroom_01))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_01] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_01_10_00");	//Темные грибы. Отлично. Они очень полезные! 10 золотых за каждый.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_01))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_MR02()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_02, ItPl_Mushroom_02))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_02] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_02_10_00");	//Так, мясной гриб. Не слишком хорош, но и не бесполезен. 15 монет за штуку.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_02))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Piny()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Piny, ItMr_Piny))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Piny] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Piny_10_00");	//Сосновый гриб. Я найду ему применение. 5 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Piny))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Stone()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Stone, ItMr_Stone))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Stone] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Stone_10_00");	//А, каменка. По 4 золотых - более, чем достаточно.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Stone))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Red()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Red, ItMr_Red))	{
		//комментируем
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Red))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_00");	//Красный лесной гриб. Знаешь, почему он называется болтуном или пустозвоном?
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_01");	//Потому что яркий, а толку от него никакого... Пустышка. 
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_02");	//Но все же это гриб. 2 золотых, не больше.
			}
			//иначе - сдаем уже не в первый раз
			else if (MR_ConstantinoCommentAlways)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_03");	//За красного болтуна - 2 золотых, не больше.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_04");	//Яркий, а толку от него никакого... Пустышка. 
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_BrownOiler()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_BrownOiler, ItMr_BrownOiler))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_BrownOiler] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_BrownOiler_10_00");	//Еловый масляк. 8 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_BrownOiler))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Governor()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Governor, ItMr_Governor))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Governor] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Governor_10_00");	//Хех, губернаторский гриб, воротник и шляпа. 12 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Governor))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Sunrise()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Sunrise, ItMr_Sunrise))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Sunrise] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Sunrise_10_00");	//Желтый трубач, ты его наверняка знаешь как зорьник. 9 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Sunrise))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_LadysEar()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_LadysEar, ItMr_LadysEar))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_LadysEar] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_LadysEar_10_00");	//Дамские уши. Забавный гриб, но не слишком ценный. 4 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_LadysEar))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Keil()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Keil, ItMr_KeilSmall)
		 || Npc_HasItems(other,ItMr_KeilBig) && ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Keil)))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Keil] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Keil_10_00");	//Кабаньи грибы хороши, только пока молодые, за них я готов отдать 24 золотых. Но переросшие мне не нужны. 
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Keil))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Bottle()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Bottle, ItMr_Bottle))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Bottle] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Bottle_10_00");	//Бутылочник может пригодиться. 12 золотых за каждый.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Bottle))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Ivy()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Ivy, ItMr_Ivy))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Ivy] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Ivy_10_00");	//А, это плющевик. Его можно найти и в городе... Но не так-то легко. 11 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Ivy))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Trident()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Trident, ItMr_Trident))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Trident] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Trident_10_00");	//Кто-нибудь другой не заплатил бы тебе за трезубец ни монетки. Но я знаю пару рецептов... 14 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Trident))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Branch()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Branch, ItMr_Branch))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Branch] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Branch_10_00");	//Веточник в последнее время попадается все реже... 30 золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Branch))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_DragonTears()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_DragonTears, ItMr_DragonTears))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_DragonTears] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_DragonTears_10_00");	//Драконовы слезы! Давай сюда, только осторожно. 80 золотых за гроздь.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_DragonTears))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_NightSparkles()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_NightSparkles, ItMr_NightSparkles))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_NightSparkles] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_NightSparkles_10_00");	//Ночные искры. Осторожно, чтобы на них не попал свет! 60 золотых за горсть - справедливо.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_NightSparkles))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Violet()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Violet, ItMr_Violet))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Violet] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_00");	//Ох, фиолетовая поганка, гриб Белиара! Самый ядовитый, смертельно опасный.
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_01");	//Я заплачу за него 50 золотых. 
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_02");	//Только не думай, я не собираюсь никого отравить! Он мне нужен для исследований.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Violet))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Oyster()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Oyster, ItMr_Oyster))	{
		//комментируем
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Oyster))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_00");	//Ты удивляешь меня. Что это за гриб?
				if (hero.voice == 3)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_03_01");	//Он называется ракушечник. Правда, похож? И растет прямо на песке. 
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_03_02");	//Ты разве никогда не видел его на побережье?
				} else if (hero.voice == 7)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_07_01");	//Я не знаю, как он называется, но на берегу их полно. На ракушку похож.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_07_02");	//Неужто никогда не видел?
				} else if (hero.voice == 10)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_10_01");	//Это ракушечник. Эти грибы в изобилии растут на побережье.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_10_02");	//Неужели ты никогда их не видел?
				} else if (hero.voice == 14)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_14_01");	//Это ракушечник - потому что похож на ракушку и растет прямо на песке. 
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_14_02");	//На берегу их полно, неужели ниогда не видел?
				} else	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_16_01");	//Он похож на ракушку, поэтому так и называется - ракушечник. Растет прямо в море или на песке.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_16_02");	//Их там много, неужели ты никогда их не видел?
				};
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_03");	//Некогда мне по пляжам бродить.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_05");	//Я поищу его описание в книгах... Думаю, эта находка стоит 100 золотых.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_06");	//Но за сами грибы я заплачу по 10 золотых. Я не знаю, насколько они полезны.
				GiveMRs2Constantino_sum += 100;
			}
			//сдаем не в первый раз
			else if (MR_ConstantinoCommentAlways)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_07");	//10 золотых за ракушечник. Хоть я и не уверен, что это вообще гриб.
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_GoldPlate()
{
	var int cnt;	cnt = _GiveMRs2Constantino_DoGive(MR_GoldPlate, ItMr_GoldPlate);
	//если передали гриб
	if (cnt)	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_GoldPlate] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_00");	//Это же золотая чаша!
			if (cnt > 1)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_01");	//Да не одна.
			};
			AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_02");	//Такой гриб стоит сотни золотых.
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_GoldPlate))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Heart()
{
	//если передали гриб
	if (_GiveMRs2Constantino_DoGive(MR_Heart, ItMr_Heart))	{
		//комментируем
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Heart))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_00");	//А это что?! Сердце?! Гриб-сердце?
				if (hero.voice == 3)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_03_01");	//Я тоже такого никогда раньше не видел. На гриб-то не похож... Думал, ты скажешь, что это.
				} else if (hero.voice == 7)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_07_01");	//Что, даже ты не знаешь, что это за гриб? Мне он всего пару раз за всю жизнь попадался.
				} else if (hero.voice == 10)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_10_01");	//Тоже удивлен? Я первый раз вижу такую штуку, думал, ты знаешь, что это такое.
				} else if (hero.voice == 14)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_14_01");	//Ага, даже на гриб не похож. Я у тебя хотел спросить, что это за штука.
				} else	{
					if (C_HeroIs_Elena())	{
						AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_16_01");	//Что, даже ты не знаешь, что это за гриб? Мне он всего пару раз за всю жизнь попадался.
					}
					else	{
						AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_16_01b");	//Тоже испугался? Я первый раз увидела такую штуку, думала, ты знаешь, что это.
					};
				};
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_02");	//Я немедленно приступаю к его изучению. И я дам тебе... 
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_03");	//да, 250 золотых! Если вдруг найдешь еще, приноси обязательно.
			}
			//иначе - сдаем не в первый раз
			else if (MR_ConstantinoCommentAlways) {
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_04");	//Еще один гриб-сердце? Это удивительно, держи 250 золотых!
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Foggy()
{
	//туманник не берет - только проверяем наличие
	if (Npc_HasItems(other,ItMr_Foggy) && ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Foggy)))	{
		//комментируем
		if (!MR_ConstantinoCommentOnce[MR_Foggy] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_00");	//А зачем мне туманник?
			if (other.aivar[AIV_Gender] == MALE)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_01");	//Еще бы пещерную поганку притащил. Надеюсь, ты его не ел...
			}
			else	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_02");	//Что ж ты пещерную поганку не принесла? Надеюсь, ты его не ела...
			};
			//есть запись в журнал?
			if (_GiveMRs2Constantino_Log(MR_Foggy))	{
				//нет особых действий
			};
		};
		return TRUE;
	};
	return FALSE;
};

func void B_GiveMRs2Constantino()
{
	GiveMRs2Constantino_sum = 0;
	GiveMRs2Constantino_XP = 0;
	var int MrsGiven;	MrsGiven = FALSE;
	
	// сдать грибы
	if (B_GiveMRs2Constantino_MR01())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_MR02())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Piny())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Stone())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Red())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_BrownOiler())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Governor())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Sunrise())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Foggy())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_LadysEar())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Keil())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Bottle())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Ivy())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Trident())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Branch())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_DragonTears()){	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_NightSparkles()){	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_GoldPlate())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Oyster())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Heart())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Violet())		{	MrsGiven = TRUE;	};
	
	// выдать суммарную награду
	_GiveMRs2Constantino_Reward();
	
	// а грибы-то были?
	if (MrsGiven > 0)	{
		if (GiveMRs2Constantino_MR < 0)	{ 
			AI_Output(self,other,"DIA_Constantino_GiveMRs_10_00");	//Все? Хорошо, приходи, если что-то еще найдешь.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_GiveMRs_10_01");	//Но у тебя же ничего нет!
	};	
	Info_ClearChoices(DIA_Constantino_GiveMrms);
};

func void B_GiveMRs2Constantino_Fast()
{
	MR_ConstantinoCommentAlways = FALSE;
	B_GiveMRs2Constantino();
	MR_ConstantinoCommentAlways = TRUE;
};

//=========================================
//строка меню для каждого гриба
func string DIA_Constantino_GiveMrms_MenuMRName(var int MR_Index)
{
	var string result;
	var string price_str;
	var string MR_name;	MR_name = MEM_ReadStatStringArr(MR_Names, MR_Index);
	if (MEM_ReadStatArr(MR_ConstantinoCommentOnce,MR_Index))	{//уже давали грибы и знаем их цену
		price_str = IntToString(MEM_ReadStatArr(MR_Price,MR_Index));
	}
	else	{
		price_str = "?";
	};
	result = ConcatStrings(MR_name," (");
	result = ConcatStrings(result, price_str);
	result = ConcatStrings(result, " зол.)");
	return result;
};
//меню для выбора гриба для сдачи
func void DIA_Constantino_GiveMrms_MenuMR()
{
	GiveMRs2Constantino_MR = -1;
	GiveMRs2Constantino_cnt = -1;	
	var string str;	str = "";
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_back);
	if (Npc_HasItems(other,ItMr_Violet))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Violet);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Violet);
	};
	if (Npc_HasItems(other,ItMr_Trident))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Trident);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Trident);
	};
	if (Npc_HasItems(other,ItMr_Sunrise))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Sunrise);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Sunrise);
	};
	if (Npc_HasItems(other,ItMr_Stone))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Stone);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Stone);
	};
	if (Npc_HasItems(other,ItMr_Red))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Red);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Red);
	};
	if (Npc_HasItems(other,ItMr_Piny))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Piny);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Piny);
	};
	if (Npc_HasItems(other,ItMr_Oyster))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Oyster);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Oyster);
	};
	if (Npc_HasItems(other,ItMr_NightSparkles))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_NightSparkles);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_NightSparkles);
	};
	if (Npc_HasItems(other,ItMr_LadysEar))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_LadysEar);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_LadysEar);
	};
	if (Npc_HasItems(other,ItMr_KeilSmall) || (Npc_HasItems(other,ItMr_KeilBig) && !MR_ConstantinoCommentOnce[MR_Keil]))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Keil);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Keil);
	};
	if (Npc_HasItems(other,ItMr_Ivy))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Ivy);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Ivy);
	};
	if (Npc_HasItems(other,ItMr_Heart))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Heart);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Heart);
	};
	if (Npc_HasItems(other,ItMr_Governor))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Governor);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Governor);
	};
	if (Npc_HasItems(other,ItMr_GoldPlate))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_GoldPlate);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_GoldPlate);
	};
	if (Npc_HasItems(other,ItMr_Foggy) && !MR_ConstantinoCommentOnce[MR_Foggy])	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Foggy);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Foggy);
	};
	if (Npc_HasItems(other,ItMr_DragonTears))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_DragonTears);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_DragonTears);
	};
	if (Npc_HasItems(other,ItMr_BrownOiler))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_BrownOiler);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_BrownOiler);
	};
	if (Npc_HasItems(other,ItMr_Branch))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Branch);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Branch);
	};
	if (Npc_HasItems(other,ItMr_Bottle))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Bottle);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Bottle);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_02))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_02);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_MR02);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_01))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_01);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_MR01);
	};
	// если есть грибы - сдать все
	if (!Hlp_StrCmp(str,""))	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"Все грибы (быстро)",B_GiveMRs2Constantino_Fast);
		Info_AddChoice(DIA_Constantino_GiveMrms,"Все грибы",B_GiveMRs2Constantino);
	};
};

func void DIA_Constantino_GiveMrms_back()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
};
// а сколько грибов выбранного вида отдать?
func void DIA_Constantino_GiveMrms_MenuCnt()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_MenuMR);
	Info_AddChoice(DIA_Constantino_GiveMrms,"1 шт.",DIA_Constantino_GiveMrms_1);
	if (GiveMRs2Constantino_cnt >= 5)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"5 шт.",DIA_Constantino_GiveMrms_5);
	};
	if (GiveMRs2Constantino_cnt >= 10)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"10 шт.",DIA_Constantino_GiveMrms_10);
	};
	if (GiveMRs2Constantino_cnt > 1)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,CS3("все (",IntToString(GiveMRs2Constantino_cnt)," шт.)"),DIA_Constantino_GiveMrms_All);
	};
};
//сколько отдать для особо редких гриов
func void DIA_Constantino_GiveMrms_MenuCntSpecial()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_MenuMR);
	Info_AddChoice(DIA_Constantino_GiveMrms,"1 шт.",DIA_Constantino_GiveMrms_1);
	if (GiveMRs2Constantino_cnt >= 2)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"2 шт.",DIA_Constantino_GiveMrms_2);
	};
	if (GiveMRs2Constantino_cnt >= 3)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"3 шт.",DIA_Constantino_GiveMrms_3);
	};
	if (GiveMRs2Constantino_cnt >= 4)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"4 шт.",DIA_Constantino_GiveMrms_4);
	};
	if (GiveMRs2Constantino_cnt > 4)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,CS3("все (",IntToString(GiveMRs2Constantino_cnt)," шт.)"),DIA_Constantino_GiveMrms_All);
	};
};

func void DIA_Constantino_GiveMrms_MR01()
{
	GiveMRs2Constantino_MR = MR_01;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItPl_Mushroom_01);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_MR02()
{
	GiveMRs2Constantino_MR = MR_02;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItPl_Mushroom_02);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Bottle()
{
	GiveMRs2Constantino_MR = MR_Bottle;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Bottle);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Branch()
{
	GiveMRs2Constantino_MR = MR_Branch;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Branch);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_BrownOiler()
{
	GiveMRs2Constantino_MR = MR_BrownOiler;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_BrownOiler);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_DragonTears()
{
	GiveMRs2Constantino_MR = MR_DragonTears;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_DragonTears);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Foggy()
{
	GiveMRs2Constantino_MR = MR_Foggy;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Foggy);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Governor()
{
	GiveMRs2Constantino_MR = MR_Governor;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Governor);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Ivy()
{
	GiveMRs2Constantino_MR = MR_Ivy;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Ivy);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Keil()
{
	GiveMRs2Constantino_MR = MR_Keil;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_KeilSmall);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_LadysEar()
{
	GiveMRs2Constantino_MR = MR_LadysEar;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_LadysEar);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_NightSparkles()
{
	GiveMRs2Constantino_MR = MR_NightSparkles;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_NightSparkles);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Oyster()
{
	GiveMRs2Constantino_MR = MR_Oyster;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Oyster);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Piny()
{
	GiveMRs2Constantino_MR = MR_Piny;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Piny);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Red()
{
	GiveMRs2Constantino_MR = MR_Red;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Red);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Stone()
{
	GiveMRs2Constantino_MR = MR_Stone;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Stone);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Sunrise()
{
	GiveMRs2Constantino_MR = MR_Sunrise;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Sunrise);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Trident()
{
	GiveMRs2Constantino_MR = MR_Trident;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Trident);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Violet()
{
	GiveMRs2Constantino_MR = MR_Violet;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Violet);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_GoldPlate()
{
	GiveMRs2Constantino_MR = MR_GoldPlate;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_GoldPlate);	
	DIA_Constantino_GiveMrms_MenuCntSpecial();
};
func void DIA_Constantino_GiveMrms_Heart()
{
	GiveMRs2Constantino_MR = MR_Heart;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Heart);	
	DIA_Constantino_GiveMrms_MenuCntSpecial();
};

func void DIA_Constantino_GiveMrms_All()
{
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_1()
{
	GiveMRs2Constantino_cnt = 1;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_2()
{
	GiveMRs2Constantino_cnt = 2;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_3()
{
	GiveMRs2Constantino_cnt = 3;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_4()
{
	GiveMRs2Constantino_cnt = 4;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_5()
{
	GiveMRs2Constantino_cnt = 5;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_10()
{
	GiveMRs2Constantino_cnt = 10;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};


//ОТДАТЬ ГРИБЫ =========================================

instance DIA_Constantino_GiveMrms(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 2;
	condition = DIA_Constantino_GiveMrms_cond;
	information = DIA_Constantino_GiveMrms_info;
	description = "(отдать грибы)";
	permanent = TRUE;
};

func int DIA_Constantino_GiveMrms_cond()
{
	if ((Wld_GetDay() < Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition))	{
		return TRUE;
	};
};

func void DIA_Constantino_GiveMrms_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_03_00");	//Я принес тебе грибы.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_07_00");	//Я принес тебе грибы.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_10_00");	//Я принес тебе грибы.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_14_00");	//Я принес тебе грибы.
	} else	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_16_00");	//Я принесла тебе грибы.
	};
	AI_Output(self,other,"DIA_Constantino_GiveMrms_10_01");	//Хорошо. Посмотрим, что у тебя есть.
	DIA_Constantino_GiveMrms_MenuMR();
};

//=========================================

instance DIA_Constantino_Competition(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Constantino_Competition_info;
	description = "Ты правда объявил грибной конкурс?";
};

func void DIA_Constantino_Competition_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_Competition_03_01");	//Ты правда объявил грибной конкурс?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_Competition_07_01");	//Ты правда объявил грибной конкурс?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_Competition_10_01");	//Ты правда объявил грибной конкурс?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_Competition_14_01");	//Ты правда объявил грибной конкурс?
	} else	{
		AI_Output(other,self,"DIA_Constantino_Competition_16_01");	//Ты правда объявил грибной конкурс?
	};
	if ((Wld_GetDay() < Competition_LastDay))	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Constantino_Competition_10_02m");	//Да, да. И ты уже седьмой, кто вызвался принять участие.
		}
		else	{
			AI_Output(self,other,"DIA_Constantino_Competition_10_02f");	//Да, да. И ты уже седьмая, кто вызвался принять участие.
		};
		AI_Output(self,other,"DIA_Constantino_Competition_10_03");	//Золото за грибы ты получаешь сразу, а если наберешь больше всех очков - тебя ждет особый приз.
		AI_Output(self,other,"DIA_Constantino_Competition_10_04");	//Я буду учитывать количество и цену грибов, которые ты мне принесешь в сумме за всю неделю.
		AI_Output(self,other,"DIA_Constantino_Competition_10_05");	//У тебя есть что-нибудь?
		if (!C_NpcHasMushrooms(other))	{
			if (hero.voice == 3)	{
				AI_Output(other,self,"DIA_Constantino_Competition_03_06");	//Пока нет.
			} else if (hero.voice == 7)	{
				AI_Output(other,self,"DIA_Constantino_Competition_07_06");	//Пока нет.
			} else if (hero.voice == 10)	{
				AI_Output(other,self,"DIA_Constantino_Competition_10_06");	//Пока нет.
			} else if (hero.voice == 14)	{
				AI_Output(other,self,"DIA_Constantino_Competition_14_06");	//Пока нет.
			} else	{
				AI_Output(other,self,"DIA_Constantino_Competition_16_06");	//Пока нет.
			};
			AI_Output(self,other,"DIA_Constantino_Competition_10_07");	//Тогда не отвлекай меня.
			//возвращается к своим делам
			AI_StopProcessInfos(self);
		}
		else	{
			if (hero.voice == 3)	{
				AI_Output(other,self,"DIA_Constantino_Competition_03_08");	//Да, у меня есть кое-какие грибы.
			} else if (hero.voice == 7)	{
				AI_Output(other,self,"DIA_Constantino_Competition_07_08");	//Да, у меня есть кое-какие грибы.
			} else if (hero.voice == 10)	{
				AI_Output(other,self,"DIA_Constantino_Competition_10_08");	//Да, у меня есть кое-какие грибы.
			} else if (hero.voice == 14)	{
				AI_Output(other,self,"DIA_Constantino_Competition_14_08");	//Да, у меня есть кое-какие грибы.
			} else	{
				AI_Output(other,self,"DIA_Constantino_Competition_16_08");	//Да, у меня есть кое-какие грибы.
			};
			AI_Output(self,other,"DIA_Constantino_Competition_10_09");	//Хорошо, покажи, что у тебя есть.
		};
	}
	else {
		AI_Output(self,other,"DIA_Constantino_CompetitionEnded_10_01");	//Да, но он уже закончился.
		AI_Output(self,other,"DIA_Constantino_CompetitionEnded_10_02");	//Если у тебя есть грибы, я куплю их по обычной цене.
		if (other.aivar[AIV_Gender] == MALE)	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED, TOPIC_ConstantinoMushrooms_Late_M);
		}
		else	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED, TOPIC_ConstantinoMushrooms_Late_F);
		};
	};
};

//СЧЕТ ИГРОКА =========================================

instance DIA_Constantino_ScoreList(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 2;
	condition = DIA_Constantino_ScoreList_cond;
	information = DIA_Constantino_ScoreList_info;
	description = "Какие у меня шансы на победу?";
	permanent = TRUE;
};

func int DIA_Constantino_ScoreList_cond()
{
	if ((Wld_GetDay() < Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition))	{
		return TRUE;
	};
};

func void DIA_Constantino_ScoreList_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_03_00");	//Какие у меня шансы на победу?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_07_00");	//Какие у меня шансы на победу?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_10_00");	//Какие у меня шансы на победу?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_14_00");	//Какие у меня шансы на победу?
	} else	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_16_00");	//Какие у меня шансы на победу?
	};
	if (C_GetHeroScore() == 0)	{
		AI_Output(self,other,"DIA_Constantino_ScoreList_10_01");	//Пока не принесешь мне грибы - никаких.
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_ScoreList_10_02");	//Счет участников висит на стене возле двери. Смотри, у меня все записано.
	};
};

//ИТОГИ КОНКУРСА =========================================

instance DIA_Constantino_Final_Lost(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 10;
	condition = DIA_Constantino_Final_Lost_cond;
	information = DIA_Constantino_Final_Lost_info;
	important = TRUE;
};

func int DIA_Constantino_Final_Lost_cond()
{
	if ((Wld_GetDay() >= Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition) && (C_CountResults() == Competition_Result_LOST))	{
		return TRUE;
	};
};

func void DIA_Constantino_Final_Lost_info()
{
	AI_Output(self,other,"DIA_Constantino_Final_Lost_10_00");	//А вот и ты. Мне очень жаль, но тебе не удалось победить в конкурсе.
	if (Competition_Bonus > 0)	{
		AI_Output(self,other,"DIA_Constantino_Final_Lost_10_01");	//Я чрезвычайно благодарен за открытые тобой грибы, но для победы этого недостаточно.
	};
	AI_Output(self,other,"DIA_Constantino_Final_Lost_10_02");	//Грибы я теперь буду покупать по обычной цене.
	Competition_Result = Competition_Result_LOST;
	B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED,TOPIC_ConstantinoMushrooms_Lost);
	B_LogNote(TOPIC_FreeTime,TOPIC_FreeTime_Start);
};

//=========================================

instance DIA_Constantino_Final_Won(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 11;
	condition = DIA_Constantino_Final_Won_cond;
	information = DIA_Constantino_Final_Won_info;
	important = TRUE;
};

func int DIA_Constantino_Final_Won_cond()
{
	if ((Wld_GetDay() >= Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition) && (C_CountResults() == Competition_Result_WON))	{
		return TRUE;
	};
};

func void DIA_Constantino_Final_Won_info()
{
	if (Wld_GetDay() == Competition_LastDay)	{
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_00");	//Ты как раз вовремя!
		if (other.aivar[AIV_Gender] == MALE)	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_M);
		}
		else	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_F);
		};
	}
	else	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Constantino_Final_Won_10_01m");	//Где же ты был? Я уж думал, ты не придешь.
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_M);
		}
		else	{
			AI_Output(self,other,"DIA_Constantino_Final_Won_10_01f");	//Где же ты была? Я уж думал, ты не придешь.
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_F);
		};
	};
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_02");	//Поздравляю! Победа по праву принадлежит тебе!
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_03");	//Никто больше не смог собрать столько грибов.
	if (Competition_Bonus > 0)	{
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_04");	//Кроме того, тебе удалось найти новые, неизвестные науке грибы.
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_05");	//Это само по себе заслуживает всяческих похвал.
	};
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_06");	//Позволь вручить этот ПРИЗ - книгу о грибах Хориниса, которую я составлял много лет.
	B_GiveInvItems(self,other,ItWr_MushroomBook,1);
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_07");	//Это уникальный авторский экземпляр, более ты нигде такого не найдешь. Я подписал ее для тебя.
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_08");	//Если у тебя есть еще грибы, я готов купить их, но уже по обычной цене.
	Competition_Result = Competition_Result_WON;
	B_LogNote(TOPIC_FreeTime,TOPIC_FreeTime_Start);
};

// Кулинарные изыски =====================================

instance DIA_Constantino_AboutLadysEar(C_INFO)
{
	nr = 20;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_AboutLadysEar_cond;
	information = DIA_Constantino_AboutLadysEar_info;
	description = "Ты не мог бы рассказать мне про один гриб?";
};
func int DIA_Constantino_AboutLadysEar_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};

func void DIA_Constantino_AboutLadysEar_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_00");	//Ты не мог бы рассказать мне про один гриб?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_00");	//Ты не мог бы рассказать мне про один гриб?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_00");	//Ты не мог бы рассказать мне про один гриб?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_00");	//Ты не мог бы рассказать мне про один гриб?
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_00");	//Ты не мог бы рассказать мне про один гриб?
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_01");	//Какой?
	if (MR_ConstantinoCommentOnce[MR_LadysEar])	{
		if (hero.voice == 3)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_02");	//Ты сказал, он называется дамские уши.
		} else if (hero.voice == 7)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_02");	//Ты сказал, он называется дамские уши.
		} else if (hero.voice == 10)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_02");	//Ты сказал, он называется дамские уши.
		} else if (hero.voice == 14)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_02");	//Ты говорил, что он называется дамские уши.
		} else	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_02");	//Ты сказал, он называется дамские уши.
		};
	}
	else	{
		if (hero.voice == 3)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_03");	//Он розовый, на пнях растет.
		} else if (hero.voice == 7)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_03");	//Он розовый, на пнях растет.
		} else if (hero.voice == 10)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_03");	//Он розовый, на пнях растет.
		} else if (hero.voice == 14)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_03");	//Он розовый и на пнях растет.
		} else	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_03");	//Такой розовый, на пеньках растет.
		};
		AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_04");	//А, дамские уши.
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_05");	//В сыром виде его есть нежелательно. Не смертельно, конечно, но использовать магию он мешает.
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_06");	//Зато из него можно получить хорошую настойку...
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_07");	//А есть какой-то рецепт приготовления? Отварить или обжарить там...
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_07");	//А есть какой-то рецепт приготовления? Отварить или обжарить там...
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_07");	//А есть какой-то рецепт приготовления? Отварить или обжарить там...
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_07");	//А есть какой-то рецепт приготовления? Отварить или обжарить там...
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_07");	//А есть какой-то рецепт приготовления? Отварить или обжарить там...
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_08");	//Я алхимик, а не кулинар!
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_09");	//Но если замочить грибы в холодной воде по три раза на три часа, вредные свойства пропадут. Как и полезные.
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_10");	//Дальше можешь делать с ними, что хочешь.
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_Constantino);
};
// ---------------------------------------------------
instance DIA_Constantino_AboutRecipe(C_INFO)
{
	nr = 21;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_AboutRecipe_cond;
	information = DIA_Constantino_AboutRecipe_info;
	description = "А можно узнать твой рецепт настойки на дамском ушке?";
};
func int DIA_Constantino_AboutRecipe_cond()
{
	if ((MIS_Cookery == LOG_Running)	
		 && Npc_KnowsInfo(other,DIA_Constantino_AboutLadysEar)){
		return TRUE;
	};
};

func void DIA_Constantino_AboutRecipe_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_03_00");	//А можно узнать твой рецепт настойки на дамском ушке?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_07_00");	//А можно узнать твой рецепт настойки на дамском ушке?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_10_00");	//А можно узнать твой рецепт настойки на дамском ушке?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_14_00");	//А можно узнать твой рецепт настойки на дамском ушке?
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_16_00");	//А можно узнать твой рецепт настойки на дамском ушке?
	};
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_01");	//Хм, хорошо, раз ты участвуешь в моем конкурсе, я продам тебе рецепт.
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_02");	//500 золотых.
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_03_03");	//Сколько?!
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_07_03");	//Сколько?!
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_10_03");	//Сколько?!
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_14_03");	//Сколько?!
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_16_03");	//Сколько?!
	};
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_04");	//Это эксклюзив! Это результат семи лет экспериментов! На себе, прошу заметить.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_05m");	//Будь благодарен, что я вообще согласился показать его.
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_05f");	//Будь благодарна, что я вообще согласился показать его.
	};
	MIS_Cookery_ConstantinoAsked = TRUE;
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_ConstantinoRecipePrice);
};
// ---------------------------------------------------
instance DIA_Constantino_BuyRecipe(C_INFO)
{
	nr = 23;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_BuyRecipe_cond;
	information = DIA_Constantino_BuyRecipe_info;
	description = "Я хочу купить рецепт настойки. (500 зол.)";
};
func int DIA_Constantino_BuyRecipe_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Constantino_AboutRecipe) && !MIS_Cookery_ConstantinoSold)	{
		return TRUE;
	};
};

func void DIA_Constantino_BuyRecipe_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_03_00");	//Я хочу купить рецепт настойки.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_07_00");	//Я хочу купить рецепт настойки.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_10_00");	//Я хочу купить рецепт настойки.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_14_00");	//Я хочу купить рецепт настойки.
	} else	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_16_00");	//Я хочу купить рецепт настойки.
	};
	if (B_GiveGold(other,self, 500))	{
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_01");	//Хорошо, держи. Только делай все точно, как тут написано!
		B_GiveInvItems(self,other,ItWr_EarRecipe_Constantino,1);
		MIS_Cookery_ConstantinoSold = TRUE;
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_ConstantinoGot);
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_02");	//Тогда найди 500 золотых.
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_03");	//Или принеси мне грибов, я хорошо за них плачу.
	};
};


/////////////////////////////// САРА //////////////////////////////////

instance DIA_Constantino_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_417_Constantino;			nr = 31;
	condition = DIA_Constantino_Sarah_AskSmokingCure_cond;
	information = DIA_Constantino_Sarah_AskSmokingCure_info;
	description = "Я ищу зелье, которое может отвадить от курения.";
};
func int DIA_Constantino_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Constantino_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Constantino_Sarah_AskSmokingCure_16_00");	//Я ищу зелье, которое может отвадить от курения. Ты можешь приготовить такое?
	AI_Output(self,other,"DIA_Constantino_Sarah_AskSmokingCure_10_01");	//Нет, такого зелья я не знаю.
};

// Прикололись над Рупертом =====================================

instance DIA_Constantino_JokeSong(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 40;
	condition = DIA_Constantino_JokeSong_cond;
	information = DIA_Constantino_JokeSong_info;
	important = TRUE;
};
func int DIA_Constantino_JokeSong_cond()
{
	if (Rupert_LiedSong && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Constantino_JokeSong_info()
{
	AI_Output(self,other,"DIA_Constantino_JokeSong_10_01");	//Ты не знаешь, почему ко мне приходят странные дамы с просьбой спеть балладу о грибах?
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Constantino_JokeSong_03_02");	//Понятия не имею.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Constantino_JokeSong_07_02");	//Понятия не имею.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Constantino_JokeSong_10_02");	//Понятия не имею.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Constantino_JokeSong_14_02");	//Понятия не имею.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Constantino_JokeSong_16_02");	//Понятия не имею.
	};
};
//-------------------------------------------------------
instance DIA_Constantino_JokeGold(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 41;
	condition = DIA_Constantino_JokeGold_cond;
	information = DIA_Constantino_JokeGold_info;
	description = "Что-то случилось?";
};
func int DIA_Constantino_JokeGold_cond()
{
	if (Rupert_LiedGold && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Constantino_JokeGold_info()
{
	if (hero.voice == 3)	{			//Одо
		AI_Output(other,self,"DIA_Constantino_JokeSong_03_00");	//Что-то случилось? У тебя встревоженный вид.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Constantino_JokeSong_07_00");	//Что-то случилось? У тебя встревоженный вид.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Constantino_JokeSong_10_00");	//Что-то случилось? У тебя встревоженный вид.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Constantino_JokeSong_14_00");	//Что-то случилось? У тебя встревоженный вид.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Constantino_JokeSong_16_00");	//Что-то случилось? У тебя встревоженный вид.
	};
	AI_Output(self,other,"DIA_Constantino_JokeGold_10_01");	//Меня ограбили! Унесли все оставшиеся грибы и бесценную коллекцию минералов!
	AI_Output(self,other,"DIA_Constantino_JokeGold_10_02");	//У воров ничего святого не осталось.
};

// ТОРГОВЛЯ ==============================================

instance DIA_Constantino_preTrade(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 50;
	condition = DIA_Constantino_preTrade_cond;
	information = DIA_Constantino_preTrade_info;
	description = "Можно купить у тебя зелья?";
	trade = TRUE;
};

func int DIA_Constantino_preTrade_cond()
{
	return TRUE;
};

func void DIA_Constantino_preTrade_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_03_00");	//Можно купить у тебя зелья?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_07_00");	//Можно купить у тебя зелья?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_10_00");	//Можно купить у тебя зелья?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_14_00");	//Можно купить у тебя зелья?
	} else	{
		AI_Output(other,self,"DIA_Constantino_preTrade_16_00");	//Можно купить у тебя зелья?
	};
	AI_Output(self,other,"DIA_Constantino_preTrade_10_01");	//Выбирай.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Constantino);
	B_GiveTradeInv_Constantino(self);
};
//-----------------------------------------
instance DIA_Constantino_Trade(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 51;
	condition = DIA_Constantino_Trade_cond;
	information = DIA_Constantino_Trade_info;
	description = "(торговать)";
	trade = TRUE;
	permanent = TRUE;
};

func int DIA_Constantino_Trade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Constantino_preTrade))	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_info()
{
	B_GiveTradeInv_Constantino(self);
};


