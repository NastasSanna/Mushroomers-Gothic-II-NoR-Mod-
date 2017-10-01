/******************************************************************
                            КОНЕЦ ИГРЫ
  UNFINISHED: ScoreTable
*******************************************************************/

var int DoExitGame;

// ВЫХОД ----------------------------------------
instance PC_GameOver_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_GameOver_End_Condition;
	information = PC_GameOver_End_Info;
	permanent = TRUE;
	description = "Завершить игру (КОНЕЦ)";
};


func int PC_GameOver_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Lost) || (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Won))
	{
		return TRUE;
	};
};

func void PC_GameOver_End_Info()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	DoExitGame = TRUE;
	//выход в цикле, здесь зависнем
};

//===============================================================

// не удалось завершить игру
func void B_GameOver_Lose()
{
		Print_Ext(-1,2,"Конец игры.",FONT_Screen,COL_Red,5);
	PC_GameOver_End.npc = Hlp_GetInstanceID(other);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	hero.aivar[AIV_INVINCIBLE] = TRUE;
	AI_ProcessInfos(hero);
};

// выиграли
func void B_GameOver_Win()
{
		Print_Ext(-1,2,"Победа!",FONT_Screen,COL_Green,5);
	PC_GameOver_End.npc = Hlp_GetInstanceID(hero);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Won;
	hero.aivar[AIV_INVINCIBLE] = TRUE;
	AI_ProcessInfos(hero);
};

