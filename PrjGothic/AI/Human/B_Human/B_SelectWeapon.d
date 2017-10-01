/**************************************************************************

							ВЫБРАТЬ ОРУЖИЕ
 
  B_SelectWeapon	(slf,	oth)
  Персонаж slf (я) выбирает оружие для сражения с oth.
Вызывается в функциях ZS_x, связанных со сражением.
  
  Оружие можно достать, оставить прежнее или сменить одно на другое.
  Выполняется проверка выбора заклинания вместо оружия (вызов B_SelectSpell).
  Оружие ближнего боя меняется на дальний бой, только если slf хочет убить
oth. Но если у slf нет оружия ближнего боя, то он будет сражаться тем, что 
есть, независимо от цели.
  
***************************************************************************/


func void B_SelectWeapon(var C_Npc slf,var C_Npc oth)
{
	// ОТКАЗАТЬСЯ ОТ ВЫБОРА ОРУЖИЯ ------------------------------------------
	
	// если он падает, плывет или нырнул
	if(C_BodyStateContains(slf,BS_FALL)
		|| C_BodyStateContains(slf,BS_SWIM)
		|| C_BodyStateContains(slf,BS_DIVE))
	{
		return;
	};
	
	// МАГИЧЕСКАЯ АТАКА -----------------------------------------------------
		
	// если я выбрал заклинание для атаки //PB: для магов, паладинов и ищущих
	if(B_SelectSpell(slf,oth))
	{
		return;  // нет дальнейшего выбора, сражатсья магией
	};
	
	// атаковать БЕЗ МАГИИ ---------------------------------------------------
	
	// сменить магию на ближний бой, если	
	// если я атаковал магией до этого
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		// убрать оружие
		B_RemoveWeapon(slf);
		// достать оружие ближнего боя
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	
	// ОСТАВИТЬ ПРЕЖНЕЕ ОРУЖИЕ -----------------------------------------------
	
	// оставить оружие дальнего боя, если	
	// я уже сражаюсь с дальнобойным оружием
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		// и он достаточно далеко или у меня нет оружия ближнего боя
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER)
			|| !Npc_HasEquippedMeleeWeapon(slf))
		{
			return;
		};
	};
	
	// оставить оружие ближнего боя, если
	// я уже сражаюсь с оружием ближнего боя
	if(Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		// и он достаточно близко или у меня нет оружия дальнего боя
		if((Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER)
			|| !Npc_HasEquippedRangedWeapon(slf))
		{
			return;
		};
	};
	
	// СМЕНИТЬ ОРУЖИЕ ---------------------------------------------------------
	
	// на ближний бой
	// если у меня оно есть и он достаточно близко
	if(Npc_HasEquippedMeleeWeapon(slf) && (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		// если надо, спрятать оружие
		B_RemoveWeapon(slf);
		// достать оружие ближнего боя
		AI_ReadyMeleeWeapon(slf);
		return;
	};
		
	// на дальний бой
	// если у меня оно есть, и он достаточно далеко, и я его хочу убить
	if(Npc_HasEquippedRangedWeapon(slf) && ((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf)) && C_NpcHasAttackReasonToKill(slf))
	{
		//MEM_Debug("B_SelectWeapon Ready Far");
		// если надо, спрятать оружие
		B_RemoveWeapon(slf);
		// достать оружие ближнего боя
		AI_ReadyRangedWeapon(slf);
		return;
	};
	
	// ДОСТАТЬ ОРУЖИЕ --------------------------------------------------------
	
	// если я еще не сражаюсь
	if(Npc_IsInFightMode(slf,FMODE_NONE))
	{
		//MEM_Debug("B_SelectWeapon No Fight Yet");
		// если я вооружен для дальнего боя - дальний бой
		if(Npc_HasEquippedRangedWeapon(slf) && ((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf)) && C_NpcHasAttackReasonToKill(slf))
		{
			//MEM_Debug("B_SelectWeapon Ready Far");
			AI_ReadyRangedWeapon(slf);
			return;
		};
		// если я вооружен для ближнего боя - достаю оружие ближнего боя
		if(Npc_HasEquippedMeleeWeapon(slf))
		{
			//MEM_Debug("B_SelectWeapon Ready Melee");
			AI_ReadyMeleeWeapon(slf);
			return;
		};
		//MEM_Debug("B_SelectWeapon Ready Fist");
		// если ничего нет, будем драться на кулаках
		AI_ReadyMeleeWeapon(slf);
		return;
	};
};

