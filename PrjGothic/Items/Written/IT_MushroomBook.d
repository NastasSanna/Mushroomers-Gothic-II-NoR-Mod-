
instance ItWr_MushroomBook(C_Item)
{
	name = "Книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	
	visual = "ItWr_Book_Green.3DS";
	material = MAT_LEATHER;
	
	description = "Грибы Хориниса";
	text[2] = "Книга алхимика Константино.";
	text[3] = "Это приз за победу в грибном конкурсе.";
	
	
	scemeName = "MAP";
	on_state[0] = Use_MushroomBook;
};

const Int MRBook_Top_Margin = 50;
const Int MRBook_Btm_Margin = 50;

var int MRBook_Page;
const int MRBook_PageMax = 27;

//================================================================
func void MRBook_Show_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"Book_Green_Title.tga",0);
	
	Doc_SetMargins(docID,0,100,205,100,35,1);
	Doc_SetFont(docID,0,FONT_Screen);
	Doc_PrintLine(docID,0,"            Г р и б ы");
	Doc_PrintLine(docID,0,"        Х о р и н и с а");
	Doc_SetFont(docID,0,FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"   Управление: СТРЕЛКИ, Home, End");
};
//================================================================
func void MRBook_Show_Title(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Title_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Title_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,30,MRBook_Btm_Margin,1);

	Doc_SetMargins(docID,-1,30,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_Calligraphic);
	var string BestName;
	Doc_PrintLine(docID,1,"Сей экземпляр ");
	BestName = "вручаю ";
	if (C_HeroIs_Elena())	{	BestName = ConcatStrings(BestName, "Елене");	}	else
	if (C_HeroIs_Erol())	{	BestName = ConcatStrings(BestName, "почтенному Эролу");	}	else
	if (C_HeroIs_Odo())		{	BestName = ConcatStrings(BestName, "Одо");	}	else
	if (C_HeroIs_Rupert())	{	BestName = ConcatStrings(BestName, "Руперту");	}	else
	if (C_HeroIs_Sarah())	{	BestName = ConcatStrings(BestName, "Саре");	}	else
	if (C_HeroIs_Talbin())	{	BestName = ConcatStrings(BestName, "Талбину");	}	else
	if (C_HeroIs_Till())	{	BestName = ConcatStrings(BestName, "Тиллу");	};
	BestName = ConcatStrings(BestName, ",");
	Doc_PrintLine(docID,1,BestName);
	if (hero.aivar[AIV_Gender] == FEMALE)	{
		BestName = "лучшей среди сборщиков грибов,";
	}
	else	{
		BestName = "лучшему среди сборщиков грибов,";
	};
	Doc_PrintLine(docID,1,BestName);
	Doc_PrintLine(docID,1,"в знак признательности");
	Doc_PrintLine(docID,1,"за развитие науки о грибах");
	Doc_SetFont(docID,1,FONT_BookHeadline);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"    Грибы Хориниса");
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"                Писано Константино, алхимиком");
	Doc_PrintLine(docID,1,"                        из квартала ремесленников");
	Doc_PrintLine(docID,1,"                         в портовом городе Хоринис");
};
//================================================================
func void MRBook_Show_Summary(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Sum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Sum_R.tga",0);
	
	Doc_SetMargins(docID,0,160,MRBook_Top_Margin + 20,MRBook_Btm_Margin,35,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"Грибной мир Хориниса, несомненно, заслуживающий внимания, до сего момента не был широко освещен в трудах ученых.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Число изученных ныне видов достигает двух десятков. Одни из них, такие как мясные и темные, хорошо знакомы простым людям. О других знают лишь искушенные исследователи.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Данный трактат призван пролить толику света на свойства этих видов, их распространение и способы практического применения.");

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,50,1);
	Doc_SetFont(docID,1,FONT_MRHeadline);
	Doc_PrintLine(docID,1,"    Введение");
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Традиционно, грибы разделяют на съедобные и ядовитые. И те, и другие могут найти свое применение в алхимии. Содержащийся в грибах яд может служить не только отравой, но и лекарством, при употреблении в правильной дозе. В иных случаях яд можно нейтрализовать, например, путем длительного отваривания.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Некоторые невежественные люди полностью отказываются от употребления грибов, опасаясь отравления. Немало способствует этому суеверие, согласно которому грибы суть ночные цветы смерти, порождение тьмы Белиара.");
};
//================================================================
func void MRBook_Show_Intro1(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro1_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro1_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,35,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"  Типичное строение гриба включает подземную часть (грибницу) и надземную (тело гриба).");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  Полезным является лишь плодовое тело гриба. Как правило, оно состоит из шляпки и ножки, хотя есть и исключения. Шляпка и ножка могут быть цельными, как у трубачей, или легко отделяющимися друг от друга, как у темных грибов.");

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  Долгое время единственным способом размножения грибов считался перенос грибницы, пока мастером Микели не было открыто, что из рассыпаемой перезрелыми грибами “пыли“ вырастают новые грибы. Он назвал эту пыль “спорами“.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Спороносный слой обычно располагается на нижней части шляпки и может иметь различную форму. Чаще всего встречаются грибы с пластинчатым слоем, также выделяют складчатый, пористый (трубчатый), гладкий и другие, более редкие формы. В процессе роста шляпка гриба зачастую изменяет форму, постепенно раскрываясь и открывая спороносный слой. У некоторых грибов, таких как трехглавый сумочник, спороносный слой располагается на всей поверхности шляпки.");
};
//================================================================
func void MRBook_Show_Intro2(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro2_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro2_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"  Другие грибы содержат споры внутри тела, которое, созревая, взрывается и рассеивает их в воздухе. Такие грибы принято называть “пыльниками“ или “курильщиками“. На Хоринисе произрастает бутылочный пыльник, а также уникальный вид “ночная искра“.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  Природа грибов во многом остается загадкой. До сих пор остается открытым вопрос, следует ли относить грибы к растениям, или выделять в отдельную группу живых организмов. Иные считают грибы мягкими минералами.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  Последнюю версию мы категорически отрицаем. Обладая поверхностным сходством с минералами, в отличие от них грибы растут, размножаются и умирают.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Подобно другим существам, жизнь грибов основана на воде, без нее они гибнут. Как и растения, грибы произрастают в почве, либо на других растениях и имеют подземную часть, подобную корням - грибницу. Размножаются грибы также подобно растениям: мельчайшими семенами - спорами. И растения, и грибы не способны передвигаться.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Однако грибы не имеют других характерных частей растений - зеленых листьев и цветков. Если растения нуждаются в свете, то грибы предпочитают затененные места. По вкусу грибы больше напоминают мясо.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Мы отнесем грибы к общей группе тайнобрачных организмов, наряду с лишайниками и полипами.");
};
//================================================================
func void MRBook_Show_MR_01(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR01_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR01_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            Темный гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(docID,0,"Адский гриб");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Гриб средних размеров, с темной шляпкой в форме полусферы, фактура гладкая. Ножка светло-серая, с желтоватым или зеленоватым оттенком. Спороносный слой пластинчатый, темный.");
	Doc_PrintLines(docID,0,"Имеет характерный резкий запах и горьковатый вкус. ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Один из наиболее распространенных грибов на острове. Темные грибы растут почти повсеместно, в том числе в пещерах.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Обладает целебным действием. При регулярном употреблении повышает магическую энергию. Имеются неподтвержденные сведения о негативных побочных эффектах, включая галлюцинации.");
	Doc_PrintLines(docID,1,"Концентрат из шляпки гриба используется для приготовления зелий, повышающих магические способности.");
};
//================================================================
func void MRBook_Show_MR_02(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR02_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR02_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           Мясной гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Пища рудокопа, рабский хлеб");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Крупный гриб со светлой гладкой шляпкой и ножкой. Диаметр шляпки достигает двух ладоней. Спороносный слой пластинчатый, темный.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Растет повсеместно в сырых и затененных местах, часто встречается в подземельях. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Чрезвычайно питательный гриб, способный заменить буханку хлеба или кусок мяса. Побочные эффекты отсутствуют. Существует рецепт целебного зелья из мясного гриба, но со слабым эффектом.");
};
//================================================================
func void MRBook_Show_Red(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Red_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Red_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"       Красный лесной гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Болтун, пустозвон, краснобай");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Гриб средних размеров с ярко-красной бархатистой шляпкой и ровной белой ножкой. Спороносный слой пластинчатый, белый или розовый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Широко распространен. Чаще всего встречается в лесных массивах, реже на лугах.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Широко употребляется в пищу после обработки. Сам по себе безвкусен и бесполезен. Побочные эффекты отсутствуют. Применение в алхимии неизвестно.");
};
//================================================================
func void MRBook_Show_Piny(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Pin_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Pin_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            Сосновый гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Сосновик");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  Описание: Небольшой гриб. Шляпка в центре коричневая, по краям светло-зеленая. Ножка белая, с небольшим утолщением и следами вольвы в середине. Спороносный слой пластинчатый, белый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  Распространение: Чаще всего растет возле сосен, или на светлых проветриваемых полянах.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Сезон: лето-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Свойства: Съедобен. Обладает слабым целебным эффектом. Побочные эффекты отсутствуют. Используется как второстепенный ингредиент нескольких зелий разного свойства.");
};
//================================================================
func void MRBook_Show_BrownOiler(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Oil_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Oil_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           Масляк еловый");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Коричневый масляк, звездчатка");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Шляпка плоская коричневая, с характерной маслянистой пленкой. В центре бывает заметен рыжеватый узор в форме шестиконечной звезды. Ножка неширокая, белая. Спороносный слой пластинчатый, светло-желтый или белый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Чаще всего растет под елями, в затененных местах, реже – под другими деревьями.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень, весна.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Съедобен. Побочные эффекты отсутствуют. Используется для приготовления мази от бородавок и настойки от кашля.");
};
//================================================================
func void MRBook_Show_Stone(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Stn_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Stn_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"          Каменевидный гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Каменка, шаровик");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Светло-серый или светло-коричневый гриб шаровидной формы. Ножка практически отсутствует. Внешне гриб напоминает небольшой камень, но он очень легкий. Спороносный слой пластинчатый, темный.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Открытые пространства и пещеры, на земле и каменистой почве. Плохо переносит соседство растений. Часто вырастает группами по 2-3 штуки.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Съедобен. Восстанавливает физические и магические силы. При употреблении в больших количествах может вызвать расстройство желудка. Пластины и споры гриба усиливают эффект некоторых зелий.");
};
//================================================================
func void MRBook_Show_Governor(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gov_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gov_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        Губернаторский гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Губернатор");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Крупный гриб с коричневой шляпкой. Спороносный слой пластинчатый, белый. Ножка белая, с хорошо заметными воротником.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Интересно происхождение названия гриба. Его  “шляпа“ с широкими полями и белый “воротник“ чрезвычайно напоминали наряд одного из губернаторов Хориниса прошлого столетия. Сведения о деяниях самого губернатора не сохранились, но название “губернатор“ прочно сохранилось за грибом. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Распространение: Растет в крупных лесных массивах, но в отдалении от деревьев и других растений.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: конец лета-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Съедобен. Побочные эффекты отсутствуют. Существует легенда, что тот, кто съест ровно 28 таких грибов, может увидеть призрак губернатора. В алхимии практически не используется.");
};
//================================================================
func void MRBook_Show_Sunrise(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Snr_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Snr_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            Желтый трубач");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Зорьник");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Желтый или рыжеватый гриб воронковидной формы с неровными краями. Шляпка и ножка цельные. На шляпке видны более темные красные или коричневые кольца. Спороносный слой складчатый, одного с шляпкой и ножкой цвета.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Восточная часть острова. Растет преимущественно на открытом пространстве.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень-зима.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Условно-съедобен. В сыром виде повышает ловкость, но вызывает небольшое отравление. При должной обработке негативный эффект можно нейтрализовать.");
};
//================================================================
func void MRBook_Show_Foggy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Fog_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Fog_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            Белый трубач");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Туманник, призрачный гриб");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Белый воронковидный гриб со светло-коричневыми чешуйками. Ножка и шляпка цельные. Спороносный слой складчатый. Крупнее и с более ровным краем, чем желтый трубач. При созревании быстро чернеет и распадается на части, будто растворяется в земле.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Растет в низких сырых местах, где скапливается туман. Часто можно встретить на кладбищах, болотах.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Несъедобен! Вызывает стойкое отравление, сопровождающееся головокружением и провалами памяти, но летальные случаи редки.");
	Doc_PrintLines(docID,1,"В алхимии бесполезен, даже для приготовления ядов.");
};
//================================================================
func void MRBook_Show_LadysEar(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ear_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ear_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"      Древесный розовый гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Дамское ушко");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  Описание: Розовый асимметричный гриб, шляпка отдаленно напоминает человеческое ухо. Спороносный слой складчатый, слабо выраженный, красноватый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  Распространение: Растет на деревьях и пнях, реже среди корней. Изредка вырастает большая группа грибов.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Сезон: лето-начало осени.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  Свойства: Условно-съедобен. В сыром виде понижает магические способности, но на этих грибах делаются некоторые настойки.");
};
//================================================================
func void MRBook_Show_Keil(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_KL_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_KL_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             Кабаний гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Кабанчик, желтобок");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Самый крупный гриб Хориниса, очень плотный. Созревший гриб может спокойно выдержать вес взрослого мужчины, а шляпка по размерам сравнима с табуретом. У молодого гриба шляпка шаровидная и имеет темный, почти черный, цвет. ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,140,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"В течение 4-7 дней на шляпке образуется крупное желтое пятно и она раскрывается. Молодая шляпка мягкая, мясистая, раскрывшаяся – твердая, одеревеневшая. Ножка белая. Спороносный слой трубчатый, желтоватый, слизистый.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Распространение: Растет в густом подлеске, часто среди папоротников. В тех же местах часто водятся дикие кабаны, из-за чего сбор этих грибов затрудняется.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: лето-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Употребляются только молодые нераскрывшиеся грибы, способные повысить силу человека. Раскрывшиеся грибы становятся слишком твердыми и теряют все полезные качества.");
};
//================================================================
func void MRBook_Show_Bottle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Btl_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Btl_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        Хоринисский пыльник");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Бутылочник, курильщик");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Ножка гриба по форме напоминает желтую бутылку, а шляпка – коричневую круглую пробку. Ножка плотная, белая на срезе. Спороносный слой отсутствует, споры заключены в теле гриба, которое взрывается при созревании.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Растет на земле, на слабо притененных пространствах. Часто встречается в зарослях кустарника, вблизи дорог.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень-весна.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Съедобна только ножка гриба. Шляпка вызывает отравление, а при употреблении в больших количествах – снижает силу. В алхимии применяются обе части гриба, но отдельно.");
	
	Hero_Knows_Bottle = TRUE;
};
//================================================================
func void MRBook_Show_Trident(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Tri_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Tri_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        Трехглавый сумочник");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Трезубец");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Представляет собой  сросшийся тройной гриб. Центральный гриб обычно выше двух других. Шляпки коричневые, конической формы. Ножка бело-голубая.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"                     Спороносный слой,");
	Doc_PrintLine(docID,0,"                     сумчатый находится ");
	Doc_PrintLine(docID,0,"                     в складках, располо-");
	Doc_PrintLine(docID,0,"                     женных по всей");
	Doc_PrintLine(docID,0,"                     поверхности шляпок.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Чаще вырастает в горах и лесных массивах, но в общем случае его можно встретить где угодно.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: лето-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Условно-съедобен, в сыром виде вызывает слабость и дрожание конечностей. Для употребления в пищу требуется отваривать не менее двух часов в трех водах. В алхимии используется для приготовления как целебных мазей и настоек, так и ядов.");
};
//================================================================
func void MRBook_Show_Branch(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Brch_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Brch_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           Ветвистый гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Веточник, кустистый гриб");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Гриб, имитирующий ветку дерева. Цвет имеет бело-зеленый или бело-коричневый, более светлый у основания. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,0,"Спороносный слой гладкий, ");
	Doc_PrintLine(docID,0,"покрывает верхушки каждой ");
	Doc_PrintLine(docID,0,"ветки.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Встречается достаточно редко, в высокой траве или зарослях кустарника.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: лето-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Съедобен, имеет кисловатый вкус. Наиболее полезны темные верхушки, из которых готовят вытяжку для лечения суставов.");
};
//================================================================
func void MRBook_Show_DragonTears(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Drg_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Drg_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           Драконовы слезы");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Гриб в виде нескольких синих или голубых шариков на тонкой белой ножке. У незрелого гриба шарики наполнены слизистой полупрозрачной массой, у зрелого она высыхает и превращается в споры. Тогда при малейшем прикосновении все шарики взрываются.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Встречается редко, в светлых и открытых, хорошо продуваемых, местах.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: весна-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Ядовит! Слизь и споры разъедают плоть и даже при попадании на кожу вызывают сильное раздражение. Два-три съеденных гриба могут привести к летальному исходу. Используется для приготовления быстродействующих ядов, в малых дозах – для ускорения эффектов целебных мазей.");
};
//================================================================
func void MRBook_Show_NightSparcles(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Nsp_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Nsp_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             Ночные искры");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Маленький гриб, менее пальца в высоту. Красно-оранжевый шарик на белой ложной ножке. В темноте светится красными искрами. Такие грибы всегда растут группами по 10-15 штук.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Эти грибы растут только ночью! При попадании на них солнечного света взрываются, рассеивая ярко-красные споры. Можно найти на пнях и поваленных стволах деревьев.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: лето-осень.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Ценный алхимический гриб! Используется для приготовления ряда целебных зелий и мазей. К сожалению, слишком редок для широкого использования. В сыром виде обладает слабым целебным эффектом. Изредка употребляется в качестве приправы, поскольку имеет островатый привкус. Подобное применение этих грибов – настоящее варварство и расточительство!");
};
//================================================================
func void MRBook_Show_GoldPlate(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gld_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gld_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"              Золотая чаша");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Царское блюдо");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Крупный чашевидный гриб неправильной формы, золотисто-желтого или оранжевого цвета с крупными голубыми и красными пятнами. Ножка отсутствует.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Встречается в местах с высокой концентрацией магической энергии.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: начало осени.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Чрезвычайно редкий и ценный гриб. Сам по себе оказывает лишь слабый целебный эффект, но может служить основой для сильнейших зелий и настоек. Обработка этого гриба является сложным процессом, требующим терпения и внимательности. Только опытные алхимики добиваются нужного результата.");
};
//================================================================
func void MRBook_Show_Ivy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ivy_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ivy_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             Сонный гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Плющевик");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Небольшой гриб с белой ножкой и желто-коричневой шляпкой. Из одной точки растет по 2-4 гриба. Шляпка сначала шаровидная, постепенно раскрывается, края могут загибаться вверх. Спороносный слой трубчатый, белый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Сонный гриб встречается исключительно на скалах и камнях, среди зарослей плюща. Его можно найти и в городе, и в дикой местности.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: осень-зима.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: В сыром виде практически не оказывает эффекта, но в смеси с луговом горцем образует сильнейшее снотворное.");
};
//================================================================
func void MRBook_Show_Violet(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Vlt_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Vlt_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"         Фиолетовая поганка");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Белиарова поганка");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Одиночный гриб ярко-фиолетового окраса. Шляпка коническая, ножка тонкая, но не очень длинная, с оранжевой полосой по середине. В темноте испускает слабое мерцание. Спороносный слой пластинчатый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Вырастает на гнилой древесине: погибших деревьях, пнях, старых постройках. Используется рудокопами для определения балок, которые нуждаются в замене.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Ядовитый гриб! Ни в коем случае нельзя употреблять в пищу, даже небольшой кусочек приводит к мгновенной смерти. Используется для приготовления сильнейших ядов.");
};
//================================================================
func void MRBook_Show_Gray(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gray_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gray_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            Серая поганка");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Пещерная поганка");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Высокий тонкий гриб, равномерного серого окраса. Шляпка конической формы, спороносный слой пластинчатый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Серые поганки растут повсеместно, в сырых и темных местах, под корнями деревьев и в пещерах, всегда большими группами.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Ядовитый гриб! Вызывает головокружение, тошноту, озноб, галлюцинации, причем эффект может продолжаться в течение длительного времени. В больших количествах смертелен. Изредка употребляется в алхимии для изготовления ядов, дешевых, но нестойких.");
};
//================================================================
func void MRBook_Show_Idle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Idle_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Idle_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"     Красный и синий пустырь");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Эти грибы всегда растут большой общей группой.");
	Doc_PrintLines(docID,0,"Ножка белая, длинная и полая внутри. Шляпка плоская или полусферическая, в темноте испускает слабый свет. Спороносный слой пластинчатый, белый.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Пустыри часто встречаются в пещерах, реже - в тени деревьев.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Практически не содержат мякоти, после сбора быстро высыхают и рассыпаются в труху. Несъедобен. Вызывает слабое отравление, смертельные случаи неизвестны.");
};
//================================================================
func void MRBook_Show_Polypore(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Baum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Baum_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           Древесный гриб");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"Древесный полип");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Описание: Лишены каких-либо признаков ножки. Шляпка сверху твердая, одеревеневшая, цвета желтого с зеленым или коричневым оттенком. Спороносный слой трубчатый, плотный, того же цвета, что и вся шляпка.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"Распространение: Древесные грибы, как следует из названия, произрастают на стволах деревьев, как живых, так и поваленных. В отличие от обычных грибов, древесные растут в течение длительного времени, иногда нескольких десятков лет. Примечательно, что они никогда не соседствуют с дамскими ушками.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Сезон: круглогодично.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Свойства: Мякоть древесных грибов несъедобна, но высушенная хорошо горит и может использоваться для изготовления трута.");
};
/*
//================================================================
func void MRBook_Show_Template(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Green_L.tga",0);
	Doc_SetPage(docID,1,"Book_Green_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"                             ");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ");
};
//*/

