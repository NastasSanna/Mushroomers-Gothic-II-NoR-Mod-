/**************************************************************************

						УМЕРЕТЬ ИЛИ ОТКЛЮЧИТЬСЯ?

  int C_DropUnconscious	()
  Что произойдет с other после поражения в битве: TRUE - упадет без сознания,
FALSE - умрет.
  Вызывается в ZS_Dead.
  
  Зависит от гильдий self (я) и other (он), а также от переменной
AIV_DropDeadAndKill. Однозначно умирают и убивают монстры, бандиты и ищущие.
  В общем случае возвращает FALSE, т.е. other умрет.
 
***************************************************************************/


func int C_DropUnconscious()
{
	// если он  
	if((other.guild > GIL_SEPERATOR_HUM)		//монстр,
		|| (other.guild == GIL_DMT)				//ищущий
		|| (other.guild == GIL_BDT)				//или бандит,
		|| (other.aivar[AIV_DropDeadAndKill] == TRUE)) //или сражается насмерть
	{
		// то он умрет
		return FALSE;
	};
	
	// если он из другой гильдии и смертельный исход не задан, то
	
	// если я человек
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		// и я
		if((self.guild != GIL_DMT)			// не ищущий,
			&& (self.guild != GIL_BDT)		// и не бандит
			&& (self.aivar[AIV_DropDeadAndKill] == FALSE)) //и я не сражаюсь насмерть
		{
			// то он упадет без сознания
			return TRUE;
		};
	};
	
	// В остальных случаях
	
	// он умрет
	return FALSE;
};

