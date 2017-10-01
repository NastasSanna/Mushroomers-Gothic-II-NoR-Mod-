
instance MENU_CREDITS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_CREDITS_AUTHOR_HEADLINE";
	items[1] = "MENUITEM_CREDITS_AUTHOR_NAME";
	items[2] = "MENUITEM_CREDITS_AUTHOR_WORK";
	items[3] = "MENUITEM_CREDITS_SOUND_HEADLINE";
	items[4] = "MENUITEM_CREDITS_SOUND_SNOWSTUDIO";
	items[5] = "MENUITEM_CREDITS_SOUND";
	items[6] = "MENUITEM_CREDITS_TESTING_HEADLINE";
	items[7] = "MENUITEM_CREDITS_TESTING";
	items[8] = "MENUITEM_CREDITS_SOURCES_HEADLINE";
	items[9] = "MENUITEM_CREDITS_SOURCES";
	posx = 200;
	posy = 2000;
	dimx = 8191 - 400;
	dimy = 8191 - 400;
	alpha = 255;
	flags = MENU_EXCLUSIVE | MENU_ALIGN_CENTER;
};

const int MENU_CREDITS_AUTHOR_Y = 500;
const int MENU_CREDITS_SOUND_Y = 2100;
const int MENU_CREDITS_TESTING_Y = 4600;
const int MENU_CREDITS_SOURCES_Y = 6000;
const int MENU_CREDITS_DY = 500;

const int MENU_CREDITS_X = 400;

instance MENUITEM_CREDITS_AUTHOR_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Автор мода";
	posx = 0;		posy = MENU_CREDITS_AUTHOR_Y;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_DEFAULT;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_AUTHOR_NAME(C_MENU_ITEM_DEF)
{
	text[0] = "НастасьСанна";
	posx = 0;		posy = MENU_CREDITS_AUTHOR_Y + MENU_CREDITS_DY;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_BRIGHTBIG;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_AUTHOR_WORK(C_MENU_ITEM_DEF)
{
	text[0] = "(идея, сценарий, скриптинг, моделинг, вобинг, текстуры)";
	posx = 0;		posy = MENU_CREDITS_AUTHOR_Y + 2 * MENU_CREDITS_DY;
	dimx = 8192;	dimy = MENU_CREDITS_DY / 2;
	fontname = MENU_FONT_SMALL;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};


instance MENUITEM_CREDITS_SOUND_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Озвучка";
	posx = 0;		posy = MENU_CREDITS_SOUND_Y;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_DEFAULT;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_SOUND_SNOWSTUDIO(C_MENU_ITEM_DEF)
{
	text[0] = "SnowStudio";
	posx = 0;		posy = MENU_CREDITS_SOUND_Y + MENU_CREDITS_DY;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_BRIGHTBIG;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_SOUND(C_MENU_ITEM_DEF)
{
	text[0] = "Звукорежиссер: BloodwinSnow\nВ главных ролях: Kertax, Adept, Helen Dream, !sTaR, 2Khaos\nАктеры: Гор На Драк, Наемник из Готики, Идол Кадар, Максим Сухочев, BloodwinSnow, Dennis, }{иМера, BаLеPыч, Fire Dragon, Naja, Taja, Рен, НастасьСанна\nМузыка (автор и исполнитель): Dennis aka Денис Даврэ";
	posx = MENU_CREDITS_X;		posy = MENU_CREDITS_SOUND_Y + 2 * MENU_CREDITS_DY;
	dimx = 7192;	dimy = MENU_CREDITS_DY * 4;
	fontname = MENU_FONT_SMALL;
	flags = IT_TRANSPARENT | IT_MULTILINE;
};


instance MENUITEM_CREDITS_TESTING_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Тестирование";
	posx = 0;		posy = MENU_CREDITS_TESTING_Y;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_DEFAULT;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_TESTING(C_MENU_ITEM_DEF)
{
	text[0] = "Ведущие тестировщики: LOST, BloodwinSnow\nОткрытое бета-тестирование: Дикарь, Akara, Gratt, Vlad_Torop, Grimezh, Jr13San, Airenn, lorddemonik1, evgor, Xotland";
	posx = MENU_CREDITS_X;		posy = MENU_CREDITS_TESTING_Y + MENU_CREDITS_DY;
	dimx = 8192 - 2 * MENU_CREDITS_X;	dimy = MENU_CREDITS_DY * 2;
	fontname = MENU_FONT_SMALL;
	flags = IT_TRANSPARENT | IT_MULTILINE;
};


instance MENUITEM_CREDITS_SOURCES_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "Ресурсы";
	posx = 0;		posy = MENU_CREDITS_SOURCES_Y;
	dimx = 8192;	dimy = MENU_CREDITS_DY;
	fontname = MENU_FONT_DEFAULT;
	flags = IT_TRANSPARENT | IT_TXT_CENTER;
};
instance MENUITEM_CREDITS_SOURCES(C_MENU_ITEM_DEF)
{
	text[0] = "Идеи охотничьх баек, тексты книг: Дикарь\nЦенные идеи и замечания, моральная поддержка: BloodwinSnow\nЗаимствования из сторонних модов: Темная Сага (модель женской пиратской одежды), Legacy (модель гитары)";
	posx = MENU_CREDITS_X;		posy = MENU_CREDITS_SOURCES_Y + MENU_CREDITS_DY;
	dimx = 8192 - 2 * MENU_CREDITS_X;	dimy = MENU_CREDITS_DY * 3;
	fontname = MENU_FONT_SMALL;
	flags = IT_TRANSPARENT | IT_MULTILINE;
};

