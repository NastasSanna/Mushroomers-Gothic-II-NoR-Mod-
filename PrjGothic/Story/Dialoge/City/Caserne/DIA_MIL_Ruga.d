
instance DIA_Ruga_EXIT(DIA_Proto_End)
{
	npc = Mil_317_Ruga;
};

//==============================================
instance DIA_Ruga_WhatAUDoing(C_INFO)
{
	nr = 1;
	npc = Mil_317_Ruga;
	condition = DIA_NoCond_cond;
	information = DIA_Ruga_WhatAUDoing_info;
	permanent = TRUE;
	description = "Чем ты занимаешься?";
};
func void DIA_Ruga_WhatAUDoing_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_03_00");	//Чем ты занимаешься?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_07_00");	//Чем ты занимаешься?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_10_00");	//Чем ты занимаешься?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_14_00");	//Чем ты занимаешься?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_16_00");	//Чем ты занимаешься?
	};
	AI_Output(self,other,"DIA_Ruga_WhatAUDoing_14_01");	//Учу стражников стрелять из арбалета.
	AI_Output(self,other,"DIA_Ruga_WhatAUDoing_14_02");	//Но Вульфгар делает упор на силовые упражнения, так что большую часть времени я тренирую сам себя.
};

//==============================================
var int DIA_Ruga_Training_Once;
instance DIA_Ruga_Training(C_INFO)
{
	nr = 2;
	npc = Mil_317_Ruga;
	condition = DIA_Ruga_Training_cond;
	information = DIA_Ruga_Training_info;
	permanent = TRUE;
	description = "Я могу потренироваться с тобой?";
};
func int DIA_Ruga_Training_cond()
{
	return TRUE;
};
func void DIA_Ruga_Training_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Ruga_Training_03_00");	//Я могу потренироваться с тобой?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Ruga_Training_07_00");	//Я могу потренироваться с тобой?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Ruga_Training_10_00");	//Я могу потренироваться с тобой?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Ruga_Training_14_00");	//Можно потренироваться с тобой?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Ruga_Training_16_00");	//Я могу потренироваться с тобой?
	};
	AI_Output(self,other,"DIA_Ruga_Training_14_01");	//Ты можешь потренироваться и без меня.
	AI_Output(self,other,"DIA_Ruga_Training_14_02");	//Эти мишени никуда не уходят, и хотя бы одна всегда свободна.
	AI_Output(self,other,"DIA_Ruga_Training_14_03");	//Или ты знаешь лучший способ тренировки, чем стрельба?
	if (!DIA_Ruga_Training_Once)	{
		DIA_Ruga_Training_Once = TRUE;
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Ruga);
	};
};


