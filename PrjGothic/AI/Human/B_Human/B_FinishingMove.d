/**************************************************************************

							ДОБИТЬ ПОВЕРЖЕННОГО

  B_FinishingMove	(slf,	oth)
  Персонаж slf наносит смертельный удар бессознательному oth.
Вызывается из ZS_Attack вместо непосредственного вызова AI_FinishingMove.
При необходимости переводит slf в режим боя и вооружение его ржавым мечом.
   
***************************************************************************/


func void B_FinishingMove(var C_Npc slf,var C_Npc oth)
{
	// если я не в режиме боя
	if(!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		// если есть оружие ближнего боя
		if (Npc_HasEquippedMeleeWeapon(slf))
		{
			// достать его
			var C_Item weapon;
			weapon = Npc_GetEquippedMeleeWeapon(slf);
			Npc_SetToFightMode(slf, weapon);
		}
		else // если нет
		{
			// перейти в боевой режим с ржавым мечом
			Npc_SetToFightMode(slf,ItMw_1h_MISC_Sword);
		};
	};
	
	// нанести смертельный удар 
	AI_FinishingMove(slf,oth);
};

