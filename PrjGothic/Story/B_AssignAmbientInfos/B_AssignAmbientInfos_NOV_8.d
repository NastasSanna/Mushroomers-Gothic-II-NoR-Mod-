
instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NOV_8_Intruder(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_Intruder_Condition;
	information = DIA_NOV_8_Intruder_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_NOV_8_Intruder_Condition()
{
	if (!C_HeroIs_Odo())	{
		return TRUE;
	};
};

func void DIA_NOV_8_Intruder_Info()
{
	var int rnd;	rnd = Hlp_Random(100);
	if (MON_Intruder_Once == FALSE)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_NOV_Intruder_08_00");	//Что ты тут делаешь? Тебе здесь не место.
			}
			else	{
				AI_Output(self,other,"DIA_NOV_Intruder_08_01");	//Как ты сюда попал? Тебе нечего здесь делать.
			};
		}
		else	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_NOV_Intruder_08_02");	//Что женщина делает в монастыре? Тебе здесь не место.
			}
			else	{
				AI_Output(self,other,"DIA_NOV_Intruder_08_03");	//Как ты сюда попала? Тебе нечего здесь делать.
			};
		};
		MON_Intruder_Once = TRUE;
	}
	else	{
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_NOV_Intruder_08_04");	//Ты снова здесь? Вон!
	};
	Hero_ThrowOut_Monastery = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_Odo_HowAU(C_Info)
{
	nr = 1;
	condition = DIA_NOV_8_Odo_HowAU_Condition;
	information = DIA_NOV_8_Odo_HowAU_Info;
	permanent = TRUE;
	description = "Как дела?";
};
func int DIA_NOV_8_Odo_HowAU_Condition()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_NOV_8_Odo_HowAU_Info()
{
		AI_Output(other,self,"DIA_OUT_HowAU_03_00");	//Как дела?
	AI_Output(self,other,"DIA_OUT_7_HowAU_07_03");	//Нормально.
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_NOV_8_exit.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Intruder.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Odo_HowAU.npc = Hlp_GetInstanceID(slf);
};
