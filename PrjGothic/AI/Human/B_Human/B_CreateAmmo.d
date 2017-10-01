/**************************************************************************

							СОЗДАТЬ БОЕПРИПАСЫ
 
  B_CreateAmmo	(slf)
  При необходимости создает в инвентаре slf (я) новые боеприпасы (стрелы 
или болты). Вызывается в ZS_Attack и ZS_MM_Attack (для скелетов и орков).

  Включает проверку наличия и типа дальнобойного оружия. Создаются только
обычные стрелы и болты, 
  
  Таким образом, боеприпасы у всех NPC нескончаемые!
  
***************************************************************************/

func void B_CreateAmmo(var C_Npc slf)
{
	// внутренняя переменная
	var C_Item rangedWeapon; //используемое оружие дальнего боя
	
	// если я в режиме дальнего боя
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		// проверить, какое у меня оружие наготове
		rangedWeapon = Npc_GetReadiedWeapon(slf);
	}
	// если не в бою, но экипирован оружием дальнего боя
	else if(Npc_HasEquippedRangedWeapon(slf))
	{
		// проверить, каким оружием дальнего боя я экипирован
		rangedWeapon = Npc_GetEquippedRangedWeapon(slf);
	}
	// если нет оружия дальнего боя
	else
	{
		return; // ничего не делать
	};
	
	// если оружие заряжается стрелами
	if(rangedWeapon.munition == ItRw_Arrow)
	{
		// и у меня их меньше 10
		if(Npc_HasItems(slf,ItRw_Arrow) < 10)
		{
			// создать в инвентаре еще 10 стрел
			CreateInvItems(slf,ItRw_Arrow,10);
		};
	}
	// если оружие заряжается болтами
	else if(rangedWeapon.munition == ItRw_Bolt)
	{
		// и у меня их меньше 10
		if(Npc_HasItems(slf,ItRw_Bolt) < 10)
		{
			// создать в инвентаре еще 10 болтов
			CreateInvItems(slf,ItRw_Bolt,10);
		};
	};
};

