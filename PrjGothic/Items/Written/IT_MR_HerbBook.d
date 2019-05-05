
//(C) Дикарь 2017

instance ItWr_HerbBook(C_Item)
{
	name = "Диссертация";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	
	//UNFINISHED
	visual = "addon_dungeon_scrolls_01.3DS";
	material = MAT_LEATHER;
	
	description = "О травах";
	text[2] = "Научные изыскания мага Сатураса";
	text[3] = "флоре Хориниса посвященные";
	
	
	scemeName = "MAP";
	on_state[0] = Use_HerbBook;
};

const Int HerbBook_Left_Margin = 101;
const Int HerbBook_Right_Margin = HerbBook_Left_Margin - 10;
const Int HerbBook_Top_Margin = 70;
const Int HerbBook_Btm_Margin = 50;

var int HerbBook_Page;
const int HerbBook_PageMax = 22;

//================================================================
func void HerbBook_Show_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Title.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin+10,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"  Управление: СТРЕЛКИ, Home, End");
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"            О");
	Doc_PrintLine(docID,0,"            т р а в а х");
};

//================================================================
func void HerbBook_Show_Summary(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_SomeHerbs.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Населяя созданную Инносом землю, Аданос в мудрости своей наполнил ее самыми разнообразными травами. Иные из них годятся разве что на корм овцам, но немало и таких, что способны принести великую пользу здоровью человека или же способствовать укреплению его духа. О них и пойдет речь в этой книге, в которой собраны знания многих опытных ведьм, знахарей и алхимиков.");
	Doc_PrintLines(docID,0,"Большинство целебных, укрепляющих и бодрящих трав, цветов, корней и ягод оказывают благотворное действие в сыром виде, будучи собранными в положенный срок. ");
};
//================================================================
func void HerbBook_Show_Summary2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Potions.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Однако истинную свою силу они раскрывают в лишь зельях, которые способен приготовить опытный алхимик, в правильных пропорциях смешивая части растений с вытяжками и чистой родниковой водой. Иные травы сами по себе действие имеют слабое, но, смешанные вместе, многократно усиливают друг друга и оказывают по истине чудесное действие. Впрочем, о способах приготовления зелий рассказано в многочисленных и широко доступных наставлениях по алхимии, а посему на них мы останавливаться не будет. Расскажем о самих травах.");
};


//================================================================
func void HerbBook_Show_Fruits1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Apple.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+15,HerbBook_Right_Margin + 3,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Плоды и ягоды");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"Целебными свойствами "); 
	Doc_PrintLines(docID,0,"обладают многое плоды, произрастающие на травах, деревьях и кустарниках."); 
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Даже обычные яблоки и виноград укрепляют здоровье и способствуют скорейшему исцелению от болезней. Похожее, но более сильное действие оказывают крупные ягоды, произрастающие на прямостоячих или стелющихся по земле кустарничках семейства Огнеплодниковых.");
};
//================================================================
func void HerbBook_Show_Fruits2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_FireBerry.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin+2,HerbBook_Top_Margin+10,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Такова огневая колючка, именуемая также огненной ягодой, которая дает средний по силе исцеляющий эффект. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Немалую пользу приносит голубика, названная так за цвет, в который она окрашивает губы и язык. Лесные и дикие ягоды, отличающиеся некрупными рыхлыми соплодиями принадлежащие к семейству Мелкоягодных, обладают хотя и менее сильным, но похожим исцеляющим действием. ");
};

//================================================================
func void HerbBook_Show_Fruits3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Berries.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin + 45,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Особое место среди подобных растений занимают ягода гоблина, серафис и вишня троллей. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Первое из этих растений по виду напоминает лесные ягоды и относятся к тому же семейству, однако на заживление ран никакого действия не оказывает. Зато таким образом влияет на мышцы и сухожилия, что употребляющий ягоду гоблина человек становится более подвижным и ловким.");
};

