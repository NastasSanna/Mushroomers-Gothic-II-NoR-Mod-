

instance DIA_Maria_EXIT(DIA_Proto_End)
{
	npc = BAU_910_Maria;
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Maria_Elena_Start(C_Info)
{
	npc = BAU_910_Maria;				nr = 0;
	condition = DIA_Maria_Elena_Start_Cond;
	information = DIA_Maria_Elena_Start_Info;
	important = TRUE;
};
func int DIA_Maria_Elena_Start_Cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Maria_Elena_Start_Info()
{
	AI_Output(self,other,"DIA_Maria_Elena_Start_17_00");	//Дочка, ты опять приключений ищешь?
	AI_Output(self,other,"DIA_Maria_Elena_Start_17_01");	//Замуж тебе пора, а не по лесам шастать. Избаловал тебя отец!
};
//===================================================
instance DIA_Maria_Elena_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 1;
	condition = DIA_Maria_Elena_Perm_Cond;
	information = DIA_Maria_Elena_Perm_Info;
	description = "И за кого же мне замуж пора?";
	permanent = TRUE;
};
func int DIA_Maria_Elena_Perm_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Maria_Elena_Perm_Info()
{
	AI_Output(other,self,"DIA_Maria_Elena_Perm_16_00");	//И за кого же мне замуж пора?
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_01");	//Ты у нас в город ходишь, там и поищи!
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_02");	//Наверняка есть какой-нибудь красавец-богач, которому нужна хозяйственная женушка.
	}
	else	{
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_03");	//Да вот хоть за Тилла, сына соседского.
			AI_Output(other,self,"DIA_Maria_Elena_Perm_16_04");	//За малыша Тилла?
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_05");	//Он уже не такой и малыш. Добрый хороший мальчик. И отец не бедный, хоть и с характером...
	};
};


/////////////////////////////////////// ТИЛЛ /////////////////////////////////////////////

//===================================================
instance DIA_Maria_Till_Hello(C_Info)
{
	npc = BAU_910_Maria;				nr = 11;
	condition = DIA_Maria_Till_MR_Hello_Cond;
	information = DIA_Maria_Till_MR_Hello_Info;
	description = "Здравствуйте, госпожа Мария!";
};
func int DIA_Maria_Till_MR_Hello_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Maria_Till_MR_Hello_Info()
{
	AI_Output(other,self,"DIA_Maria_Till_MR_Hello_14_00");	//Здравствуйте, госпожа Мария!
		AI_Output(self,other,"DIA_Maria_Till_MR_Hello_17_01");	//Здравствуй,.. Тилл! Как ты вырос-то! Не сразу тебя узнала.
};

//===================================================
instance DIA_Maria_Till_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 12;
	condition = DIA_Maria_Till_Perm_Cond;
	information = DIA_Maria_Till_Perm_Info;
	description = "Как Ваше здоровье?";
	permanent = TRUE;
};
func int DIA_Maria_Till_Perm_Cond()
{
	if (C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Maria_Till_Hello))	{
		return TRUE;
	};
};
func void DIA_Maria_Till_Perm_Info()
{
	AI_Output(other,self,"DIA_Maria_Till_Perm_14_00");	//Как Ваше здоровье?
		AI_Output(self,other,"DIA_Maria_Till_Perm_17_01");	//Не жалуюсь, спасибо.
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
instance DIA_Maria_MR_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 20;
	condition = DIA_Maria_MR_Perm_Cond;
	information = DIA_Maria_MR_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Maria_MR_Perm_Cond()
{
	if (!C_HeroIs_Elena() && !C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Maria_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Maria_MR_Perm_17_00");	//У тебя какое-то дело? Тогда поговори с моим мужем.
	AI_StopProcessInfos(self);
};
