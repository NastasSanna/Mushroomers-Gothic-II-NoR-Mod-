
instance DIA_Wasili_EXIT(DIA_Proto_End)
{
	npc = BAU_907_Wasili;
};

////////////////////////////// ЕЛЕНА /////////////////////////////////////
//==================================================
instance DIA_Wasili_Elena_Start(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 0;
	condition = DIA_Wasili_Elena_Start_cond;
	information = DIA_Wasili_Elena_Start_info;
	important = true;
};
func int DIA_Wasili_Elena_Start_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_Start_info()
{
	AI_Output(self,other,"DIA_Wasili_Elena_Start_01_00");	//Что, егоза, опять дома не сидится?
		AI_Output(other,self,"DIA_Wasili_Elena_Start_16_01");	//Не ворчи, Вась.
};
//==================================================
var int DIA_Wasili_Elena_Coins_Once;
instance DIA_Wasili_Elena_Coins(C_INFO)
{
	npc = BAU_907_Wasili;			nr = 51;
	condition = DIA_Wasili_Elena_Coins_cond;
	information = DIA_Wasili_Elena_Coins_info;
	description = "Смотри, что у меня есть! (отдать старые монеты)";
	permanent = true;
};
func int DIA_Wasili_Elena_Coins_cond()
{
	if (C_HeroIs_Elena() && (Npc_HasItems(other,ItMi_OldCoin) > 0))	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_Coins_info()
{
	var int x;	x = 0;
	var int cnt;	cnt = Npc_HasItems(other,ItMi_OldCoin);
		AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_00");	//Смотри, что у меня есть!
		if (cnt == 1)	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_01");	//Старинная монетка!
		}
		else	if (cnt <= 5)	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_02");	//Несколько старинных монет!
		}
		else	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_03");	//Целая куча монеток!
		};
	x = 1;	if (x==1)	{
		B_GiveInvItems(other,self,ItMi_OldCoin,cnt);
		Npc_RemoveInvItems(self,ItMi_OldCoin,cnt);
		B_GivePlayerXP(cnt);
	};
	if (DIA_Wasili_Elena_Coins_Once == FALSE)	{
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_04");	//Ты же вроде за грибами, а не монетками собиралась?
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_05");	//Одно другому не мешает.
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_06");	//Ну тогда приноси еще, если найдешь.
		DIA_Wasili_Elena_Coins_Once = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_07");	//Спасибо, девочка!
	};
};
//==================================================
instance DIA_Wasili_Elena_TellStory(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 50;
	condition = DIA_Wasili_Elena_TellStory_cond;
	information = DIA_Wasili_Elena_TellStory_info;
	description = "Расскажи что-нибудь.";
	permanent = true;
};
func int DIA_Wasili_Elena_TellStory_cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_TellStory_info()
{
	AI_Output(other,self,"DIA_Wasili_Elena_TellStory_16_00");	//Расскажи что-нибудь.
	if (Wld_IsTime(8,0,21,0))	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_01");	//Некогда мне сказки сказывать. Сама знаешь, что будет, если не догляжу.
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_02");	//(шепотом, подмигивая) Приходи вечером, если хочешь послушать.
	}
	else	if (Wld_IsTime(2,0,8,0))	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_03");	//(ворчливо) А отдохнуть старому Василию не дашь?
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_04");	//Про что тебе рассказать?
		Info_ClearChoices(DIA_Wasili_Elena_TellStory);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,Dialog_Back,DIA_Wasili_Elena_TellStory_Back);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"Про древние руины.",DIA_Wasili_Elena_TellStory_Ruins);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"Про рыцарей.",DIA_Wasili_Elena_TellStory_Ritter);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"Про драконов.",DIA_Wasili_Elena_TellStory_Dragons);
		if (Wasili_LutikStory_Part == 1)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"Про Лютика-скорохода.",DIA_Wasili_Elena_TellStory_Lutik01);
		}
		else if (Wasili_LutikStory_Part == 2)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"Продолжение про Лютика-скорохода.",DIA_Wasili_Elena_TellStory_Lutik02);
		}
		else if (Wasili_LutikStory_Part == 3)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"Конец истории про Лютика-скорохода.",DIA_Wasili_Elena_TellStory_Lutik03);
		};
	};
};
func void DIA_Wasili_Elena_TellStory_Back()
{
		AI_Output(other,self,"DIA_Wasili_Elena_TellStory_Back_16_00");	//Как-нибудь в другой раз.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
};
func void DIA_Wasili_Elena_TellStory_Dragons()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_00");	//В стародавние времена, так давно, что уже никто и не помнит, а сказывают, что жили по всему миру драконы.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_01");	//Это были самые страшные чудовища, в одиночку разорявшие целые города и деревни.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_02");	//Они были огромными, как скалы, но широкие крылья поднимали их в небо.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_03");	//Их жуткие пасти были полны острых зубов, а с дыханием из глотки вырывался огонь.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_04");	//А их тело покрывала чешуя, прочнее любого доспеха.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_05");	//Драконы жили высоко в горах, глубоко в пещерах, в самой трясине болот.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_06");	//Там они прятали все награбленное за долгие годы. А жили драконы очень долго, так что у них скапливались целые горы золота и драгоценностей.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_07");	//Но нашлись храбрые герои, которые могли победить даже драконов.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_08");	//Из чешуи драконов они делали себе доспехи, а сердце дракона, говорят, могло исцелить любую болезнь. А золота у них было столько, сколько и дюжине людей не потратить за всю жизнь.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_09");	//Охотников на драконов становилось все больше, а драконов все меньше.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_10");	//А потом драконы совсем пропали, а с ними вместе и охотники.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_11");	//Последний дракон, правда, долго прятался от людей, пока не нашел его Лютик-скороход... Но это уже отдельная сказка.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (Wasili_LutikStory_Part == 0)	{
		Wasili_LutikStory_Part = 1;
	};
	if (!Tale_Dragons_Once)	{
		Tale_Dragons_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_Ritter()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_00");	//Рыцари... Рыцари сейчас совсем не те, что были раньше.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_01");	//Сейчас им бы только друг с другом драться, да титулы получать.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_02");	//А раньше каждый рыцарь был героем. И была их не целая армия, а очень-очень мало.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_03");	//Они много лет тренировались и учили особые заклинания, чтобы побеждать самых страшных врагов.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_04");	//Они не прятались в замках, а путешествовали по всему миру, несли свет Инноса в самые темные и далекие уголки.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_05");	//И никто не мог устоять перед Рыцарем: ни огнедышащие драконы, ни страшные демоны, ни темные маги-некроманты.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_06");	//Были, правда и Темные Рыцари, служившие Белиару. Но про них толком никто ничего не знает - ни откуда взялись, ни куда делись.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Ritters_Once)	{
		Tale_Ritters_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_Ruins()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_00");	//Высоко в горах можно найти древние руины. Это развалины огромных храмов.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_01");	//Говорят, когда-то они были затоплены.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_02");	//А тех времен, когда они были построены уже и вовсе никто не помнит.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_03");	//Раньше в этих руинах можно было найти разные сокровища, и туда забирались разные искатели приключений.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_04");	//Они находили золото, зачарованное оружие, магические свитки.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_05");	//Но теперь там осталась только древняя пыль и каменные таблички с письменами на забытом языке.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_06");	//А еще говорят, что руины были и в гавани, но их разобрали и из камней сложили крепостную стену.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Ruins_Once)	{
		Tale_Ruins_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

