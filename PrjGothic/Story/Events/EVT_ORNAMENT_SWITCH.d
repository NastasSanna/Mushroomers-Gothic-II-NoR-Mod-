
var int Ornament_Switch_Counter;

func void Print_Ornament_Switch(var string text)
{
	PrintScreen(text, -1, 15,FONT_Screen,3);
};

func void EVT_Ornament_Switch_All()
{
	if (Ornament_Switch_Counter < 7)	{
		if (Ornament_Switch_Counter == 0)	{
			Print_Ornament_Switch("Какие-то кнопки.");
		}
		else	if (Ornament_Switch_Counter == 1)	{
			Print_Ornament_Switch("Интересно, зачем они?");
		}
		else	if (Ornament_Switch_Counter == 2)	{
			Print_Ornament_Switch("Наверное, сломалось.");
		}
		else	if (Ornament_Switch_Counter == 4)	{
			Print_Ornament_Switch("Все еще ничего не происходит.");
		}
		else	if (Ornament_Switch_Counter == 5)	{
			Print_Ornament_Switch("А может, не надо?");
		}
		else	{
			Print_Ornament_Switch("Ничего не происходит.");
		};
		Ornament_Switch_Counter += 1;
	}
	else	{
		Print_Ornament_Switch("Кто-то доигрался...");
		var string wp; wp = Npc_GetNearestWP(hero);
		if (Npc_GetDistToWP(self, wp) < PERC_DIST_INTERMEDIAT)	{
			Wld_InsertNpc(Angry_Ghost, wp);
		}
		else	{
			Wld_SpawnNpcRange(hero, Angry_Ghost,1, 150);
		};
		B_Attack(Angry_Ghost,hero,AR_KILL,0);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FIREARMOR",Angry_Ghost,Angry_Ghost,0,0,0,FALSE);
		Ornament_Switch_Counter = 5;
	};
};

func void evt_ornament_switch_bigfarm_01_func()
{
	evt_ornament_switch_All();
};

func void evt_ornament_switch_farm_01_func()
{
	evt_ornament_switch_All();
};

func void evt_ornament_switch_forest_01_func()
{
	evt_ornament_switch_All();
};
