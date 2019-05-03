
const int Value_FaithfulnessCup = 350;

// ======================================
instance ItMi_Packet_Halvor(C_Item)
{
	name = "Пакет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Packet_Halvor;
	description = name;
	text[2] = "Пакет с товарами для Халвора.";
};
func void Use_Packet_Halvor()
{
	if (Npc_IsPlayer(self))	{
		if (MIS_KhorinisPost == LOG_Running)	{
			PrintInInventory("Нужно отдать этот пакет Халвору.");
			CreateInvItems(self,ItMi_Packet_Halvor,1);
		}
		else {
			B_PlayerFindItem(ItMi_Nugget,3);
			B_PlayerFindItem(ItAt_SharkSkin,1);
			B_PlayerFindItem(ItRi_ValentinosRing,1);
		};
	}
	else	{
		CreateInvItems(self,ItMi_Nugget,3);
		CreateInvItems(self,ItAt_SharkSkin,1);
		CreateInvItems(self,ItRi_ValentinosRing,1);
	};
};

// =============== Квест Эрола - Охотник за древностями ==================

// ======================================
instance ItMi_Vatras_AmulScroll(C_Item)
{
	name = "Свиток с заклинанием";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Vatras_AmulScroll;
	description = "Свиток с заклинанием Ватраса";
	text[1] = "Необходимо прочесть в кругe камней,";
	text[2] = "чтобы зарядить рудный амулет.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Vatras_AmulScroll()
{
	if (Npc_IsPlayer(self))	{
		//круги камней
		if ((Npc_GetDistToWP(self,"NW_LITTLESTONEHENDGE_02") < PERC_DIST_DIALOG)	//Лобарт
			|| (Npc_GetDistToWP(self,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01") < PERC_DIST_DIALOG)	//Секоб
			|| (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_04") < PERC_DIST_DIALOG)	//Солнца
			|| (Npc_GetDistToWP(self,"NW_FOREST_PATH_62_ORNA") < PERC_DIST_DIALOG))	//в лесу
		{
			//ничего не забыли?
			if (!Npc_HasItems(self,ItAm_MR_WispDetector_Uncharged))	{
				PrintInInventory("Мне нужен амулет, чтобы его зарядить.");
				CreateInvItem(self,ItMi_Vatras_AmulScroll);
			}
			else if (!Npc_HasItems(self,ItMi_Nugget))	{
				PrintInInventory("Мне нужен кусок магической руды.");
				CreateInvItem(self,ItMi_Vatras_AmulScroll);
			}
			else	{
				//поехали!
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
				Npc_RemoveInvItem(self, ItAm_MR_WispDetector_Uncharged);
				Npc_RemoveInvItem(self, ItMi_Nugget);
				CreateInvItem(self,ItAm_MR_WispDetector_Charged);
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulCharged);
				Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_05");
				Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_06");
			};
		}
		else	{
			PrintInInventory("Заклинание нужно прочесть в круге камней.");
			CreateInvItem(self,ItMi_Vatras_AmulScroll);
		};
	};
};


// =============== Квест Елены - Подарочная суматоха ==================

// Кубки Верности ======================================
prototype Proto_ItMi_FaithfulnessCup(C_Item)
{
	name = "Кубок Верности";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FaithfulnessCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "Кубок символизирует супружескую верность и гармонию.";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMi_FaithfulnessCup_01(Proto_ItMi_FaithfulnessCup)
{
	text[2] = "Это первый кубок из пары.";
};

instance ItMi_FaithfulnessCup_02(Proto_ItMi_FaithfulnessCup)
{
	text[2] = "Это второй кубок из пары.";
};

// Выделанная шкура мракориса ======================================
instance ItAt_ShadowFur_Dressed(C_Item)
{
	name = "Шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowFur;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Шкура великолепно выделана.";
	text[2] = "Отличный подарок по любому поводу.";
	text[5] = NAME_Value;
	count[5] = value;
};

// Кольца с портретами ======================================
prototype Proto_ItMi_PortraitRings(C_Item)
{
	name = "Кольца с портретами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_FaithfulnessCup;
	visual = "ItMi_Elena_Rings.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	description = name;
	text[1] = "На внутренней стороне обода выгравированы имена: Онар и Мария.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_PortraitRings_Empty(Proto_ItMi_PortraitRings)
{
	text[2] = "В кольца нужно вставить портреты родителей.";
	on_state[0] = Use_PortraitRings_Empty;
};
func void Use_PortraitRings_Empty()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"ElenaRings_Empty.TGA",1);
		Doc_Show(RingsID);
	};
};

instance ItMi_PortraitRings(Proto_ItMi_PortraitRings)
{
	text[2] = "Кольца готовы.";
	on_state[0] = Use_PortraitRings;
};
func void Use_PortraitRings()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"ElenaRings_Portraits.TGA",1);
		Doc_Show(RingsID);
	};
};
// Портрет ======================================
instance ItMi_PortraitOnarMaria(C_Item)
{
	name = "Старый портрет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Elena_Portrait.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	on_state[0] = Use_PortraitOnarMaria;
	description = "Портрет Онара и Марии";
	text[2] = "Родители в молодости.";
	text[3] = "У отца были шикарные усы.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
};
func void Use_PortraitOnarMaria()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"Elena_Portrait.TGA",1);
		Doc_Show(RingsID);
	};
};
// Портрет ======================================
instance ItMi_PortraitOnarMariaDouble(C_Item)
{
	name = "Маленькие портреты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Elena_PortraitsDouble.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = Use_PortraitOnarMariaDouble;
	description = "Портреты Онара и Марии";
	text[2] = "Портреты нужно вставить в пару колец.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
};
func void Use_PortraitOnarMariaDouble()
{
	if (Npc_IsPlayer(self))	{
		if (Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
			Npc_RemoveInvItem(self,ItMi_PortraitRings_Empty);
			CreateInvItem(self,ItMi_PortraitRings);
			B_LogEntry_Elena_PresentGot(TOPIC_Elena_Present_PortretsInserted);
			B_GivePlayerXP(XP_Elena_PortretsInserted);
			Use_PortraitRings();
		}
		else	{
			var int RingsID;	RingsID = Doc_Create();
			Doc_SetPages(RingsID,1);
			Doc_SetPage(RingsID,0,"Elena_PortraitsDouble.TGA",1);
			Doc_Show(RingsID);
			CreateInvItem(self,ItMi_PortraitOnarMariaDouble);
		};
	};
};

// Очищающее зелье ======================================
instance ItMi_AntismokingPotion(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = "Очищающее зелье";
	text[1] = "Это зелье должно помочь Наде";
	text[2] = "очистить тело от болотника.";
	value = 1500;
	text[5] = NAME_Value;
	count[5] = value;
	//inv_zbias = 70;
};
// Укрепляющая мазь ======================================
instance ItMi_BuildUpSalve(C_Item)
{
	name = "Мазь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_Salve.3ds";
	material = MAT_GLAS;
	description = "Укрепляющая мазь";
	text[1] = "Укрепляет внутренности.";
	text[2] = "Должна помочь Наде от кашля";
	value = 100;
	text[5] = NAME_Value;
	count[5] = value;
};