func void DIA_Wasili_Elena_TellStory_Lutik01()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_00");	//Лютик-скороход победил самого последнего дракона во всем Мордраге.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_01");	//Еще когда Лютик был маленьким, бабушка часто рассказывала ему про Медного дракона, который спрятался от людей глубоко в горах в своем логове.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_02");	//Лютик облазил все горы вокруг своей деревни, а когда вырос, отправился в путешествие. Всем встречным он представлялся как Охотник на драконов.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_03");	//Тогда над ним многие смеялись, потому что он был очень худым и долговязым, бедно одет, да и имя у него было совсем не боевое.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_04");	//Зато он очень быстро бегал, даже острозубые глорхи не могли его догнать. Да и умом его Иннос не обделил.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_05");	//Он прошел через семь земель и семь морей, бывал в больших городах и маленьких деревнях, но нигде никто не видел Медного дракона. Да других драконов тоже, потому что это был самый последний дракон в Мордраге.
	Wasili_LutikStory_Part = 2;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"Давай остальное попозже.",DIA_Wasili_Elena_TellStory_LutikLater);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"(слушать дальше)",DIA_Wasili_Elena_TellStory_Lutik02);
};

func void DIA_Wasili_Elena_TellStory_Lutik02()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_00");	//Однажды Лютик остановился на привал возле холодного быстрого ручья в Белых горах. Вдруг он заметил, что на дне ручья что-то блестело.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_01");	//Как же он удивился, когда достал из воды не камень и даже не монету, а огромную медную чешуйку.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_02");	//Лютик отправился вверх по течению ручья и к закату забрался высоко в горы, где до него не бывал ни один человек.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_03");	//И там, где из ручей вытекал из расщелины в скалах, на камнях спал Дракон. Его красноватая чешуя сияла золотом в лучах заходящего солнца, а из ноздрей поднимались струйки дыма.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_04");	//И еще в стороне Лютик заметил большую кучу, в которой были перемешаны драгоценности, доспехи и кости с черепами - человеческие, орьчьи и еще чьи-то.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_05");	//Лютик затаил дыхание, но Дракон все равно его услышал. Он начал крутить своей большой головой в поисках нарушителя.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_06");	//Неожиданно Дракон взлетел и напрявился прямо к человеку. Момент - и они смотрят друг другу прямо в глаза - голубые у Лютика и красные у Дракона.
	Wasili_LutikStory_Part = 3;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"Давай остальное попозже.",DIA_Wasili_Elena_TellStory_LutikLater);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"(слушать дальше)",DIA_Wasili_Elena_TellStory_Lutik03);
};

