
instance ItWr_Krypta_Garon(C_Item)
{
	name = "Старое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "написанное трясущейся рукой.";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Все пошло прахом. Я тщетно пытался удержать Инубиса на пути добра.");
	Doc_PrintLines(nDocID,0,"Сначала, мне показалось, что я уже мертв. Но кое-какая сила все еще осталась в старых костях Ивана.");
	Doc_PrintLines(nDocID,0,"Инубис восстал из мертвых. Изгнанный древним орденом паладинов, теперь он ищет отмщения за свое проклятие.");
	Doc_PrintLines(nDocID,0,"Вместе с ним многие из его последователей. Я не могу понять, как такой предводитель как Инубис мог стать таким злом.");
	Doc_PrintLines(nDocID,0,"Я нашел его могилу в этом склепе. Но я не уверен, удастся ли мне сообщить о своей находке. Поэтому, я пишу эти строки и надеюсь, что кто-нибудь найдет их.");
	Doc_PrintLines(nDocID,0,"Знайте. Грозный враг пытается дотянуться до праведных душ. Инубис будет не последним.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Да спасет Иннос ваши души.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 Иван");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItMi_PowerEye(C_Item)
{
	name = "Глаз Силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

