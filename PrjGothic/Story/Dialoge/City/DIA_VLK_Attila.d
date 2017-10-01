
instance DIA_Attila_EXIT(DIA_Proto_End)
{
	npc = VLK_494_Attila;
};
//===================================================
instance DIA_Attila_Punishment(C_Info)
{
	npc = VLK_494_Attila;
	nr = 0;
	condition = DIA_Attila_Punishment_Cond;
	information = DIA_Attila_Punishment_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Attila_Punishment_Cond()
{
	if (Hanna_Paid == -1)	{
		return TRUE;
	};
};
func void DIA_Attila_Punishment_Info()
{
	Hanna_Paid = 0;
	AI_DrawWeapon(VLK_494_Attila);
	AI_Output(self,other,"DIA_Attila_Punishment_09_00");	//За ночлег нужно платить.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"START");
	B_Attack(self,other,AR_GuardCalledToRoom,0);
};
//===================================================
instance DIA_Attila_Perm(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_MR_Perm_Cond;
	information = DIA_Attila_MR_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Attila_MR_Perm_Cond()
{
	if (DIA_WhenAsked_cond() && (Hanna_Paid != -1))	{
		return TRUE;
	};
};
func void DIA_Attila_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Attila_MR_Perm_09_00");	//Нам не о чем разговаривать.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
};
