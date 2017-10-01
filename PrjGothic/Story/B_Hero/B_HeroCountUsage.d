
func void B_HeroCountUsage()
{
	if (hero.guild > GIL_SEPERATOR_HUM)	{ return;};
	var C_ITEm hero_weapon;
	if (Npc_IsInFightMode(hero,FMODE_FIST))	{
		Hero_Counter_STR += 2;
//		Print(ConcatStrings("STR + 2 =",IntToString(Hero_Counter_STR)));
	}
	else if (Npc_IsInFightMode(hero,FMODE_MELEE))	{
		hero_weapon = Npc_GetReadiedWeapon(hero);
		Hero_Counter_STR += 1;
//		Print(ConcatStrings("STR + 1 =",IntToString(Hero_Counter_STR)));
		if (HasAnyFlags(hero_weapon.flags,ITEM_AXE | ITEM_SWD))	{
			Hero_Counter_H1 += 1;
//			Print(ConcatStrings("H1 + 1 =",IntToString(Hero_Counter_H1)));
		}
		else if (HasAnyFlags(hero_weapon.flags,ITEM_2HD_SWD | ITEM_2HD_AXE))	{
			Hero_Counter_H2 += 1;
//			Print(ConcatStrings("H2 + 1 =",IntToString(Hero_Counter_H2)));
		};
		//шпага и т.п., которые требуют ловкости
		if (hero_weapon.cond_atr[2] == ATR_DEXTERITY)	{
			Hero_Counter_DEX += 1;
		};
	}
	else if (Npc_IsInFightMode(hero,FMODE_FAR))	{
		hero_weapon = Npc_GetReadiedWeapon(hero);
		Hero_Counter_DEX += 1;
//		Print(ConcatStrings("DEX + 1 =",IntToString(Hero_Counter_DEX)));
		hero_weapon = Npc_GetReadiedWeapon(hero);
		if (HasAnyFlags(hero_weapon.flags,ITEM_BOW))	{
			Hero_Counter_Bow += 1;
//			Print(ConcatStrings("Bow + 1 =",IntToString(Hero_Counter_Bow)));
		}
		else if (HasAnyFlags(hero_weapon.flags,ITEM_CROSSBOW))	{
			Hero_Counter_STR += 1;
			Hero_Counter_CBow += 1;
//			Print(ConcatStrings("CBow + 1 =",IntToString(Hero_Counter_CBow)));
		};
	}; 
};

func void B_HeroCountUsage_Magic()
{
	if (Npc_IsInFightMode(hero,FMODE_MAGIC))	{
		Hero_Counter_MANA += 2;
	};
};


