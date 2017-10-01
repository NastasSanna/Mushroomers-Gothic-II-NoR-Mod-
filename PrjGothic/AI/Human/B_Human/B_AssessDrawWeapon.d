/**************************************************************************

						ВОСПРИЯТИЕ УГРОЗЫ ОРУЖИЕМ

  Персонаж self (я) заметил, что other (он) достал оружие.
  
  B_AssessDrawWeapon()  возвращает TRUE, если я перешел в состояние реакции
на обнаженное оружие ZS_ReactToWeapon, если нет - FALSE. Обрабатывает 
восприятие PERC_DRAWWEAPON и вызывается в скриптах при восприятии ГГ.

  Обычная реакция: напасть на доставшего оружие.

***************************************************************************/


func int B_AssessDrawWeapon()
{
	//НЕ реагировать, если -------------------------------------------------
	// он не в режиме сражения (сторонний вызов или до меня долго доходило)
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		return FALSE;
	};
	
	// он далеко
	if ((Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG) || (Npc_GetHeightToNpc(self,other) > PERC_DIST_DIALOG))
	{
		return FALSE;
	};
	
	// меня не должно волновать, что он достал оружие
	if(!C_NpcIsBotheredByWeapon(self,other))
	{
		return FALSE;
	};
	
	// я уже среагировал
	if(Npc_IsInState(self,ZS_ReactToWeapon))
	{
		return FALSE;
	};
	
	// я наблюдаю за ним после драки
	if(Npc_IsInState(self,ZS_ObservePlayer) && Npc_WasInState(self,ZS_WatchFight))
	{
		return FALSE;
	};
	
	// я его не вообще вижу
	if(!Npc_CanSeeNpc(self,other))
	{
		return FALSE;
	};
	
	//на стрельбище можно стрелять
	if(Npc_HasReadiedRangedWeapon(other)
		&& ((Npc_GetDistToWP(other,"NW_CITY_HABOUR_KASERN_SHOOT") < 500) || (Npc_GetDistToWP(other,"NW_CITY_HABOUR_KASERN_17") < 500)))	{
		return FALSE;
	};
	
	//В остальных случаях ------------------------------------------------
	
	// сбросить другие действия и восприятия
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// реагировать на угрозу оружием
	AI_StartState(self,ZS_ReactToWeapon,0,"");	// немедленно среагировать, где стою
	return TRUE;
};

