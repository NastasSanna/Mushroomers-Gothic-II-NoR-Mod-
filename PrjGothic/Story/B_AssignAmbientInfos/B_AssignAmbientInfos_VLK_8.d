
instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_8_News(C_Info)
{
	nr = 101;
	condition = DIA_VLK_8_News_Condition;
	information = DIA_VLK_8_News_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь новости?";
};

func int DIA_VLK_8_News_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_News_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_VLK_News_03_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_VLK_News_07_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_VLK_News_10_00");	//Есть какие-нибудь новости?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_VLK_News_14_00");	//Есть какие-нибудь новости?
	} else	{
		AI_Output(other,self,"DIA_VLK_News_16_00");	//Есть какие-нибудь новости?
	};
	var int rnd;	rnd = Hlp_Random(4);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_VLK_News_08_01");	//Говорят, на материке дела все хуже. Хорошо, что нас это не касается.
	} else if ((rnd == 1) && (Wld_GetDay() <= Competition_LastDay))	{
		AI_Output(self,other,"DIA_VLK_News_08_02");	//Константино объявил конкурс по сбору грибов. Интересно, много ли найдется желающих...
	} else if (rnd == 2)	{
		AI_Output(self,other,"DIA_VLK_News_08_03");	//Зиму обещают холодную.
	} else	{
		AI_Output(self,other,"DIA_VLK_News_08_04");	//Губернатор недавно отбыл на материк. Корнелиус опять будет изображать из себя главного.
	};
};

instance DIA_VLK_8_Konkurs(C_Info)
{
	nr = 102;
	condition = DIA_VLK_8_Konkurs_Condition;
	information = DIA_VLK_8_Konkurs_Info;
	permanent = TRUE;
	description = "Ты участвуешь в конкурсе Константино?";
};

func int DIA_VLK_8_Konkurs_Condition()
{
	if (Wld_GetDay() <= Competition_LastDay)	{
		return TRUE;
	};
};

func void DIA_VLK_8_Konkurs_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_VLK_Konkurs_03_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_VLK_Konkurs_07_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_VLK_Konkurs_10_00");	//Ты участвуешь в конкурсе Константино?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_VLK_Konkurs_14_00");	//Ты участвуешь в конкурсе Константино?
	} else	{
		AI_Output(other,self,"DIA_VLK_Konkurs_16_00");	//Ты участвуешь в конкурсе Константино?
	};
	var int rnd;	rnd = Hlp_Random(4);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_VLK_Konkurs_08_01");	//Нет. Зачем мне это?
	} else if (rnd == 1)	{
		AI_Output(self,other,"DIA_VLK_Konkurs_08_02");	//Нет. У меня и других дел хватает.
	} else	{
		AI_Output(self,other,"DIA_VLK_Konkurs_08_03");	//А что, похоже, что я тут грибы собираю?
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_news.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_konkurs.npc = Hlp_GetInstanceID(slf);
};



