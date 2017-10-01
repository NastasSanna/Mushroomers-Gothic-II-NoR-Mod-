
//===================================================
instance DIA_Bruno_HasYew(C_Info)
{
	npc = VLK_443_Arbeiter;
	nr = 1;
	condition = DIA_Bruno_HasYew_Cond;
	information = DIA_Bruno_HasYew_Info;
	description = "—кажи, у вас есть тис?";
};
func int DIA_Bruno_HasYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken)
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood)
		&& !Npc_KnowsInfo(other,DIA_Fabio_HasYew))	{
		return TRUE;
	};
};

func void DIA_Bruno_HasYew_Info()
{
	if (hero.voice == 3)	{			//ќдо/–уперт
		AI_Output(other,self,"DIA_Bruno_HasYew_03_00");	//—кажи, у вас есть тис?
	} else if (hero.voice == 7)	{		//“албин
		AI_Output(other,self,"DIA_Bruno_HasYew_07_00");	//—кажи, у вас есть тис?
	} else if (hero.voice == 10)	{	//Ёрол
		AI_Output(other,self,"DIA_Bruno_HasYew_10_00");	//—кажи, у вас есть тис?
	} else if (hero.voice == 14)	{	//“илл
		AI_Output(other,self,"DIA_Bruno_HasYew_14_00");	//—кажи, у вас есть тис?
	} else	{							//≈лена/—ара
		AI_Output(other,self,"DIA_Bruno_HasYew_16_00");	//—кажи, у вас есть тис?
	};
	AI_Output(self,other,"DIA_Bruno_HasYew_06_01");	//¬роде было еще немного. —проси у моего товарища, ‘абио.
	B_SetNameByIndex(VLK_442_Arbeiter,1);
	B_SetNameByIndex(VLK_443_Arbeiter,1);
};

