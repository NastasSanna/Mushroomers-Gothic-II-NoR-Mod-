/**************************************************************************

						МАГИЧЕСКИЙ УРОН

B_MagicHurtNpc	(slf,	oth,	damage)
  Персонаж slf (я) наносит урон oth (он) величиной damage с помощью магии

//NS: в принципе, необязательно магией. Любой урон, не обрабатывающийся движком
  
***************************************************************************/

func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	// нанесение урона
	Npc_ChangeAttribute(oth,ATR_HITPOINTS,-damage);
	// если повреждение несовместимо с жизнью
	if(Npc_IsDead(oth))
	{
		// выдать ГГ опыт 
		//Ns: в ZS_Dead не сработает, т.к. не задан other
		if((Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(slf.level * XP_PER_VICTORY);
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
		// сообщить окружающим об убийстве
		Npc_SendPassivePerc(oth,PERC_ASSESSMURDER,slf,oth);//NS: добавлено 
	}
	else // если жертва еще жива
	{
		// сообщить окружающим о нападении
		Npc_SendPassivePerc(oth,PERC_ASSESSFIGHTSOUND,slf,oth);//NS: добавлено 
	};
};

