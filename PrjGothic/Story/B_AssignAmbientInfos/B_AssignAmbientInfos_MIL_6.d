
instance DIA_MIL_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_6_EXIT_Condition;
	information = DIA_MIL_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_ImBusy(C_Info)
{
	nr = 101;
	condition = DIA_MIL_6_ImBusy_Condition;
	information = DIA_MIL_6_ImBusy_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_MIL_6_ImBusy_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))	{
		return TRUE;
	};
};

func void DIA_MIL_6_ImBusy_Info()
{
	if (Npc_WasInState(self, ZS_Sleep)
		|| Npc_WasInState(self, ZS_Sit_Bench) || Npc_WasInState(self, ZS_Sit_Campfire) || Npc_WasInState(self, ZS_Sit_Chair))	{
		AI_Output(self,other,"DIA_MIL_6_ImBusy_06_03");	//Не видишь, я отдыхаю.
		if ((other.aivar[AIV_GENDER] == FEMALE) && (Hlp_Random(100) < 20))	{
				AI_Output(self,other,"DIA_MIL_6_ImBusy_06_04");	//Может хочешь со мной, красотка?
		};
	} else if (Npc_WasInState(self, ZS_Practice_Sword) || Npc_WasInState(self, ZS_Practice_RangedWeapon))	{
		AI_Output(self,other,"DIA_MIL_6_ImBusy_06_02");	//Не мешай тренироваться.
	} else	{
		AI_Output(self,other,"DIA_MIL_6_ImBusy_06_01");	//Не отвлекай меня! Я на службе.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_MIL_6(var C_Npc slf)
{
	dia_MIL_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_MIL_6_ImBusy.npc = Hlp_GetInstanceID(slf);
};




