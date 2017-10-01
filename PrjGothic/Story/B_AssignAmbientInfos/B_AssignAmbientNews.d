
instance DIA_Ambient_NEWS(C_Info)
{
	nr = 1;
	condition = DIA_Ambient_NEWS_Condition;
	information = DIA_Ambient_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ambient_NEWS_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (B_GetPlayerCrime(self) != CRIME_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ambient_NEWS_Info()
{
	if(B_GetPlayerCrime(self) == CRIME_SHEEPKILLER)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$SHEEPKILLER_CRIME");
		}
		else	{
			B_Say(self,other,"$SHEEPKILLER_CRIME_F");
		};
	};
	if(B_GetPlayerCrime(self) == CRIME_ATTACK)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$ATTACK_CRIME");
		}
		else	{
			B_Say(self,other,"$ATTACK_CRIME_F");
		};
	};
	if(B_GetPlayerCrime(self) == CRIME_THEFT)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$THEFT_CRIME");
		}
		else	{
			B_Say(self,other,"$THEFT_CRIME_F");
		};
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientNEWS(var C_Npc slf)
{
	DIA_Ambient_NEWS.npc = Hlp_GetInstanceID(slf);
};