func void DIA_Wasili_Elena_TellStory_Lutik03()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_00");	//В следующий миг дракон бросился на Лютика, а Лютик бросился наутек. Темнело, и горы были ему незнакомы, но быстрые ноги спасали его.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_01");	//В конце концов он запрыгнул в узкую расщелину. Дракон просунул за ним свою голову на длинной шее и... застрял. 
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_02");	//Острые зубы щелкали всего в шаге от Лютика, но не доставали. Потом Дракон стал шумно втягивать воздух, чтобы выпустить огонь.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_03");	//Лютик понял, что если окажется на пути огня, то погибнет, а единственный выход закрывала драконья голова. И он решился.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_04");	//Лютик прыгнул так высоко и далеко, как никогда не прыгал, перепрыгнул через драконью пасть и оказался на шее, прямо за ушами.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_05");	//Раньше, чем Дракон понял, что же произошло, Лютик пробежал по спине и спрыгнул на землю.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_06");	//А шея дракона засела между скал как в тисках. Дракон ревел и бил хвостом, но никак не мог вытащить голову из расщелины.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_07");	//От его ударов скалы затряслись иначался камнепад. Лютика как всегда спасли быстрые ноги, а дракона засыпало вместе с сокровищами.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_08");	//Горный ручей запрудило, и на месте драконьего логова получилось горное озеро. А у Лютика осталось лишь несколько медных чешуек со дна ручья.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_09");	//Он еще много путешествовал и видел, а домой вернулся седым стариком. И когда рассказывал эту историю, ему никто не верил, а медные чешуйки считали фальшивыми.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_10");	//Потому драконьи скоровища так и лежат нетронутыми на дне озера в Белых горах.
	Wasili_LutikStory_Part = 1;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Lutik_Once)	{
		Tale_Lutik_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_LutikLater()
{
		AI_Output(other,self,"DIA_Wasili_Elena_TellStory_LutikLater_16_00");	//Давай остальное попозже.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
};

//==================================================
instance DIA_Wasili_Elena_AskPortrait(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 1;
	condition = DIA_Wasili_Elena_AskPortrait_cond;
	information = DIA_Wasili_Elena_AskPortrait_info;
	description = "Ты не знаешь, где портрет родителей в молодости?";
	permanent = TRUE;
};
func int DIA_Wasili_Elena_AskPortrait_cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent)
		 && !MIS_Elena_Present_WasiliPortraitGot
		 && (MIS_Elena_Present == LOG_Running))	
	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_AskPortrait_info()
{
	// Онар не должен слышать
	if (Npc_CanSeeNpcFreeLOS(Bau_900_Onar,other) || (Npc_GetDistToNpc(Bau_900_Onar,other) < PERC_DIST_INTERMEDIAT) && (Npc_GetHeightToNpc(Bau_900_Onar,other) < PERC_DIST_HEIGHT))
	{
		PrintScreen("Сейчас неподходщий момент.",-1,48,FONT_Screen,2);
		PrintScreen("Отец не должен услышать.",-1,52,FONT_Screen,2);
	}
	else	{
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_00");	//Ты не знаешь, где портрет родителей в молодости?
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_01");	//Знаю, только твой отец мне голову оторвет, если узнает, что мы по сундукам лазили.
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_01");	//Да что такого? Я же не чужой человек.
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_02");	//А почему сама у него не попросишь?
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_03");	//Сюрприз готовлю. Сюр-приз!
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_04");	//Ох, егоза. Ну ладно. Дам тебе этот портрет.
		B_GiveInvItems(self,other,ItMi_PortraitOnarMaria,1);
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_05");	//Только береги, да верни поскорее.
		MIS_Elena_Present_WasiliPortraitGot = TRUE;
		B_GivePlayerXP(XP_Elena_PortretGot);
	};
};