//================================================================
func void HerbBook_Show_Fruits4(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Seraphis.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Действие серафиса, именуемого также синей бузиной, бывает разным в зависимости от времени года. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Будучи сорванным весной или в начале лета, в пору цветения, серафис по своему действию подобен огневой колючке. ");
	Doc_PrintLines(docID,0,"Но если дождаться созревания ягод, которое обычно приходится на конец лета и осень, то можно убедиться, что действие серафиса изменилось. ");
	Doc_PrintLines(docID,0,"В эту пору исцеляющий эффект его снижается вдвое, но зато появляется способность укреплять магические силы. Чаще всего серафис относят к семейству Велейсовых, но порой выделяют в отдельное семейство.");
};
//================================================================
func void HerbBook_Show_Fruits5(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_TrollBerry.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Самая загадочная ягода - вишня троллей или же тень тролля, причисляемая к семейству Огнеплодниковых. ");
	Doc_PrintLine(docID,0," ");
	Doc_PrintLines(docID,0,"В отличие от большинства других подобных растений, плоды которых при созревании обретают красный или фиолетовый цвет, вишня троллей всегда остается зеленой.");
	Doc_PrintLine(docID,0," ");
	Doc_PrintLine(docID,0,"Если ее съесть ");
	Doc_PrintLine(docID,0,"в сыром виде, ");
	Doc_PrintLine(docID,0,"то никакого ");
	Doc_PrintLine(docID,0,"видимого действия ");
	Doc_PrintLine(docID,0,"не произойдет. ");
};
//================================================================
func void HerbBook_Show_Fruits6(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Но в трудах древних целителей имеются смутные известия, что прежде декокты из этой ягоды применяли для повышения мужской силы и увеличения плодовитости женщин. ");
	Doc_PrintLines(docID,0,"Однако ни одного рецепта таких зелий до нашего времени не сохранилось. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"По некоторым данным, вишня троллей способна усиливать и мышцы, но правильно выбрать время, когда ее нужно собрать для этого, очень трудно");
};


//================================================================
func void HerbBook_Show_Herbs1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Лечебные травы");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Это большая и разнообразная группа растений семейства Велейсовых, обладающая слабым и средним исцеляющим воздействием. Прямые темно-зеленые листья целебных трав, с возрастом нередко обретающие темно-золотистую окраску, бывают собраны у самой земли в тугие розетки. Плоды, как правило, мелкие и невзрачные, но иногда крупные и сочные как у самого велейса и у серафиса. Образуются они или непосредственно над розеткой, или на вырастающим из ее сердцевины коротком толстом стебле.");
};
//================================================================
func void HerbBook_Show_Herbs2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_HealHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"К растениям этой группы относятся обычная лечебная трава, солнечник, ночная тьма, орочий лист, лунник (иногда именуемый  лунной тенью), а также велейс, по особенностям действия похожий на серафис, но имеющий не фиолетовые, а желтые ягоды и ряд иных особенностей.");
};
//================================================================
func void HerbBook_Show_Herbs3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Целительные растения");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Это травы, относящиеся к нескольким различным семействам, которые объединяют в одну условную группу по оказываемому ими сильному целебному воздействию. ");
	Doc_PrintLines(docID,0,"Лечебное растение, целительная трава, целебное растение, дуболист принадлежат к семейству Велейсовых, но сочных плодов не образуют. Мелкие, едва различимые глазом цветки и семена у них образуются на коротких стеблях, которые редко бывают в высоту по колено взрослому человеку или орку. Эти-то стебли, а также розетки листьев, и используются для исцеления ран, болезней и приготовления зелий.");
};
//================================================================
func void HerbBook_Show_Herbs4(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_HealRoot.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+20,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"Наиболее сильным цели-");
	Doc_PrintLine(docID,0,"тельным воздействием ");
	Doc_PrintLine(docID,0,"обладает лечебный ");
	Doc_PrintLine(docID,0,"корень - наиболее ");
	Doc_PrintLine(docID,0,"крупное и мощное ");
	Doc_PrintLine(docID,0,"растение семейства ");
	Doc_PrintLine(docID,0,"Мелкоягодных. ");
	Doc_PrintLine(docID,0,"Правда, яркие желтые, ");
	Doc_PrintLine(docID,0,"оранжевые или красные ");
	Doc_PrintLine(docID,0,"плоды этого растения ");
	Doc_PrintLine(docID,0,"несъедобны. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Лечебным эффектом обладает корень, в котором содержание полезных веществ очень высоко. Из него можно приготовить самые сильные лекарства, некоторые из которых не только лечат, но и повышают жизненную силу.");
};
//================================================================
func void HerbBook_Show_Herbs5(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_FireHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Магические травы");
	Doc_PrintLine(docID,0,"");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Многие растения семейства Велейсовых, а также некоторых иных семейств, не обладают целебным воздействием. Зато они способны укреплять дух и восстанавливать магическую силу. Наиболее высоко их ценят служители Инноса, Аданоса и Белиара. Однако и простым смертным эти растения способны принести немалую пользу.");
};
//================================================================
func void HerbBook_Show_Herbs6(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_CrowHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Огненная крапива и вороньи травы обладают слабым укрепляющим эффектом, хотя и превосходящим по действию спелый серафис, огненная и темная травы - средним, а огненный корень - более сильным. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Еще скорее восстанавливает магическую мощь каменный корень, однако он относится не к Велейсовым, как почти все прочие подобные растения, а к Эдельвейсовым. Но, в отличие от своей родни, способен расти не только в горах, но и в обычном лесу и даже на болотах.");
};


