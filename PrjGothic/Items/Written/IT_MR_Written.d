
const int Value_EarRecipe_Constantino = 500;
const int Value_EarRecipe_Thekla = 20;
const int Value_EarRecipe_Hilda = 50;

instance ItWr_PosterNaked(C_Item)
{
	name = "Рисунок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_PosterNaked.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PosterNaked;
	scemeName = "MAP";
	description = "Изображение обнаженной женщины.";
};
func void Use_PosterNaked()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"POSTER_Woman.TGA",0);
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_Letter_Vino2Chief(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Vino2Chief;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Вино для его друзей";
};
func void Use_Letter_Vino2Chief()
{
	if (Npc_IsPlayer(self))	{
		PrintInInventory("О боги! Ну и почерк. Ничего не разобрать.");
	};
};
//===================================================
instance ItWr_Letter_Chief2Halvor(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Chief2Halvor;
	scemeName = "MAP";
	description = name;
	text[2] = "Халвору от торговых партнеров.";
};
func void Use_Letter_Chief2Halvor()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,"Халвор,");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Здесь весь обещаный товар. Вырученные деньги оставишь в обычном месте.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Передавшему это человеку можно доверить мелкие поручения.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Твой партнер");
		Doc_Show(nDocID);
	};
};
//===================================================
instance ItWr_ScoreList(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_ScoreList;
	scemeName = "MAPSEALED";
	description = "Очки участников конкурса";
};
func void Use_Letter_ScoreList()
{
	if (Npc_IsPlayer(self))	{
		B_Show_ScoreList();
	};
};

// РЕЦЕПТЫ =====================================

instance ItWr_EarRecipe_Constantino(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Constantino;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Constantino;
	description = "Рецепт настойки Константино";
	text[0] = "Настойка на грибах “Дамские уши“";
	text[1] = "Эксклюзив от Константино.";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_EarRecipe_Constantino()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,50,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"Грибная настойка на розовом древесном грибе (дамском ушке)");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ингредиенты:");
		Doc_PrintLines(nDocID,0,"Дамское ушко - 3 шт.");
		Doc_PrintLines(nDocID,0,"Алкоголь (ром, джин) - 1 бут.");
		Doc_PrintLines(nDocID,0,"Огненная крапива - 1 шт.");
		Doc_PrintLines(nDocID,0,"Болотник - 1 шт.");
		Doc_PrintLines(nDocID,0,"Уголь - 1 шт.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Грибы и травы слегка размять и залить алкоголем. Положить кусок угля и оставить на 3 дня в темном прохладном месте. После этого извлечь уголь (не использовать, ядовит!) и настаивать еще сутки.");
		Doc_PrintLines(nDocID,0,"Готовую настойку процедить и тщательно закупорить для хранения.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Применение: облегчает похмелье, зубную боль и морскую болезнь. Растирание на грудь и спину при сильном жаре.");
		Doc_Show(nDocID);
	};
};
//--------------------------------------------
instance ItWr_EarRecipe_Thekla(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Thekla;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Thekla;
	description = "Уши в масле от Теклы";
	text[1] = "Рецепт жареных грибов “Дамские уши“";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
	
};
func void Use_EarRecipe_Thekla()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"     Уши в масле от Теклы");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Грибы-уши замочить в трех водах по 3 часа. Хорошенько отжать и обсушить.");
		Doc_PrintLines(nDocID,0,"Растопить на сковороде бараний жир на полпальца. Грибы обжарить до коричневой корочки, снять с огня. Добавить мелко порезаную луковицу и яблоко, посолить, поперчить.");
		Doc_PrintLines(nDocID,0,"Подавать горячим.");
		Doc_Show(nDocID);
	};
};
//--------------------------------------------
instance ItWr_EarRecipe_Hilda(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Hilda;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Hilda;
	description = "Маринованые ушки";
	text[1] = "Рецепт бабушки Хильды.";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_EarRecipe_Hilda()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"Маринованые грибы “дамские уши“");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Грибы отварить до полумягкости. В горячий отвар добавить меру соли, две меры уксуса и огненный корень. Дно бочонка плотно выстлать дубовыми листьями. Положить грибы, залить маринадом. Поставить под пресс на неделю. Хранить в погребе, маринад не пить!");
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_TuskCertificate(C_Item)
{
	name = "Сертификат";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "Сертификат на кабаньи клыки";
	text[1] = "Выдан Боспером.";
	text[2] = "Подверждает длину клыков кабана:";
	text[3] = "левый: 4 и 1/10 пальца";
	text[4] = "правый: 4 и 1/12 пальца";
};

