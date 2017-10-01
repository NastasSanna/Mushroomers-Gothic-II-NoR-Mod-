
instance DIA_Cornelius_EXIT(DIA_Proto_End)
{
	npc = VLK_401_Cornelius;
};

//===================================================
instance DIA_Cornelius_MR_Perm(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Cornelius_MR_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};
func void DIA_Cornelius_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Cornelius_MR_Perm_13_00");	//ѕрием граждан только по 10, 15 и 23 дн€м каждого мес€ца. «апись на прием не позднее, чем за 10 дней...
	AI_Output(self,other,"DIA_Cornelius_MR_Perm_13_01");	//¬ любом случае, губернатора сейчас нет. ѕриходите после его возвращени€.
	AI_StopProcessInfos(self);
};