//================================================================
func void HerbBook_Show_FalseMoss1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Ложномоховые");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Весьма оригинальную группу растений составляют представители семейства Ложномоховых. ");
	Doc_PrintLines(docID,0,"По своему облику они действительно напоминают моховую подушку, но, в отличие от настоящих мхов, имеют мощные корни и настоящие цветки. Впрочем, цветение ложномоховых трав мало кто наблюдал, поскольку цветет каждое из таких растений лишь на протяжении одной ночи в году, а утром их мелкие цветки жухнут, тонкие цветоносы высыхают под воздействием солнечных лучей.");
};
//================================================================
func void HerbBook_Show_FalseMoss2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Растут ложномоховые чаще всего в трещинах скал, старых каменных кладках, стволах и пнях больших деревьев.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Наиболее известны три растения этого семейства. Горный и могильный мох обладают средним по силе целебным действием и часто используются для лечения ран пастухами, охотниками и расхитителями древних гробниц.");
};
//================================================================
func void HerbBook_Show_FalseMoss3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_DragonRoot.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+160,HerbBook_Right_Margin-2,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Наиболее же известный представитель ложномоховых - драконий корень. Нежная зелень молодых растений способна восстанавливать магическую силу еще быстрее, чем упоминавшиеся выше огненный и каменный корни. Впоследствии надземная часть растения грубеет и приобретает более темный цвет, а все полезные соки растения перетекают в его корень. Употребление его помогает заметно укрепить мышцы.");
};
//================================================================
func void HerbBook_Show_Special1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,"Особые и легендарные растения");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"В эту группу мы включаем растения с особыми свойствами, в том числе и те, существование которых твердо не доказано. Зачастую растения эти упоминаются лишь в старинных алхимических рецептах и легендах. Таковы, к примеру, солнечный алоэ, якобы произрастающий лишь на земле, удобренной пометом горного тролля, сверчковая трава с острова Тамора, песчанка с Адармоса или же ядовитый яктильский кактус. На них мы подробно останавливаться не станем, сосредоточившись лишь на тех травах, существование которых сомнению не подлежит.");
};
//================================================================
func void HerbBook_Show_Special2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Наиболее известное и распространенное из растений сего рода чаще всего называют полевым горцем или перекати-полем. Внешне оно напоминает обычную репу, отличаясь от нее более узкими листьями и менее развитым корнеплодом. Сам по себе полевой горец обладает лишь слабым исцеляющим эффектом, но способен усиливать действие других трав в составе алхимических экстрактов и эликсиров.");
	Doc_PrintLines(docID,0,"Снепер-трава, именуемая также травой глорха, встречается нечасто. Она принадлежит к семейству Велейсовых. Действие ее проявляется в значительном усилении скорости бега на непродолжительный срок. В составе алхимических зелий в сочетании с полевым горцем снеппер-трава сохраняет свой эффект на длительный срок.");
};

