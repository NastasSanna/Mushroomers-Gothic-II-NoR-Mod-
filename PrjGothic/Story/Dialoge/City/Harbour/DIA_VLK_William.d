
instance DIA_William_EXIT(DIA_Proto_End)
{
	npc = VLK_4304_Addon_William;
};

//===================================================
var int DIA_William_Hello_Once;
instance DIA_William_Hello(C_Info)
{
	npc = VLK_4304_Addon_William;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_William_MR_Hello_Info;
	permanent = TRUE;
	description = "Как рыбалка?";
};
func void DIA_William_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_William_MR_Hello_03_00");	//Как рыбалка?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_William_MR_Hello_07_00");	//Как рыбалка?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_William_MR_Hello_10_00");	//Как рыбалка?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_William_MR_Hello_14_00");	//Как рыбалка?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_William_MR_Hello_16_00");	//Как рыбалка?
	};
	if (Wld_GetDay() > Fishers_Rain_Day)	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_04");	//Фарим как всегда во всем прав.
		AI_Output(self,other,"DIA_William_MR_Hello_16_05");	//Как только он даст добро, выйдем в море.
		DIA_William_Hello_Once = TRUE;
	}
	else if (DIA_William_Hello_Once == FALSE)	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_01");	//Недавно был шторм и вся рыба ушла на дно.
		AI_Output(self,other,"DIA_William_MR_Hello_16_02");	//Еще и воды холодной нанесло. В такой и околеть недолго.
		AI_Output(self,other,"DIA_William_MR_Hello_16_03");	//Я пытаюсь уговорить Фарима попытать счастья подальше от берега, но он наотрез отказывается.
		DIA_William_Hello_Once = TRUE;
	}
	else 	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_06");	//Ждем хорошей погоды.
	};
};

