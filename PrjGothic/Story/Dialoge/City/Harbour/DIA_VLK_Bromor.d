
instance DIA_Bromor_EXIT(DIA_Proto_End)
{
	npc = VLK_433_Bromor;
};

//////////////////////////////////САРА////////////////////////////////////////
instance DIA_Bromor_Sarah_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 1;
	condition = DIA_Bromor_Sarah_MR_Hello_cond;
	information = DIA_Bromor_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Bromor_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Sarah_MR_Hello_07_01");	//Тебе чего? Я же велел этому тупице Борке не пускать кого попало!
		AI_Output(other,self,"DIA_Bromor_Sarah_MR_Hello_16_02");	//Не бухти, я ненадолго. Клиентов твоих обижать не буду.
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Sarah_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 2;
	condition = DIA_Bromor_Sarah_Perm_cond;
	information = DIA_Bromor_Sarah_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Sarah_Perm_cond()
{
	if (C_HeroIs_Sarah() && DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Bromor_Sarah_Hello))	{
		return TRUE;
	};
};
func void DIA_Bromor_Sarah_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Sarah_Perm_07_01");	//(сквозь зубы) Вали отсюда!
	AI_StopProcessInfos(self);
};

//////////////////////////////////ЕЛЕНА////////////////////////////////////////
instance DIA_Bromor_Elena_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 10;
	condition = DIA_Bromor_Elena_Perm_cond;
	information = DIA_Bromor_Elena_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Elena_Perm_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Elena_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Elena_Perm_07_01");	//Не похоже, что ты ищешь у меня работу. А зевакам здесь не рады. Убирайся!
	AI_StopProcessInfos(self);
};

//////////////////////////////////ТИЛЛ////////////////////////////////////////
instance DIA_Bromor_Till_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 20;
	condition = DIA_Bromor_Till_Perm_cond;
	information = DIA_Bromor_Till_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Till_Perm_cond()
{
	if (C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Till_Perm_info()
{
	var int rnd;	rnd = Hlp_Random(25);
	if (rnd < 10)	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_01");	//А ты что тут забыл, пацан? Приходи, когда подрастешь!
	}
	else if (rnd < 20)	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_02");	//У тебя еще молоко на губах не обсохло! Иди, поиграй где-нибудь.
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_03");	//Хочешь сиську - иди к мамке!
	};
	AI_StopProcessInfos(self);
};

//////////////////////////////////ЭРОЛ////////////////////////////////////////
var int DIA_Bromor_Erol_Perm_Cnt;
instance DIA_Bromor_Erol_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 31;
	condition = DIA_Bromor_Erol_Perm_cond;
	information = DIA_Bromor_Erol_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Erol_Perm_cond()
{
	if (C_HeroIs_Erol() && DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Bromor_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Bromor_Erol_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_01");	//Желаете развлечься?
	if (DIA_Bromor_Erol_Perm_Cnt % 3 == 0)	{
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_02");	//В молодости никогда не нуждался в твоих девочках, а теперь и подавно.
	}
	else if (DIA_Bromor_Erol_Perm_Cnt % 3 == 1)	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_03");	//Мои девочки согреют вас холодной ночью.
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_04");	//Я еще не настолько стар, чтобы мне кашку жевали и постель грели!
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_05");	//Мы готовы предложить самые изысканные утехи.
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_06");	//Побереги дыхание для тех неудачников, которые тут ошиваются.
	};
	if (DIA_Bromor_Erol_Perm_Cnt == 2)	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_07");	//Тогда зачем вы пришли сюда?
			AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_08");	//Да уж не на твою рожу любоваться.
	};
	DIA_Bromor_Erol_Perm_Cnt += 1;
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Erol_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 30;
	condition = DIA_Bromor_Erol_Hello_cond;
	information = DIA_Bromor_Erol_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Erol_Hello_cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Bromor_Erol_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Erol_Hello_07_01");	//Господин Эрол! Не ожидал увидеть вас в нашем скромном заведении.
	DIA_Bromor_Erol_Perm_info();
};

//////////////////////////////////ОДО////////////////////////////////////////
var int DIA_Bromor_Odo_Perm_Once;
instance DIA_Bromor_Odo_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 40;
	condition = DIA_Bromor_Odo_Perm_cond;
	information = DIA_Bromor_Odo_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Odo_Perm_cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Odo_Perm_info()
{
	if (C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_01");	//О, мы всегда рады гостям из Монастыря! Особые скидки для слуг Инноса!
			AI_Output(other,self,"DIA_Bromor_Odo_Perm_03_02");	//(поперхнувшись) Для слуг Инноса? Побойся гнева его, греховодник!
	}
	else	{
		if (!DIA_Bromor_Odo_Perm_Once)	{
			AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_03");	//Добро пожаловать! Всегда приятно видеть новые лица.
		};
		AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_04");	//Всего 50 золотых и...
			AI_Output(other,self,"DIA_Bromor_Odo_Perm_03_05");	//(сухо) Не интересует.
	};
	DIA_Bromor_Odo_Perm_Once = TRUE;
	AI_StopProcessInfos(self);
};

//////////////////////////////////РУПЕРТ////////////////////////////////////////
instance DIA_Bromor_Rupert_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Rupert_Hello_cond;
	information = DIA_Bromor_Rupert_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Rupert_Hello_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Rupert_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Rupert_Hello_07_01");	//Мы тут не подаем милостыню. Наши клиенты  п л а т я т  за услуги 50 золотых, усек?
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Rupert_Pay(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Rupert_Pay_cond;
	information = DIA_Bromor_Rupert_Pay_info;
	description = "Я хочу развлечься. (50 зол.)";
	permanent = TRUE;
};
func int DIA_Bromor_Rupert_Pay_cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Bromor_Rupert_Pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Rupert_Pay_03_00");	//Я хочу развлечься.
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Bromor_Rupert_Pay_07_01");	//Пока ты платишь - сколько угодно. Ваня будет ждать тебя наверху.
		Bromor_Paid = TRUE;
		B_StartOtherRoutine(VLK_491_Vanja,"WORK");
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Rupert_Pay_07_02");	//Я же сказал - здесь не подают милостыню.
	};
	AI_StopProcessInfos(self);
};
//////////////////////////////////ТАЛБИН////////////////////////////////////////
instance DIA_Bromor_Talbin_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 60;
	condition = DIA_Bromor_Talbin_Hello_cond;
	information = DIA_Bromor_Talbin_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Talbin_Hello_cond()
{
	if (C_HeroIs_Talbin() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Talbin_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Talbin_Hello_07_01");	//Господин охотник! Разгоните тоску в объятиях наших девочек. Всего за 50 золотых.
};
//============================================
instance DIA_Bromor_Talbin_Pay(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Talbin_Pay_cond;
	information = DIA_Bromor_Talbin_Pay_info;
	description = "Я хочу развлечься. (50 зол.)";
	permanent = TRUE;
};
func int DIA_Bromor_Talbin_Pay_cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Bromor_Talbin_Pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Talbin_Pay_07_00");	//Я хочу развлечься.
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Bromor_Talbin_Pay_07_01");	//Поднимитесь с Ваней наверх, и, гарантирую, вы забудете обо всем на пару часов.
		Bromor_Paid = TRUE;
		B_StartOtherRoutine(VLK_491_Vanja,"WORK");
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Talbin_Perm_07_03");	//Тогда нужно заплатить 50 золотых.
	};
	AI_StopProcessInfos(self);
};


