

instance DIA_Opolos_EXIT(DIA_Proto_End)
{
	npc = NOV_605_Opolos;
};

/////////////////////////////////////// ОДО /////////////////////////////////////////////

//===================================================
instance DIA_Opolos_Sheep_Odo(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 0;
	condition = DIA_Opolos_Sheep_Odo_Cond;
	information = DIA_Opolos_Sheep_Odo_Info;
	permanent = TRUE;
	description = "Как наши овцы?";
};
func int DIA_Opolos_Sheep_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MonasterySheep_Dead_Cnt < 4))	{
		return TRUE;
	};
};
func void DIA_Opolos_Sheep_Odo_Info()
{
	AI_Output(other,self,"DIA_Opolos_Sheep_Odo_03_00");	//Как наши овцы?
	if (MonasterySheep_Dead_Cnt > 0)	{
		AI_Output(self,other,"DIA_Opolos_Sheep_Odo_12_01");	//(грустно) Те, что остались, в порядке...
	}
	else {
		AI_Output(self,other,"DIA_Opolos_Sheep_Odo_12_02");	//(гордо) С овцами все хорошо!
	};
};

//===================================================
instance DIA_Opolos_Bored_Odo(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Bored_Odo_Cond;
	information = DIA_Opolos_Bored_Odo_Info;
	permanent = TRUE;
	description = "Тебе не надоело следить за ними?";
};
func int DIA_Opolos_Bored_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Opolos_Bored_Odo_Info()
{
	AI_Output(other,self,"DIA_Opolos_Bored_Odo_03_00");	//Тебе не надоело следить за ними?
	if (MonasterySheep_Dead_Cnt == 4)	{
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_01");	//Сейчас, когда овец не стало, я даже скучаю по ним...
	}
	else {
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_02");	//Мастер поручил мне эту работу и я с ней справлюсь!
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_03");	//Но когда-нибудь мне позволят читать писания, или изучать алхимию, или даже выберут для Испытания...
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_04");	//На все воля Инноса, как говорит мастер Парлан.
	};
};

