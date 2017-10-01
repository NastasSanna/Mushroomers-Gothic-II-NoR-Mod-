
// ---------------------------------------------------------------------

//спаун еды на спец. SP
//виды еды: RICH, TAVERN, POOR, BAU
func void Spawn_Food(var int SPptr)
{
	if (!SPptr)	{return;};
	var zCSpawnPoint SP;	SP = _^(SPptr);
	var int rnd;
	if (HasFlags(SP.flags, SP_Food_Rich))	{
		rnd = Hlp_Random(7);
		if (rnd == 0)	{
			Spawn_Items(SPptr, ItFo_Bacon,100);
		}
		else if (rnd == 1)	{
			Spawn_Items(SPptr, ItFo_Sausage,100);
		}
		else if (rnd == 2)	{
			Spawn_Items(SPptr, ItFo_Cheese,100);
		}
		else if (rnd == 3)	{
			Spawn_Items(SPptr, ItFo_Stew,100);
		}
		else if (rnd == 4)	{
			Spawn_Items(SPptr, ItFo_Wine,100);
		}
		else if (rnd == 5)	{
			Spawn_Items(SPptr, ItFo_Apple,100);
		}
		else if (rnd == 6)	{
			Spawn_Items(SPptr, ItFo_Bread,100);
		};
	}
	else if (HasFlags(SP.flags, SP_Food_Tavern))	{
		rnd = Hlp_Random(9);
		if (rnd == 0)	{
			Spawn_Items(SPptr, ItFoMutton,100);
		}
		else if (rnd == 1)	{
			Spawn_Items(SPptr, ItFo_Sausage,100);
		}
		else if (rnd == 2)	{
			Spawn_Items(SPptr, ItFo_Cheese,100);
		}
		else if (rnd == 3)	{
			Spawn_Items(SPptr, ItFo_Stew,100);
		}
		else if (rnd == 4)	{
			Spawn_Items(SPptr, ItFo_Apple,100);
		}
		else if (rnd == 5)	{
			Spawn_Items(SPptr, ItFo_Bread,100);
		}
		else if (rnd == 6)	{
			Spawn_Items(SPptr, ItFo_Wine,100);
		}
		else if (rnd == 7)	{
			Spawn_Items(SPptr, ItFo_Booze,100);
		}
		else if (rnd == 8)	{
			Spawn_Items(SPptr, ItFo_Beer,100);
		};
	}
	else if (HasFlags(SP.flags, SP_Food_Poor))	{
		rnd = Hlp_Random(8);
		if (rnd == 0)	{
			Spawn_Items(SPptr, ItFo_Fish,100);
		}
		else if (rnd == 1)	{
			Spawn_Items(SPptr, ItFo_FishSoup,100);
		}
		else if (rnd == 2)	{
			Spawn_Items(SPptr, ItFo_SmellyFish,100);
		}
		else if (rnd == 3)	{
			Spawn_Items(SPptr, ItFo_Stew,100);
		}
		else if (rnd == 4)	{
			Spawn_Items(SPptr, ItFo_Apple,100);
		}
		else if (rnd == 5)	{
			Spawn_Items(SPptr, ItFo_Bread,100);
		}
		else if (rnd == 6)	{
			Spawn_Items(SPptr, ItFo_Water,100);
		}
		else if (rnd == 7)	{
			Spawn_Items(SPptr, ItFo_Booze,100);
		};
	}
	else if (HasFlags(SP.flags, SP_Food_Bau))	{
		rnd = Hlp_Random(8);
		if (rnd == 0)	{
			Spawn_Items(SPptr, ItPl_Beet,100);
		}
		else if (rnd == 1)	{
			Spawn_Items(SPptr, ItFoMutton,100);
		}
		else if (rnd == 2)	{
			Spawn_Items(SPptr, ItFo_Stew,100);
		}
		else if (rnd == 3)	{
			Spawn_Items(SPptr, ItFo_Apple,100);
		}
		else if (rnd == 4)	{
			Spawn_Items(SPptr, ItFo_Bread,100);
		}
		else if (rnd == 5)	{
			Spawn_Items(SPptr, ItFo_Schafswurst,100);
		}
		else if (rnd == 6)	{
			Spawn_Items(SPptr, ItFo_Water,100);
		}
		else if (rnd == 7)	{
			Spawn_Items(SPptr, ItFo_Milk,100);
		};
	};
};