//==================================================
instance DIA_Wasili_Elena_ReturnPortrait(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 2;
	condition = DIA_Wasili_Elena_ReturnPortrait_cond;
	information = DIA_Wasili_Elena_ReturnPortrait_info;
	description = "Вот, я принесла портреты назад.";
};
func int DIA_Wasili_Elena_ReturnPortrait_cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItMi_PortraitOnarMaria)
		// Онар не должен слышать
		 && (!Npc_CanSeeNpcFreeLOS(Bau_900_Onar,other) || (Npc_GetDistToNpc(Bau_900_Onar,other) > PERC_DIST_INTERMEDIAT) || (Npc_GetHeightToNpc(Bau_900_Onar,other) > PERC_DIST_HEIGHT))
		// портрет больше не нужен
		 && (MIS_Elena_Present_PortraitsReady || MIS_Elena_Present_BrianReturn || (MIS_Elena_Present == LOG_SUCCESS)))	
	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_ReturnPortrait_info()
{
	AI_Output(other,self,"DIA_Wasili_Elena_ReturnPortrait_16_00");	//Вот, я принесла портрет назад.
	B_GiveInvItems(other,self,ItMi_PortraitOnarMaria,1);
		AI_Output(self,other,"DIA_Wasili_Elena_ReturnPortrait_01_01");	//Наконец-то! Я все боялся, господин Онар прознает.
	B_GivePlayerXP(XP_Elena_PortretReturned);
};


/////////////////////////////////// ТИЛЛ ///////////////////////////////////////
//==================================================
instance DIA_Wasili_Till_Start(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 10;
	condition = DIA_Wasili_Till_Start_cond;
	information = DIA_Wasili_Till_Start_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Wasili_Till_Start_cond()
{
	if (C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Wasili_Till_Start_info()
{
	AI_Output(self,other,"DIA_Wasili_Till_Start_01_00");	//Что, Тилл, тебя тоже за грибами отправили?
};

/////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////
//==================================================
instance DIA_Wasili_Others_MR_Perm(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 30;
	condition = DIA_Wasili_Others_MR_Perm_cond;
	information = DIA_Wasili_Others_MR_Perm_info;
	description = "Как дела на вашей ферме?";
	permanent = true;
};
func int DIA_Wasili_Others_MR_Perm_cond()
{
	if (!C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Others_MR_Perm_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_03_00");	//Как дела на вашей ферме?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_07_00");	//Как дела на вашей ферме?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_10_00");	//Как дела на вашей ферме?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_14_00");	//Как дела на вашей ферме?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_16_00");	//Как дела на вашей ферме?
	};
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_01");	//Онар решил, что у нас слишком много работников, и многие из них болтаются без дела.
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_02");	//Теперь думает, кого следует прогнать.
	}
	else	if (rnd == 1)	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_03");	//Все в порядке. Почти весь урожай собран.
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_04");	//С началом осени полевые хищники начали прятаться по пещерам, и на полях стало безопаснее.
	};
};
//==================================================
instance DIA_Wasili_Others_WhatsUrJob(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 31;
	condition = DIA_Wasili_Others_WhatsUrJob_cond;
	information = DIA_Wasili_Others_WhatsUrJob_info;
	description = "Чем ты занимаешься?";
	permanent = true;
};
func int DIA_Wasili_Others_WhatsUrJob_cond()
{
	if (!C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Others_WhatsUrJob_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_03_00");	//Чем ты занимаешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_07_00");	//Чем ты занимаешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_10_00");	//Чем ты занимаешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_14_00");	//Чем ты занимаешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_16_00");	//Чем ты занимаешься?
	};
	AI_Output(self,other,"DIA_Wasili_Others_WhatsUrJob_01_01");	//Слежу за домом. Чтобы ничего не сломалось и не пропало.
};