//================================================================
func void HerbBook_Show_Special3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Crown.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Значительно более редко встречается трава, именуемая царским щавелем или коронным зельем. ");
	Doc_PrintLines(docID,0,"Это чрезвычайно ценное растение обладает сходным с полевым горцем свойством усиливать действие других трав. Но свойство это у коронного зелья выражено куда более сильно. В силу редкости и дороговизны его применяют лишь в составе зелий, повышающих ловкость, магические и мыслительные способности, а также здоровье и силу.");
};

//================================================================
func void HerbBook_Show_End(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Final.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,"Конечно, в этой книге мы рассказали далеко не обо всех травах, волею Аданоса произрастающих на полях, в горах, водоемах или чаще леса. Свойства многих из них, а порой и само их существование, должны стать предметом будущих исследований Круга Воды.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Сатурас,");
	Doc_PrintLines(docID,0,"смиренный служитель Аданоса");
};


//================================================================
func void HerbBook_Print(var int docID, var int page)
{
	if (Page == 0)	{	HerbBook_Show_Cover(docID);	}	else
	if (Page == 1)	{	HerbBook_Show_Summary(docID);	}	else
	if (Page == 2)	{	HerbBook_Show_Summary2(docID);	}	else
	if (Page == 3)	{	HerbBook_Show_Fruits1(docID);	}	else
	if (Page == 4)	{	HerbBook_Show_Fruits2(docID);	}	else
	if (Page == 5)	{	HerbBook_Show_Fruits3(docID);	}	else
	if (Page == 6)	{	HerbBook_Show_Fruits4(docID);	}	else
	if (Page == 7)	{	HerbBook_Show_Fruits5(docID);	}	else
	if (Page == 8)	{	HerbBook_Show_Fruits6(docID);	}	else
	if (Page == 9)	{	HerbBook_Show_Herbs1(docID);	}	else
	if (Page == 10)	{	HerbBook_Show_Herbs2(docID);	}	else
	if (Page == 11)	{	HerbBook_Show_Herbs3(docID);	}	else
	if (Page == 12)	{	HerbBook_Show_Herbs4(docID);	}	else
	if (Page == 13)	{	HerbBook_Show_Herbs5(docID);	}	else
	if (Page == 14)	{	HerbBook_Show_Herbs6(docID);	}	else
	if (Page == 15)	{	HerbBook_Show_FalseMoss1(docID);	}	else
	if (Page == 16)	{	HerbBook_Show_FalseMoss2(docID);	}	else
	if (Page == 17)	{	HerbBook_Show_FalseMoss3(docID);	}	else
	if (Page == 18)	{	HerbBook_Show_Special1(docID);	}	else
	if (Page == 19)	{	HerbBook_Show_Special2(docID);	}	else
	if (Page == 20)	{	HerbBook_Show_Special3(docID);	}	else

	if (Page == 21)	{	HerbBook_Show_End(docID);	};
	HerbBook_Page = page;
};

//================================================================
func void Use_HerbBook()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(HerbBook_Page, HerbBook_PageMax, HerbBook_Print);
		if (!Read_HerbBook_Once)	{
			Read_HerbBook_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 10);
		};
	};
};

