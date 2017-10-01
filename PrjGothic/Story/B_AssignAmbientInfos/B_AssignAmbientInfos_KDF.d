
instance DIA_KDF_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_KDF_EXIT_Condition;
	information = DIA_KDF_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDF_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDF_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDF_Intruder(C_Info)
{
	nr = 999;
	condition = DIA_KDF_Intruder_Condition;
	information = DIA_KDF_Intruder_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_KDF_Intruder_Condition()
{
	if (!C_HeroIs_Odo())	{
		AI_GotoNpc(self,hero);
		return TRUE;
	};
};

func void DIA_KDF_Intruder_Info()
{
	var int rnd;	rnd = Hlp_Random(100);
	if (MON_Intruder_Once == FALSE)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_KDF_Intruder_03_00");	//Что ты тут делаешь? Тебе здесь не место.
			}
			else	{
				AI_Output(self,other,"DIA_KDF_Intruder_03_01");	//Как ты сюда попал? Тебе нечего здесь делать.
			};
		}
		else	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_KDF_Intruder_03_02");	//Что женщина делает в монастыре? Тебе здесь не место.
			}
			else	{
				AI_Output(self,other,"DIA_KDF_Intruder_03_03");	//Как ты сюда попала? Тебе нечего здесь делать.
			};
		};
		MON_Intruder_Once = TRUE;
	}
	else	{
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_KDF_Intruder_03_04");	//Ты снова здесь? Вон!
	};
	Hero_ThrowOut_Monastery = TRUE;
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_KDF(var C_Npc slf)
{
	dia_KDF_exit.npc = Hlp_GetInstanceID(slf);
	DIA_KDF_Intruder.npc = Hlp_GetInstanceID(slf);
};


