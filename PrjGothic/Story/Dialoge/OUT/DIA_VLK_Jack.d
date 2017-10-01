
instance DIA_Jack_EXIT(DIA_Proto_End)
{
	npc = VLK_444_Jack;
};

///////////////////////////// ВСЕ ///////////////////////////////
//-----------------------------------------
instance DIA_Jack_Hello(C_INFO)
{
	npc = VLK_444_Jack;			nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Jack_MR_Hello_info;
	important = TRUE;
};
func void DIA_Jack_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Jack_MR_Hello_12_01");	//Каким ветром тебя сюда занесло, сухопутная крыса?
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_MR_Hello_03_00");	//Грибы собираю.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_MR_Hello_07_00");	//Грибы собираю.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_MR_Hello_10_00");	//Грибным. Нынче самая пора.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_MR_Hello_14_00");	//Грибы собираю.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_MR_Hello_16_00");	//По грибы.
	};
};
//-----------------------------------------
instance DIA_Jack_WhoAreU(C_INFO)
{
	npc = VLK_444_Jack;			nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Jack_WhoAreU_info;
	description = "Ты смотритель маяка?";
};
func void DIA_Jack_WhoAreU_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_WhoAreU_03_00");	//Ты смотритель маяка?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_WhoAreU_07_00");	//Ты смотритель маяка?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_WhoAreU_10_00");	//Ты смотритель маяка?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_WhoAreU_14_00");	//Ты смотритель маяка?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_WhoAreU_16_00");	//Ты смотритель маяка?
	};
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_01");	//Точно так. В молодости я немало походил по морям, а потом бросил якорь в этом порту.
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_02");	//Это было еще до войны, и город, и порт смотрелись куда бодрее.
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_03");	//А теперь мы с Мэри наблюдаем, как все приходит в упадок.
};
//-----------------------------------------
instance DIA_Jack_WhoIsMary(C_INFO)
{
	npc = VLK_444_Jack;			nr = 3;
	condition = DIA_Jack_WhoIsMary_cond;
	information = DIA_Jack_WhoIsMary_info;
	description = "А кто такая Мэри?";
};
func int DIA_Jack_WhoIsMary_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoAreU))	{
		return TRUE;
	};
};
func void DIA_Jack_WhoIsMary_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_WhoIsMary_03_00");	//А кто такая Мэри? Твоя жена?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_WhoIsMary_07_00");	//А кто такая Мэри? Твоя жена?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_WhoIsMary_10_00");	//А кто такая Мэри? Твоя жена?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_WhoIsMary_14_00");	//А кто такая Мэри? Твоя жена?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_WhoIsMary_16_00");	//А кто такая Мэри? Твоя жена?
	};
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_01");	//Можно и так сказать. Я так назвал свой маяк.
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_02");	//Мы с ней сроднились за эти годы. И с ней я, скорее всего, проведу остаток своих дней.
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_03");	//У нее горячее сердце и прекрасные формы.
};
//-----------------------------------------
instance DIA_Jack_Dangers(C_INFO)
{
	npc = VLK_444_Jack;			nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_Jack_Dangers_info;
	description = "Тут опасно?";
};
func void DIA_Jack_Dangers_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_Dangers_03_00");	//Тут опасно?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_Dangers_07_00");	//Тут опасно?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_Dangers_10_00");	//Тут опасно?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_Dangers_14_00");	//Тут опасно?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_Dangers_16_00");	//Тут опасно?
	};
	AI_Output(self,other,"DIA_Jack_Dangers_12_01");	//Лесные твари стараются не приближаться к свету маяка.
	AI_Output(self,other,"DIA_Jack_Dangers_12_02");	//Но если ты углубишься в лес, то наверняка на них наткнешься.
};
//-----------------------------------------
instance DIA_Jack_HowIsMary(C_INFO)
{
	npc = VLK_444_Jack;			nr = 10;
	condition = DIA_Jack_HowIsMary_cond;
	information = DIA_Jack_HowIsMary_info;
	description = "Как поживает Мэри?";
	permanent = TRUE;
};
func int DIA_Jack_HowIsMary_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoIsMary))	{
		return TRUE;
	};
};
func void DIA_Jack_HowIsMary_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_HowIsMary_03_00");	//Как поживает Мэри?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_HowIsMary_07_00");	//Как поживает Мэри?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_HowIsMary_10_00");	//Как поживает Мэри?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_HowIsMary_14_00");	//Как поживает Мэри?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_HowIsMary_16_00");	//Как поживает Мэри?
	};
	AI_Output(self,other,"DIA_Jack_HowIsMary_12_01");	//Горяча, как и всегда.
};
//-----------------------------------------
instance DIA_Jack_AULonely(C_INFO)
{
	npc = VLK_444_Jack;			nr = 11;
	condition = DIA_Jack_AULonely_cond;
	information = DIA_Jack_AULonely_info;
	description = "Тебе здесь не одиноко?";
	permanent = TRUE;
};
func int DIA_Jack_AULonely_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoAreU))	{
		return TRUE;
	};
};
func void DIA_Jack_AULonely_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Jack_AULonely_03_00");	//Тебе здесь не одиноко?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Jack_AULonely_07_00");	//Тебе здесь не одиноко?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Jack_AULonely_10_00");	//Тебе здесь не одиноко?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Jack_AULonely_14_00");	//Тебе здесь не одиноко?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Jack_AULonely_16_00");	//Тебе здесь не одиноко?
	};
	AI_Output(self,other,"DIA_Jack_AULonely_12_01");	//Нет, пока Мэри со мной.
	AI_Output(self,other,"DIA_Jack_AULonely_12_02");	//Но я мечтаю еще хотя бы раз выйти в море, до того, как моя душа отправится в чертоги смерти.
};

