/**************************************************************************

  int C_NpcHasAmbientNews	(slf)
  Есть ли у slf новости об окружающем мире: TRUE - есть, FALSE - нет.
 
***************************************************************************/

func int C_NpcHasAmbientNews(var C_Npc slf)
{
	// НЕТ НОВОСТЕЙ, если --------------------------------------------------
	
	// если установлен запрет на распространение слухов
	if(HasFlags(slf.aivar[AIV_Temper], TEMPER_NewsOverride))
	{
		return FALSE;
	};
	
	// ГГ не совершил преступления
	if(B_GetPlayerCrime(slf) == CRIME_NONE)
	{
		return FALSE;
	};
	
	// 
	return TRUE;
};


