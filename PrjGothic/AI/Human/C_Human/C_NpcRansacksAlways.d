/**************************************************************************

  Обязательно ли slf обшаривает поверженного other (ГГ): TRUE - да, FALSE -
не обязятельно.
  
  Только для квестов!!!
 
***************************************************************************/

func int C_NpcRansacksAlways(var C_Npc slf)
{
	// ОБШАРИТЬ
	var C_NPC Garwig;
	Garwig = Hlp_GetNpc(Nov_608_Garwig);
	// если я Гарвиг и у ГГ есть Святой молот
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig)) && (Npc_HasItems(other,Holy_Hammer_MIS) > 0))
	{
		return TRUE;
	};
	
	//иначе НЕ ОБЯЗАТЕЛЬНО
	return FALSE;
};

