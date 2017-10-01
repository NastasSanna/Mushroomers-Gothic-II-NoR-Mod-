
func int B_GetBestPlayerMap()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
		{
			return ItWr_Map_NewWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
		{
			return ItWr_Map_Shrine_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
		{
			return ItWr_Map_Caves_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
		{
			return ItWr_Map_NewWorld_City;
		};
	};
	return 0;
};

func int B_GetAnyPlayerMap()
{
	if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
	{
		return ItWr_Map_NewWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
	{
		return ItWr_Map_Shrine_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
	{
		return ItWr_Map_Caves_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
	{
		return ItWr_Map_NewWorld_City;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int OldInstance;
	var int NewInstance;
	OldInstance = B_GetPlayerMap();
	if((OldInstance > 0) && (Npc_HasItems(hero,OldInstance) < 1))
	{
		OldInstance = 0;
	};
	B_SetPlayerMap(OldInstance);
	NewInstance = OldInstance;
	if((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};
	if(NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	};
	return OldInstance;
};

func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Mana_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Mana_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Mana_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,ItPo_Mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Mana_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Mana_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Mana_03);
				B_LameSchlork();
			}
			else
			{
				Print("Нет зелий маны!");
			};
		}
		else
		{
			Print("Уже максимальная мана!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Health_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Health_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Health_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,ItPo_Health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Health_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Health_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Health_03);
				B_LameSchlork();
			}
			else
			{
				Print("Нет лечебных зелий!");
			};
		}
		else
		{
			Print("Уже максимальное здоровье!");
		};
	};
};

