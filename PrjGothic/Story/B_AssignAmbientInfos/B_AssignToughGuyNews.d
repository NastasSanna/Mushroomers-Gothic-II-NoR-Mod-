
instance DIA_ToughGuy_NEWS(C_Info)
{
	nr = 100;
	condition = DIA_ToughGuy_NEWS_Condition;
	information = DIA_ToughGuy_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_ToughGuy_NEWS_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
		&& (self.aivar[AIV_LastFightComment] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_ToughGuy_NEWS_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$TOUGHGUY_ATTACKLOST");
		}
		else	{
			B_Say(self,other,"$TOUGHGUY_ATTACKLOST_F");
		};
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$TOUGHGUY_ATTACKWON");
		}
		else	{
			B_Say(self,other,"$TOUGHGUY_ATTACKWON_F");
		};
	}
	else
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$TOUGHGUY_PLAYERATTACK");
		}
		else	{
			B_Say(self,other,"$TOUGHGUY_PLAYERATTACK_F");
		};
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

func void B_AssignToughGuyNEWS(var C_Npc slf)
{
	DIA_ToughGuy_NEWS.npc = Hlp_GetInstanceID(slf);
};