//================================================================
func void MRBook_Print(var int docID, var int page)
{
	if (Page == 0)	{	MRBook_Show_Cover(docID);	}	else
	if (Page == 1)	{	MRBook_Show_Title(docID);	}	else
	if (Page == 2)	{	MRBook_Show_Summary(docID);	}	else
	if (Page == 3)	{	MRBook_Show_Intro1(docID);	}	else
	if (Page == 4)	{	MRBook_Show_Intro2(docID);	}	else
	
	if (Page == 5)	{	MRBook_Show_MR_01(docID);	}	else
	if (Page == 6)	{	MRBook_Show_MR_02(docID);	}	else
	if (Page == 7)	{	MRBook_Show_Red(docID);	}	else
	if (Page == 8)	{	MRBook_Show_Piny(docID);	}	else
	if (Page == 9)	{	MRBook_Show_BrownOiler(docID);	}	else
	if (Page == 10)	{	MRBook_Show_Stone(docID);	}	else
	if (Page == 11)	{	MRBook_Show_Governor(docID);	}	else
	if (Page == 12)	{	MRBook_Show_Sunrise(docID);	}	else
	if (Page == 13)	{	MRBook_Show_Foggy(docID);	}	else
	if (Page == 14)	{	MRBook_Show_LadysEar(docID);	}	else
	if (Page == 15)	{	MRBook_Show_Keil(docID);	}	else
	if (Page == 16)	{	MRBook_Show_Bottle(docID);	}	else
	if (Page == 17)	{	MRBook_Show_Trident(docID);	}	else
	if (Page == 18)	{	MRBook_Show_Branch(docID);	}	else
	if (Page == 19)	{	MRBook_Show_DragonTears(docID);	}	else
	if (Page == 20)	{	MRBook_Show_Ivy(docID);	}	else
	if (Page == 21)	{	MRBook_Show_NightSparcles(docID);	}	else
	if (Page == 22)	{	MRBook_Show_GoldPlate(docID);	}	else
	if (Page == 23)	{	MRBook_Show_Violet(docID);	}	else
	if (Page == 24)	{	MRBook_Show_Gray(docID);	}	else
	if (Page == 25)	{	MRBook_Show_Idle(docID);	}	else
	if (Page == 26)	{	MRBook_Show_Polypore(docID);	};
	MRBook_Page = page;
};

//================================================================
func void Use_MushroomBook()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(MRBook_Page, MRBook_PageMax, MRBook_Print);
		if (!Read_MRBook_Once)	{
			Read_MRBook_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 30);
		};
	};
};
