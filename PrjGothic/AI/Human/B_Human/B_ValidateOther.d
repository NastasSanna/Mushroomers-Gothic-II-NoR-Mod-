/**************************************************************************

							ПРОВЕРКА OTHER

  B_ValidateOther	()
  Проверяет, установлен ли other, при необходимости инициализирует
и нацеливает self на other.

  Вызывается во время боя и бегства - при загрузке игры цель не установлена.
  
//NS: РУКАМИ НЕ ТРОГАТЬ!!!
   
***************************************************************************/

func void B_ValidateOther()
{
	// если other НЕ установлен (игра была загружена)
	if(!Hlp_IsValidNpc(other))
	{
		// записать в other последнюю цель self
		other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		// вновь нацелиться на него
		Npc_SetTarget(self,other);
		// запомнить, что игра была загружена
		self.aivar[AIV_LOADGAME] = TRUE;
	}
	// если other установлен (игру не загружали)
	else
	{
		// нацелиться на other
		Npc_GetTarget(self);
		// запомнить, что игра НЕ была загружена
		self.aivar[AIV_LOADGAME] = FALSE;
	};
	// в любом случае запомнить цель
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
};

