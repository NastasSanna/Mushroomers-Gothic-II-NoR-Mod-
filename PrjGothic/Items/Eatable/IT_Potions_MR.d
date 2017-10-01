
instance ItPo_MR_AntiDragTears(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MR_AntiDragTears;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Противоядие";
	text[1] = "Лечит отравление драконовыми слезами";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_MR_AntiDragTears()
{
	if (Npc_IsPlayer(self))	{
		POISON_DrgTears_Timer = 0;
	};
};

//===========================================
instance ItPo_MR_AntiFoggy(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MR_AntiFoggy;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Противоядие";
	text[1] = "Лечит отравление туманником";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_MR_AntiFoggy()
{
	if (Npc_IsPlayer(self))	{
		POISON_Foggy_Timer = 0;
		TIMER_AntiFoggy = TIMER_AntiFoggy_Max + Hlp_Random(30);
		TIMER_AntiFoggy_Enabled = TRUE;
		Wld_PlayEffect("SCREEN_SWEAT",self,self,1,0,0,FALSE);
	};
};

//===========================================
instance ItPo_MR_AntiGobbo(C_Item)
{
	name = "Отвар";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_MR_AntiGobbo;
	scemeName = "MAPSEALED";
	description = "Отвар горичая";
	text[1] = "Гоблинов отпугивает его запах";
	text[5] = NAME_Value;
	count[5] = value;
};

func void B_MR_RemoveGobbo(var C_NPC npc)
{
	Npc_ClearAIQueue(npc);
	AI_SetWalkmode(npc,NPC_RUN);
	AI_GotoWP(npc, "NW_BIGFARM_FOREST_02");
	Wld_RemoveNpc(Hlp_GetInstanceID(npc));
};

func void Use_MR_AntiGobbo()
{
	if (Npc_IsPlayer(self))	{
		if ((Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_05") < 1000)
			&& !HasFlags(MIS_Till_Pet_CaveReady, MIS_Till_Pet_CaveReady_Gobbo1))	{
			PrintScreen("В этой пещере гоблины больше жить не будут.",-1,-1,FONT_Screen,2);
			if (!HasFlags(MIS_Till_Pet_CaveReady, MIS_Till_Pet_CaveReady_Gobbo1 | MIS_Till_Pet_CaveReady_Gobbo1))	{
				CreateInvItem(self,ItPo_MR_AntiGobbo);
			};
			B_MR_RemoveGobbo(Gobbo_Warrior_Till_2);
			B_MR_RemoveGobbo(Gobbo_Black_Till_3);
			B_MR_RemoveGobbo(Gobbo_Green_Till_1);
			B_MR_RemoveGobbo(Gobbo_Green_Till_2);
			C_Till_Pet_CaveReady(MIS_Till_Pet_CaveReady_Gobbo1);
		}
		else if ((Npc_GetDistToWP(self, "NW_BIGFARM_FOREST_08") < 1000)
			&& !HasFlags(MIS_Till_Pet_CaveReady, MIS_Till_Pet_CaveReady_Gobbo2))	{
			PrintScreen("В этой пещере гоблины больше жить не будут.",-1,-1,FONT_Screen,2);
			if (!HasFlags(MIS_Till_Pet_CaveReady, MIS_Till_Pet_CaveReady_Gobbo1 | MIS_Till_Pet_CaveReady_Gobbo1))	{
				CreateInvItem(self,ItPo_MR_AntiGobbo);
			};
			B_MR_RemoveGobbo(Gobbo_Warrior_Visir_Till);
			B_MR_RemoveGobbo(Gobbo_Warrior_Till_1);
			B_MR_RemoveGobbo(Gobbo_Black_Till_1);
			B_MR_RemoveGobbo(Gobbo_Black_Till_2);
			C_Till_Pet_CaveReady(MIS_Till_Pet_CaveReady_Gobbo2);
		}
		else if (MIS_Till_Pet != LOG_Running)		{
			PrintScreen(PRINT_DontNeedThisMore,-1,-1,FONT_Screen,2);
			CreateInvItem(self,ItPo_MR_AntiGobbo);
		}
		else	{
			PrintScreen("Мне нужно разбрызгать его",-1,47,FONT_Screen,2);
			PrintScreen("в пещере позади поместья Онара.",-1,52,FONT_Screen,2);
			CreateInvItem(self,ItPo_MR_AntiGobbo);
		};
	};
};

//===========================================
const int Bonus_Prot_OldAlch = 5;
instance ItPo_MR_OldAlch(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_MR_OldAlch;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Зелье древнего алхимика";
	text[1] = "Полностью исцеляет раны";
	text[2] = "и укрепляет кожу";
	text[3] = NAME_Prot_EdgePoint;
	count[3] = Bonus_Prot_OldAlch;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MR_OldAlch()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	self.protection[PROT_EDGE] += Bonus_Prot_OldAlch;
	self.protection[PROT_BLUNT] += Bonus_Prot_OldAlch;
	self.protection[PROT_POINT] += Bonus_Prot_OldAlch;
};

//===========================================
instance ItPo_MR_IgnazEar(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItPo_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_MR_IgnazEar;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Зелье Игнаца";
	text[1] = "Из “дамских ушей“";
	text[3] = TEXT_UnknownEffect;
};


func void Use_MR_IgnazEar()
{
	if (self.attribute[ATR_HITPOINTS_MAX] > 20)	{
		self.attribute[ATR_HITPOINTS] = 10;
	}
	else	{
		self.attribute[ATR_HITPOINTS] = 5;
	};
	self.attribute[ATR_MANA] = 0;
};


