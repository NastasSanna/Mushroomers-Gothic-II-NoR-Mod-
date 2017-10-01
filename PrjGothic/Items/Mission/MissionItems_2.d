
instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Камень знаний";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItAt_ClawLeader(C_Item)
{
	name = "Когти снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Когти вожака стаи";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


instance ItMi_GoldPlate_MIS(C_Item)
{
	name = "Золотая тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Bromor(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[1] = "Был спрятан в дуле пушки в порту.";
	text[2] = "На рукоятке выцарапана буква Б.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Маленький ключик от сундука.";
	text[1] = "Сундук, к которому подходит";
	text[2] = "этот ключ, находится под мостом.";
	text[3] = "В нем лежит рунный камень.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Bloody_MIS(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "Яд кровавых мух";
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Жало кровавых мух содержит смертельный яд, и ни один человек в здравом уме не возьмет его в руки.");
	Doc_PrintLines(nDocID,0,"Если только он не владеет искусством извлечения жала и его обработки.");
	Doc_PrintLines(nDocID,0,"Жало необходимо аккуратно разрезать острым ножом от кончика до основания.");
	Doc_PrintLines(nDocID,0,"Верхний слой удаляется. Затем разрезается ткань вокруг желез.");
	Doc_PrintLines(nDocID,0,"Выделяющийся при разрезе сок обладает лечебными свойствами.");
	Doc_PrintLines(nDocID,0,"Однако, со временем человеческий организм становится невосприимчивым к этому лечебному зелью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дамарок");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Теперь я знаю, что необходимо сделать, чтобы добыть целебный сок из жала кровавой мухи. Мне потребуется острый нож.");
		B_GivePlayerXP(XP_Ambient);
	};
};

instance ItWr_Manowar(C_Item)
{
	name = "Текст";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = "Текст песни.";
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Клич Доминика");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы заслужим Его уважение.");
	Doc_PrintLines(nDocID,0,"Иннос всегда со мной и моими братьями.");
	Doc_PrintLines(nDocID,0,"Я убью любого, кто попытается остановить меня");
	Doc_PrintLines(nDocID,0,"в моем сердце горит Его огонь.");
	Doc_PrintLines(nDocID,0,"Мой меч служит только Ему.");
	Doc_PrintLines(nDocID,0,"Его имя всегда у меня на устах.");
	Doc_PrintLines(nDocID,0,"Любой, кто противостоит мне,");
	Doc_PrintLines(nDocID,0,"падет от рук моих,");
	Doc_PrintLines(nDocID,0,"ведь я воин Инноса.");
	Doc_Show(nDocID);
};

instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

