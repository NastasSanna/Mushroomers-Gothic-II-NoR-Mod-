
//в казармах читает Вульфгар +
var int Bookstand_Report_Page;

func void Use_Bookstand_Report_Page0(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,50,55,40,1);
	Doc_PrintLine(docID,0,"                ПРОТОКОЛ");
	Doc_PrintLine(docID,0,"      о хищении в Верхнем квартале");
	Doc_PrintLine(docID,0,"        портового города Хориниса");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Сего числа сего года от гражданина Г. в уполномоченные органы поступило заявление о незаконном присвоении (хищении) имущества, коим является небольшой предмет из драгоценного металла серого цвета с украшением из драгоценного камня красного цвета (серебряное кольцо с рубином).");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Уполномоченные органы в лице городского патруля незамедлительно среагировали на факт обращения и прибыли на место происшествия. Выполнив опрос свидетелей и осмотр вещественных доказатальств, ответственные лица в лице стажников П. и Х. приступили к погоне.");
	Doc_SetFont(docID, 0, FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"      Управление: СТРЕЛКИ, Home, End");
	Doc_Show(docID);
};
func void Use_Bookstand_Report_Page1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,70,55,40,1);
	Doc_PrintLines(docID,0,"Предполагаемый преступник двигался в направлении Рыночной площади. Дабы пресечь сокрытие с места преступления путем Восточных ворот в силу был введен план перехвата. Намерение подозреваемого удалось предотвратить, но он отказался от законного требования сдаться и полез на дерево, что к городской стене примыкает.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Для предотвращения бегства подозреваемого путем городской стены находившийся поблизости стражник Р. направил на него табельное оружие дальнего действия (арбалет) и произвел предупредительный выстрел в воздух, а стражники П. и Х. отрезали ему пути отступления под деревом.");
	Doc_Show(docID);
};
func void Use_Bookstand_Report_Page2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,70,55,40,1);
	Doc_PrintLines(docID,0,"Подозреваемый ответил нецензурными словами в адрес уполномоченных органов и государственной власти. Затем он произвел падение с дерева на мостовую, в результате чего получил травмы, несовместимые с жизнью.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"В результате тщательного осмотра похищенное имущество при подозреваемом не обнаружено.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"Дежурные стражники");
	Doc_PrintLines(docID,0,"Пабло");
	Doc_PrintLines(docID,0,"Хогван");
	Doc_SetFont(docID, 0, FONT_ScreenSmall);
	Doc_Show(docID);
};
func void Bookstand_Report_Print(var int docID, var int page)
{
	if (page == 0)	{	Use_Bookstand_Report_Page0(docID);	}	else
	if (page == 1)	{	Use_Bookstand_Report_Page1(docID);	}	else
	if (page == 2)	{	Use_Bookstand_Report_Page2(docID);	};
	Bookstand_Report_Page = page;
};

func void Use_Bookstand_Report_S1()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(Bookstand_Report_Page, 3, Bookstand_Report_Print);
		if (!Read_Bookstand_Report_Once)	{
			Read_Bookstand_Report_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 3);
		};
	};
};

//================================================================
//на верфи +
func void Use_Shipbuilding_S1()
{
	if(Npc_IsPlayer(self))
	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(nDocID,0,275,40,30,40,1);
		Doc_SetFont(nDocID,0,FONT_ManuscriptHeadline);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Судостроение");
		Doc_PrintLine(nDocID,0,"* * * * * * * *");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,FONT_Manuscript);
		Doc_PrintLines(nDocID,0,"Прежде чем браться за строительство морского судна, надлежит подробно рассчитать его размерения и соотношение частей, а также подобрать и подготовить древесину.");
		Doc_SetMargins(nDocID,-1,30,30,275,30,1);
		Doc_SetFont(nDocID,1,FONT_Manuscript);
		Doc_PrintLines(nDocID,1,"Основанием всякому судну служит киль, к которому крепятся штевни и шпангоуты. Хорошо, если киль изготовлен из целого ствола драконьего дерева, имеющего отходящий под нужным углом корень.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для шпангоутов же, бимсов и обшивки лучше брать брусья и доски из тщательно высушенной древесины горной сосны, срубленной во время зимних холодов. Из неё же надлежит делать и мачты, хотя для них подойдет и орочий бук.");
		Doc_Show(nDocID);
		if (!Read_Shipbuilding_Once)	{
			Read_Shipbuilding_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};
//================================================================
//в казармах в дальней комнате +
func void Use_CourtCase_S1()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,60,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Handwrite);
		Doc_PrintLines(nDocID,0,"Торговец Диего, 36 лет от роду, наполовину варрантец, житель Верхнего квартала Хориниса, обвиняется в контрабанде магической руды, предназначавшейся для королевских оружейных мастерских. Также, согласно показаниям его компаньона Гербрандта, торговца, жителя Нижнего квартала, он неоднократно продавал оружие пиратам, преследуемым законом и проклятым Инносом.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Вина подсудимого полностью доказана показаниями свидетелей и содержимым тайника, указанного Гербрандтом. Диего приговаривается к смертной казни, которая, милостью нашего повелителя короля Робара II заменяется на пожизненную каторгу в рудниках Минненталя...");
		Doc_Show(nDocID);
		if (!Read_CourtCase_Once)	{
			Read_CourtCase_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//================================================================
//в доме Лобарта +
func void Use_HorsePlague_S1()
{
	if(Npc_IsPlayer(self))
	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(nDocID,0,275,40,30,40,1);
		Doc_SetFont(nDocID,0,FONT_ManuscriptHeadline);
		Doc_PrintLines(nDocID,0,"Конская чума");
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"Конская чума вспыхнула на Хоринисе в правление Робара I. От нее на острове погибли все лошади, собаки и большая часть овец. Потом она перекинулась на материк, и с тех пор миртанские рыцари и варрантские кочевники сражаются пешими. Никогда прежде об этой напасти слышно не было. Говорят, что чуму занесли хоринисские моряки с каких-то далеких островов на востоке.");
		Doc_SetMargins(nDocID,-1,30,30,275,30,1);
		Doc_SetFont(nDocID,1,FONT_ManuscriptHeadline);
		Doc_PrintLines(nDocID,1,"Сонный мор");
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"Сонный мор вспыхивает в разных местах обитаемого мира раз в два или три столетия. Охваченные им люди становятся слабыми и вялыми, падая прямо на улицах посреди разговора и впадая в подобие нездорового сна. Случается так, что раз уснув, человек уже больше никогда не пробуждается. Считается, что сонный мор разносит нежить. ");
		Doc_Show(nDocID);
		if (!Read_HorsePlague_Once)	{
			Read_HorsePlague_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};
