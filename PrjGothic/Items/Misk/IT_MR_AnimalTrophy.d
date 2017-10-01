
const int Value_IceWolfFur = 250;
const int Value_KeilerJawRaw = 10;
const int Value_KeilerJaw = 15;
const int Value_KeilerTusk = 100;
const int Value_KeilerHogTusk = 150;
const int Value_KeilerHogTuskBig = 350;

instance ItAt_IceWolfFur(C_Item)
{
	name = "Шкура белого волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_IceWolfFur;
	visual = "ItAt_SnowWolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

//ЧЕЛЮСТЬ КАБАНА ============================

prototype Proto_ItAt_KeilerJaw(C_Item)
{
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItAt_KeilerJaw.3DS";
	material = MAT_LEATHER;
	text[5] = NAME_Value;
};

instance ItAt_KeilerJawRaw(Proto_ItAt_KeilerJaw)
{
	name = "Челюсть кабана";
	value = Value_KeilerJawRaw;
	description = name;
	text[1] = "Необработанная челюсть.";
	text[2] = "Прежде, чем извлекать клыки,";
	text[3] = "ее нужно выварить.";
	count[5] = value;
};

instance ItAt_KeilerJaw(Proto_ItAt_KeilerJaw)
{
	name = "Челюсть кабана";
	value = Value_KeilerJaw;
	description = "Челюсть кабана (выварена)";
	text[1] = "Челюсть выварена.";
	text[2] = "Теперь можно сделать надрезы ножом ";
	text[3] = "и аккуратно извлечь клыки.";
	count[5] = value;
	scemeName = "MAPSEALED";
	on_state[0] = Use_KeilerJaw;
	inv_rotz = 25;
};
func void Use_KeilerJaw()
{
	if(Npc_IsPlayer(self))	{
		if (player_talent_takeanimaltrophy[TROPHY_KeilerTusk]) {
			if (Npc_HasItems(self, ItMw_1h_Vlk_Dagger) || Npc_HasItems(self, ItMw_1H_Sword_L_03)
				|| Npc_HasItems(self, ItMW_Addon_Knife01) || Npc_HasItems(self, ItMW_MR_1h_BrianKnife))	{
				CreateInvItem(self,ItAt_KeilerTusk);
			}
			else	{
				PrintScreen(PRINT_MissingKnife,-1, -1, FONT_ScreenSmall,3);
				CreateInvItem(self,ItAt_KeilerJaw);
			};
		}
		else	{
			PrintScreen(PRINT_NoKeilerJawTalent,-1, -1, FONT_ScreenSmall,3);
			CreateInvItem(self,ItAt_KeilerJaw);
		};
	};
};

instance ItAt_KeilerHogJawRaw(Proto_ItAt_KeilerJaw)
{
	name = "Челюсть секача";
	value = Value_KeilerJawRaw;
	description = name;
	text[1] = "Необработанная челюсть.";
	text[2] = "Прежде, чем извлекать клыки,";
	text[3] = "ее нужно выварить.";
	count[5] = value;
};

instance ItAt_KeilerHogJaw(Proto_ItAt_KeilerJaw)
{
	name = "Челюсть секача";
	value = Value_KeilerJaw;
	description = "Челюсть секача (выварена)";
	text[1] = "Челюсть выварена.";
	text[2] = "Теперь можно сделать надрезы ножом ";
	text[3] = "и аккуратно извлечь клыки.";
	count[5] = value;
	scemeName = "MAPSEALED";
	on_state[0] = Use_KeilerHogJaw;
	inv_rotz = 25;
};
var int KeilerHogJaw_Cnt;
func void Use_KeilerHogJaw()
{
	if(Npc_IsPlayer(self))	{
		if (player_talent_takeanimaltrophy[TROPHY_KeilerTusk]) {
			if (Npc_HasItems(self, ItMw_1h_Vlk_Dagger) || Npc_HasItems(self, ItMw_1H_Sword_L_03)
				|| Npc_HasItems(self, ItMW_Addon_Knife01) || Npc_HasItems(self, ItMW_MR_1h_BrianKnife))	{
				KeilerHogJaw_Cnt += 1;
				if (KeilerHogJaw_Cnt == 3) {
					CreateInvItem(self,ItAt_KeilerHogTuskBig);
					PrintScreen(PRINT_KeilerJawBig,-1, -1, FONT_ScreenSmall,3);
					B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsFound);
				}
				else	{
					CreateInvItem(self,ItAt_KeilerHogTusk);
				};
			}
			else	{
				PrintScreen(PRINT_MissingKnife,-1, -1, FONT_ScreenSmall,3);
				CreateInvItem(self,ItAt_KeilerHogJaw);
			};
		}
		else	{
			PrintScreen(PRINT_NoKeilerJawTalent,-1, -1, FONT_ScreenSmall,3);
			CreateInvItem(self,ItAt_KeilerHogJaw);
		};
	};
};
//------------------------------
prototype Proto_ItAt_KeilerTusk(C_Item)
{
	name = "Клыки кабана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItAt_KeilerTusk.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
};

instance ItAt_KeilerTusk(Proto_ItAt_KeilerTusk)
{
	value = Value_KeilerTusk;
	text[1] = "Пара нижних клыков обычного кабана.";
	text[3] = "Не очень крупные.";
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItAt_KeilerHogTusk(Proto_ItAt_KeilerTusk)
{
	name = "Клыки кабана-секача";
	value = Value_KeilerHogTusk;
	description = name;
	text[1] = "Пара нижних клыков кабана-секача.";
	text[3] = "Неплохой экземпляр.";
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD - 50;
};

instance ItAt_KeilerHogTuskBig(Proto_ItAt_KeilerTusk)
{
	name = "Клыки кабана-секача";
	value = Value_KeilerHogTuskBig;
	description = name;
	text[1] = "Пара нижних клыков кабана-секача.";
	text[3] = "Очень крупный экземпляр.";
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD - 100;
};
