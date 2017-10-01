
// СОЛОМА =================================
// по квесту Тилла
instance ItMi_Straw(C_Item)
{
	name = "Тюк соломы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "NW_MISC_STRAW_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MR_Straw;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_NoValue;
	count[5] = value;
};

func void Use_MR_Straw()
{
	if (Npc_IsPlayer(self))	{
		if (MIS_Till_Pet != LOG_Running)	{
			PrintScreen(PRINT_DontNeedThisMore,-1,-1,FONT_Screen,2);
			CreateInvItem(self,ItMi_Straw);
		}
		if (Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_08") < 1000)	{
			Wld_SendTrigger("TRG_STRAW_CROSS");
			C_Till_Pet_CaveReady(MIS_Till_Pet_CaveReady_Straw);
			B_GivePlayerXP(XP_Till_Straw);
		}
		else	{
			PrintScreen("Нужно расстелить солому в дальней пещере.",-1,-1,FONT_Screen,2);
			CreateInvItem(self,ItMi_Straw);
		};
	};
};

// Феллан =================================
instance ItMi_FellanHammer(C_Item)
{
	name = "Молоток Феллана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2 * Value_Hammer;
	visual = "ItMi_Hammer.3DS";
	material = MAT_WOOD;
	description = name;
	text[1] = "Тисовая рукоятка как новенькая";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMi_FellanHammer_Broken(C_Item)
{
	name = "Молоток Феллана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Hammer_Broken.3DS";
	material = MAT_WOOD;
	description = name;
	text[1] = "Рукоятка сломана посередине.";
};
instance ItMi_YewPiece(C_Item)
{
	name = "Тис";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_YewPiece.3DS";
	material = MAT_WOOD;
	description = name;
	text[1] = "Небольшой тисовый чурбак.";
	text[2] = "Как раз для рукоятки.";
};

instance ItMi_Saw_Broken(C_Item)
{
	name = "Пила";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Saw;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "Зубья погнуты и поломаны.";
};

instance ItMi_Lute_Broken(C_Item)
{
	name = "Лютня без струн";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lute;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	description = name;
	text[1] = "Все струны порваны,";
	text[2] = "а корпус треснул.";
};

//Денис Серегин =================================
instance ItMi_Guitar(C_Item) 
{ 
	name = "Гитара"; 
	mainflag = ITEM_KAT_NONE; 
	flags = ITEM_MULTI; 
	value = Value_Lute; 
	visual = "Legacy_easter_eggs_guitar.3ds"; 
	material = MAT_WOOD; 
	scemeName = "GUITAR"; 
	on_state[0] = Use_Guitar; 
	description = name; 
	text[5] = NAME_Value; 
	count[5] = value; 
}; 

func void Use_Guitar() 
{
	AI_Snd_Play3D(self, self, "INST_GUITAR");
};

