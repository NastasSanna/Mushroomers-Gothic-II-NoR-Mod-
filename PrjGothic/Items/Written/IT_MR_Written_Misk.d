
//(C) Дикарь 2016

//--------------------------------------------
//в портовом квартале +
instance ItWr_OldLetter_Godo2Berta(C_ITEM)
{
	name = "Старое письмо";
	mainflag = ITEM_KAT_DOCS;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_OldLetter_Godo2Berta;
	description = name;
	text[1] = "(Найдено в портовом квартале)";
};
func void Use_OldLetter_Godo2Berta()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,1);
		Doc_SetPage(docID,0,"letters.TGA",0);
		Doc_SetMargins(docID,-1,60,100,60,70,1);
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"Милая Берта!");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"В своем прошлом письме ты спрашивала, куда меня определили на службу. Поначалу я надеялся, что меня оставят в каком-нибудь гарнизоне Миртаны. Но вышло все иначе - я зачислен в корпус генерала Ли и вскоре мы отправляемся в Варант. Надо сказать, что Ли, хоть и очень молод, но уже считается лучшим полководцем королевства. Так что, без сомнения, нас под его началом ждут победы, слава и богатая добыча. А после похода я вернусь в родной Хоринис, и мы, наконец, поженимся.");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"Твой Годо.");
		Doc_Show(docID);
		if (!Read_OldLetter_Godo2Berta_Once)	{
			Read_OldLetter_Godo2Berta_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//у Елены на столе +
instance ItWr_MR_OakBranch(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дубовая ветвь";
	text[2] = "(апокрифическое сказание)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_OakBranch;
};
func void Use_OakBranch()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(docID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(docID,0,275,30,25,30,1);
		Doc_SetFont(docID,0,FONT_Calligraphic);
		Doc_PrintLine(docID,0,"  Дубовая ветвь");
		Doc_PrintLine(docID,0,"& & & & & & & & & & & & ");
		Doc_SetFont(docID,0,FONT_MR);
		Doc_PrintLine(docID,0,"");
		Doc_PrintLines(docID,0,"...Ния же, будучи девицей миловидною, приглянулась некоему дворянину, бывшему при дворе короля Коборна, пращура нынешнего Робара. И начал коварный искуситель прельщать ее ценными подарками и обещаниями вечной любви. Не устояла Ния, самым дорогим достоянием всякой благородной девицы поступившись.");
		Doc_SetMargins(docID,-1,25,40,275,30,1);
		Doc_SetFont(docID,1,FONT_MR);
		Doc_PrintLine(docID,1,"");
		Doc_PrintLines(docID,1,"А вельможа вскоре позабыл ее, пререпорхнув, подобно ветреному мотыльку, на другой цветок. Барон, узнав о бесчестье дочери, хотел вызвать коварного совратителя на рыцарский поединок, но устрашился гнева короля, у которого вельможа тот был в фаворе. Посему поединка он учинять не стал, а Нию, честь родовую растоптавшую, выгнал вон. Она же ушла к ведьмам из Круга Земли, став через недолгое время одной из высших...");
		Doc_Show(docID);
		if (!Read_OakBranch_Once)	{
			Read_OakBranch_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//у гоблинов в пещере под башней Ксардаса +
instance ItWr_MR_BiographyBartosLaran(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Биография Бартоса Ларанского";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_BiographyBartosLaran;
};
func void Use_BiographyBartosLaran()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_RED_L.tga",0);
		Doc_SetPage(docID,1,"Book_RED_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLines(docID,0,"Биография Бартоса Ларанского");
		Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"Бартос Ларанский (1176-1228 годы) известен как автор множества ученых трактатов о магии, истории и мироустройстве. В молодые годы много путешествовал, учился в монастыре Огня в Нордмаре, у друидов Миртаны и шаманов Южных островов.");
		Doc_SetMargins(docID,-1,30,30,275,30,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"В зрелом возрасте вернулся в родной Ларан, где подвизался при дворе короля в качестве наставника троих его сыновей.");
		Doc_PrintLines(docID,1,"Широко прославился ученостью, благочестием, пышными пирами и склонностью к слабому полу. Погиб во время нашествия орков, известного как “Битва за Ларан“. Злые языки утверждают, что Бартос был казнен за измену. Однако имеются сведения, что его погребли под собой обломки башни, разрушенной орочьим тараном.");
		Doc_Show(docID);
		if (!Read_BiographyBartosLaran_Once)	{
			Read_BiographyBartosLaran_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//на уступе над кузницей Гарада +
instance ItWr_MR_SmithGuide(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Наставление кузнецу";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_SmithGuide;
};
func void Use_SmithGuide()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(docID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(docID,0,275,20,30,20,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLine(docID,0,"");
		Doc_PrintLines(docID,0,"Наставление кузнецу");
		Doc_PrintLine(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"Только что выкованный клинок подобен неопытному юноше, коему еще предстоит стать умелым воином. Дабы проявить все заложенные от природы свойства, человеку требуется воспитание, а мечу - закалка.");
		Doc_SetMargins(docID,-1,30,20,275,20,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"Клинок накаляй до тех пор, пока цветом и яркостью он не станет подобен предзакатному солнцу. После того плавно и ровно опусти его острием вниз в растопленный жир кротокрыса и держи там, пока сталь не остынет. Неплохо закаляется клинок в обычной родниковой воде, если прежде растворить в ней красную соль.");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLines(docID,1,"Говорят, что безбожные орки остужают свои клинки в телах еще живых рабов. Но верующему в Инноса такой способ претит.");
		Doc_Show(docID);
		if (!Read_SmithGuide_Once)	{
			Read_SmithGuide_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//у Сагитты +
instance ItWr_MR_SunExtract(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Экстракт солнца";
	text[1] = "(наставление по виноделию)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_SunExtract;
};
func void Use_SunExtract()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_RED_L.tga",0);
		Doc_SetPage(docID,1,"Book_RED_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLines(docID,0,"ЭКСТРАКТ СОЛНЦА");
		Doc_PrintLines(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"Светлый Иннос, коему мы служим, покровительствует не только королевским воинам, кузнецам или алхимикам, но и виноделам. Именно поэтому вино, изготовленное в нашем монастыре - одно из наиболее ценимых во всей Миртане.");
		Doc_SetMargins(docID,-1,30,30,275,30,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"Для лучшего брожения бери только самые спелые ягоды дикого и лесного винограда, собранные в ясный солнечный день и смешанные в равной пропорции. Помолившись Инносу и уложив ягоды в чан, тщательно выдави сок. Потом перелей сок в чистые дубовые бочки и опусти в подвал, высеченный в толще скалы. Лишь там вино сможет хорошо выбродить и дозреть, сконцентрировав в себе накопленный ягодами небесный огонь.");
		Doc_Show(docID);
		if (!Read_SunExtract_Once)	{
			Read_SunExtract_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//в Монастыре +
instance ItWr_MR_OnAlchemy(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Об алхимии";
	text[1] = "(трактат)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_OnAlchemy;
};
func void Use_OnAlchemy()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_MAGE_L.tga",0);
		Doc_SetPage(docID,1,"Book_MAGE_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLine(docID,0,"Об алхимии");
		Doc_PrintLines(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"Высшая цель алхимической науки заключается в том, чтобы споспешествовать Инносу в установлении Порядка в мире. Преобразуя вещества, делатель упорядочивает их, возводит на высшую ступень, приближает к идеалу. ");
		Doc_SetMargins(docID,-1,30,40,275,40,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"И тогда простые, то есть хаотичные, вещества, в коих самих по себе пользы нет ни на грош, обретают чудесные свойства. При этом и душа делателя, приучающего себя к неустанным трудам и строгому распорядку, приближается к тому, что Иннос желает видеть в своих детях.");
		Doc_Show(docID);
		if (!Read_OnAlchemy_Once)	{
			Read_OnAlchemy_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//на маяке +
instance ItWr_MR_UnderInnosEye(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 350;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Под Оком Инноса";
	text[2] = "(географический трактат)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_UnderInnosEye;
};
var int UnderInnosEye_Page;
const int UnderInnosEye_Page_Max = 10;
const string UnderInnosEye_Text[UnderInnosEye_Page_Max] =
{
	"",
	"",
	"Маги Огня уверяют, будто мир наш подобен огромному яблоку и вращается вокруг солнца. Мнение это они обосновывают тем, что Огонь и Свет, которые дарует Иннос, есть центр мироздания, вокруг которого движется все сущее в нем. Но нам, магам Воды, доподлинно известно, что в центре, между Тьмой и Светом, лежат владения Аданоса. А посему мир наш не может вращаться вокруг солнца, ибо он сам - середина мироздания.",
	"Состоит мир из океанских вод, простирающихся от Обители Света до Чертогов Тьмы. Над водой высятся земли, наполненные по милости Аданоса деревьями, травами, животными и населенные людьми.",
	"Нам известна лишь небольшая часть владений Аданоса. В середине их лежит Миртанское море, но оно - лишь малая часть великого океана. На западе море омывает берега материка, на котором расположены королевства Миртана, Нордмар и Варант. Последние, впрочем, ныне подчинены миртанской короне.",
	"С запада земли эти упираются в неприступные горы. Мало кому удавалось проникнуть через каменную преграду, а потому земли, которые она столь ревностно оберегает, именуют Неизвестными или Неведомыми. О них рассказывают разное: будто бы за горами раскинулись великие орочьи королевства, обитают драконы, лежит славная и богатая страна Джектил. Но никто из ныне живущих в тех местах не был.",
	"С юга море Миртанское отделяют от просторов океана Южные острова, расположенные к юго-востоку от варрантского побережья. Славны они густыми лесами, жемчугом и жгучим перцем. Архипелаг этот весьма пространный, состоит из десятков больших островов и неисчислимого множества малых. Часть их в нынешнее время также присоединена к Миртане.",
	"По глади Миртанского моря разбросано немало мелких островков. Иные из них гористые, прочие плоские и покрыты песком. Моряки рассказывают, что некоторые из этих кусочков суши, рассыпанных щедрой рукой Держателя Равновесия, населены мирными рыбаками, пиратами, беглыми каторжниками или даже орками.",
	"Редкая цепочка гористых островов ограничивает Миртанское море с севера. На них почти никто не живет, они бедны растительностью, а на вершинах некоторых из них никогда не тает снег, как в горах Нордмара. Во всяком случае, так говорят те немногие, кто там побывал.",
	"С востока же между океаном и морем лежит остров Хоринис. Он давно уже стал драгоценнейшим украшением миртанской короны, ибо место это - единственное в мире, где находят залежи магической руды. Остров Хоринис состоит из долин, разделенных горами. Но никто точно не знает ни количества долин, ни истинных размеров острова..."
};
func void UnderInnosEye_Print(var int docID, var int page)
{
	MEM_Debug(IntToString(page));
	var string txt;
	Doc_SetPages(docID, 2);
	Doc_SetPage(docID,0,"Book_MAGE_L.tga",0);
	Doc_SetPage(docID,1,"Book_MAGE_R.tga",0);
	//страница слева
	Doc_SetMargins(docID, 0, 275, 35, 25, 40, 1);
	//заголовок на 1 странице
	if (page == 0)	{
		Doc_SetFont(docID,1,FONT_ManuscriptHeadline);
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"       *  *  *");
		Doc_PrintLine(docID,1,"   Под Оком Инноса");
		Doc_PrintLine(docID,1,"");
		Doc_SetFont(docID,1,FONT_Manuscript);
		Doc_PrintLine(docID,1,"  географический трактат");
		Doc_SetFont(docID,1,FONT_ManuscriptHeadline);
		Doc_PrintLine(docID,1,"       *  *  *");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_SetFont(docID, 1, FONT_ScreenSmall);
		Doc_PrintLine(docID,1,"               Управление:");
		Doc_PrintLine(docID,1,"         СТРЕЛКИ, Home, End");
	}
	else	{
		Doc_SetFont(docID, 0, FONT_Manuscript);
		txt = MEM_ReadStatStringArr(UnderInnosEye_Text, page * 2);
		if (page > 0)	{
			Doc_PrintLine(docID,0,CS3("Љ        ~", IntToString(page * 2 + 1), "~"));
			Doc_PrintLine(docID,0,"");
		};
		Doc_PrintLines(docID, 0, txt);
		//страница справа
		Doc_SetMargins(docID, 1, 25, 35, 275, 40, 1);
		Doc_SetFont(docID, 1, FONT_Manuscript);
		if (page < UnderInnosEye_Page_Max / 2 - 1)	{
			Doc_PrintLine(docID,1,CS3("         ~", IntToString(page * 2 + 2), "~        Њ"));
			Doc_PrintLine(docID,1,"");
		}
		else	{
			Doc_PrintLine(docID,1,CS3("         ~", IntToString(page * 2 + 2), "~"));
			Doc_PrintLine(docID,1,"");
		};
		txt = MEM_ReadStatStringArr(UnderInnosEye_Text, page * 2 + 1);
		Doc_PrintLines(docID, 1, txt);
	};
	UnderInnosEye_Page = page;
};
func void Use_UnderInnosEye()
{
	if (Npc_IsPlayer(self))	{
		MultiBook_Start(UnderInnosEye_Page, UnderInnosEye_Page_Max / 2, UnderInnosEye_Print);
		if (!Read_UnderInnosEye_Once)	{
			Read_UnderInnosEye_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * UnderInnosEye_Page_Max / 2);
		};
	};
};


//--------------------------------------------
//У Дикаря +
instance ItWr_MR_AboutDragons(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 450;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "О драконах";
	text[2] = "Потрепанный увесистый том";
	text[3] = "с изображением дракона на обложке";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_AboutDragons;
};

var int AboutDragons_Page;
const int AboutDragons_PagesCount = 10;

func void Use_AboutDragons()
{
	if (Npc_IsPlayer(self))	{
		MultiBook_Start(AboutDragons_Page, AboutDragons_PagesCount, AboutDragons_Print);
		if (!Read_AboutDragons_Once)	{
			Read_AboutDragons_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * AboutDragons_PagesCount);
		};
	};
};

func void AboutDragons_SetMerginsL(var int docID)
{
	Doc_SetMargins(docID, 0, 170, 45, 40, 45, 1);
};
func void AboutDragons_SetMerginsR(var int docID)
{
	Doc_SetMargins(docID, 1, 40, 45, 170, 45, 1);
};
func void AboutDragons_PrintPageN(var int docID, var int pageN)
{
	const string padding = "              ";
	var string txt;	txt = CS3(padding, IntToString(pageN), padding);
	if (pageN % 2 == 0)	{
		if (pageN != (AboutDragons_PagesCount - 1) * 2)	{
			txt = ConcatStrings(txt, "Њ");//->
		};
		Doc_SetFont(docID,1,FONT_Manuscript);
		Doc_PrintLine(docID,1,txt);
		Doc_PrintLine(docID,1,"");
	}
	else	{
		txt = ConcatStrings("Љ", txt);//<-
		Doc_SetFont(docID,0,FONT_Manuscript);
		Doc_PrintLine(docID,0,txt);
		Doc_PrintLine(docID,0,"");
	};
};

func void AboutDragons_Print_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"Book_Dragon_Title.tga",0);
	
	Doc_SetMargins(docID,0,100,150,100,35,1);
	Doc_SetFont(docID,0,FONT_Screen);
	Doc_PrintLine(docID,0,"    О   Д Р А К О Н А Х");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_SetFont(docID,0,FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"   Управление: СТРЕЛКИ, Home, End");
};
func void AboutDragons_Print_P01(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Pic_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,2);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Злокозненные крылатые ящеры, что зовутся драконами - суть одно из отвратительнейших Белиаровых порождений. О природе и достоверных случаях встреч с этими гнусными тварями, одним своим существованием оскорбляющими Инноса, и расскажу я, недостойный, в этой книге.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLine(docID,1,"Смиренный Флавиус Венгардский, ");
	Doc_PrintLine(docID,1,"маг Огня пятого круга.");
	Doc_PrintLine(docID,1,"59 год от начала Новой эпохи.");
};
func void AboutDragons_Print_P02(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,3);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Доводилось мне слышать от знающих людей, что проклятый Зверь, призванный повелителем Тьмы, о коем говорится в наших священных книгах, и есть дракон. Однако со всей определенностью сие ни в одном достоверном источнике не указано.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Природа драконов весьма причудлива и порой самому здравому смыслу противна. ");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,4);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Телом, что лишено волос и покрыто чешуей, они подобны варанам, глорхам, жерхам, которых зовут также снепперами и остерами, и прочим ползучим гадам, с тем лишь различием, что рост драконов огромен и у них имеются крылья.");
	Doc_PrintLines(docID,1,"Многие достойные уважения маги и рыцари древних времен, воочию видевшие драконов, уверяют, что рост Белиаровых порождений равен росту десяти-пятнадцати зрелых мужей и даже более, а крылья их втрое превышают паруса самого большого корабля. У нас нет оснований не доверять этим сведениям, дошедшим от нас от очевидцев.");
};
func void AboutDragons_Print_P03(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,5);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Тело драконов, как уже было упомянуто, сплошь покрыто чешуей. В собрании одного лорда, род которого восходит к временам Старой Империи, мне доводилось видеть настоящую драконью чешуйку. Шириной она в две ладони, толщиной с большой палец, а твердостью превосходит лучшую сталь, выплавляемую из магической нордмарской руды. При том она легка, словно сухое дерево.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,6);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Форму драконья чешуя имеет заостренную, а ежели посмотреть сбоку, то слегка выпуклую. Вероятно, чешуйки на шкуре плотно прилегают одна к другой, образуя непробиваемый панцирь. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Посему немудрено, что герои древности порой носили доспехи, изготовленные из чешуи дракона. Об этом упоминается во многих легендах и преданиях.");
};
func void AboutDragons_Print_P04(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,7);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Впрочем, сведения о форме драконьей чешуи в источниках разнятся, как и об ее цвете. В одних старых книгах говорится, что драконы имеют цвет пламени. Другие авторы уверяют, что они подобны бурой болотной тине или серому камню. А один рыцарь утверждал, будто видел дракона белого, словно снег. Иные же маги в своих записках клянутся именем Инноса, что драконы могут становиться нежитью и в этом случае приобретают угольно-черную или пепельную окраску.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,8);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Ни опровергнуть, ни подтвердить этих утверждений возможным не представляется. Та чешуйка, что мне показывали, цвет имела совершенно черный. Но это оттого лишь, что ее владелец любил показывать изумленным гостям, что чешуя дракона совершенно не подвержена воздействию пламени. Посему он часто бросал ее в камин, от чего она покрылась слоем сажи и копоти.");
};
func void AboutDragons_Print_P05(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Pic_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,9);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Помимо могучей брони, драконы вооружены и разнообразными наступательными средствами. Многие древние авторы упоминают о когтях и клыках длиной в локоть, а то и в целое копье. Но все они сходятся на том, что драконы обладают способностью выдыхать смертоносное пламя. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Ничего невероятного в этом нет, если вспомнить, что подобной способностью наделены и вполне обычные существа, известные как огненные вараны или огненные ящеры.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,10);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Уж их-то доводилось встречать каждому воину, путешественнику или охотнику. Вероятно, эти существа состоят с драконами в дальнем родстве.");
};
func void AboutDragons_Print_P06(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,11);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"О размножении драконов, а также о том, образуют ли они семьи или стаи, известно мало. Доподлинно можно утверждать только, что драконы откладывают яйца, из каковых и рождается их потомство. Мне доводилось слышать, будто в одном горном монастыре хранится скорлупа драконьих яиц, но сам в тех краях еще не бывал и скорлупы не видел. Но, как говорят, размером драконьи яйца много крупнее человеческой головы.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,12);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Все драконы, о коих идет речь в старых книгах и письмах, обитали обособленно. Но тут следует заметить, что одержать победу сразу над целой стаей драконов не смог бы ни один герой. Поэтому можно предположить, что стали героями и оставили после себя воспоминания лишь те, кто встречал не более одного дракона. Те же, кто имел несчастье повстречать двух драконов или больше, героями не стали, а были убиты и съедены проклятыми чудовищами.");
};
func void AboutDragons_Print_P07(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,13);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Также многие упоминают неких ящероподобных существ, что ходят на двух ногах и носят оружие. Будто бы они всюду следуют за драконами, охраняя их самих и кладки яиц, что драконицы откладывают в глубоких пещерах, обогреваемых подземным огнем. Создания эти именуются обыкновенно людоящерами. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Некий маг Воды писал даже, что якобы людоящеры тоже вылупляются из драконьих яиц, и что лишь из одного яйца на сотню или две вылупляется дракон, а из остальных появляются людоящеры, которые впоследствии становятся его слугами и стражами. ");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,14);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Думается, подобные утверждения стоит списать на фантазию, коей маги Воды бывают подвержены более прочих людей. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Мы не можем даже с уверенностью утверждать, делятся ли драконы на самцов и самок, как это свойственно большинство живых созданий. Мой наставник, почтеннейший Пиродориус, был уверен, что каждый из драконов содержит в себе и мужское, и женское начало, а потому способен производить потомство в одиночку. С моей стороны было бы непростительной дерзостью оспаривать мнение учителя.");
};
func void AboutDragons_Print_P08(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,15);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Несмотря на диковинный звероподобный облик драконов, все авторы единодушно уверяют, что они наделены разумом и даром речи. Многие рыцари, прежде чем вступить в смертельную схватку с драконом, говорили с ним о разных вещах. Чаще всего порождения Белиара изрыгали угрозы и хулу на Инноса, но порой хитростью пытались склонить героев на сторону Тьмы и Хаоса.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,16);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Одержать победу над драконом невероятно сложно. Кроме естественного вооружения, пламени и разума, все они наделены толикой темной магии. Поэтому выдержать сражение с драконом можно, лишь имея при себе какой-нибудь сильный магический артефакт, наполненный светлой силой. Самое действенное средство против них - амулет “Глаз Инноса“, что хранится в монастыре на Хоринисе, куда я намерен направиться в скором времени.");
};
func void AboutDragons_Print_P09(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,17);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"Существуют ли драконы сейчас? Не берусь ни утверждать этого, ни уверять в обратном. В наше время драконы не встречаются. Те “очевидцы“, коих мне доводилось опрашивать, оказывались либо явными лжецами, либо сумасшедшими. А самому свежему свидетельству из тех, что достойны доверия, более семи сотен лет. Вероятно, все драконы вымерли.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,18);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"Может быть, их перебили древние герои, а, может, они переполнили чашу терпения Инноса и он стер их с лика нашего мира, ненадолго забыв о своем договоре с Аданосом.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"Как бы то ни было, драконы ныне уже не встречаются.");
};

func void AboutDragons_Print(var int docID, var int page)
{
	if (page == 0)	{	AboutDragons_Print_Cover(docID);	}	else
	if (page == 1)	{	AboutDragons_Print_P01(docID);	}	else
	if (page == 2)	{	AboutDragons_Print_P02(docID);	}	else
	if (page == 3)	{	AboutDragons_Print_P03(docID);	}	else
	if (page == 4)	{	AboutDragons_Print_P04(docID);	}	else
	if (page == 5)	{	AboutDragons_Print_P05(docID);	}	else
	if (page == 6)	{	AboutDragons_Print_P06(docID);	}	else
	if (page == 7)	{	AboutDragons_Print_P07(docID);	}	else
	if (page == 8)	{	AboutDragons_Print_P08(docID);	}	else
	if (page == 9)	{	AboutDragons_Print_P09(docID);	};
	AboutDragons_Page = page;
};
