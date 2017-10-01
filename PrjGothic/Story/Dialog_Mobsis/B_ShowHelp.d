
const string HELP_START_TOPIC = "Начало игры";
const string HELP_START_01 = "На стартовой локации необходимо выбрать персонажа, за которого хотите пройти игру. Они различаются по силе и умениям, подробнее можно увидеть в меню персонажа. Вы можете менять свой выбор, пока не выйдете наружу.";
const string HELP_START_02 = "С остальными героями вам предстоит побороться в грибном конкурсе Константино. Их можно встретить по ходу игры.";
const string HELP_START_03 = "Здесь же можно изменить настройки сложности: количество грибов, активность соперников и другие. Настройки задаются только на стартовой локации, в дальнейшем изменить их невозможно.";
const string HELP_START_04 = "Помолившись у одной из статуй, можно выбрать себе бога-покровителя. Он окажет вам небольшую помощь в начале игры и даст определенное преимущество в своей области, но существенного влияния на прохождение это не оказывает. У каждого бога есть пара любимых видов грибов, и под его влиянием они будут расти в больших количествах.";
const string HELP_START_05 = "Прокачка персонажа происходит автоматически с каждым уровнем. Очки опыта распределяются в зависимости от того, какое оружие вы использовали и как часто. Чтобы направить прокачку в нужную вам сторону, можно потренироваться в казармах.";

var int B_ShowHelp_HeroChoice_Once;
func void B_ShowHelp_HeroChoice()
{
	/*
	var int nDocID;
	B_ShowHelp_HeroChoice_Once = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Log_Paper.tga",0);
	Doc_SetFont(nDocID,-1,FONT_ScreenSmall);
	Doc_SetMargins(nDocID,0,40,40,40,40,1);
	Doc_PrintLines(nDocID,0,HELP_START_01);
	Doc_PrintLines(nDocID,0,HELP_START_02);
	Doc_PrintLines(nDocID,0,HELP_START_03);
	Doc_PrintLines(nDocID,0,HELP_START_04);
	Doc_PrintLines(nDocID,0,HELP_START_05);
	Doc_Show(nDocID);
	//*/
	Log_CreateTopic(HELP_START_TOPIC,LOG_MISSION);
	Log_SetTopicStatus(HELP_START_TOPIC,LOG_Running);
	B_LogEntry_DateTime(HELP_START_TOPIC, HELP_START_01, FALSE);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_02);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_03);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_04);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_05);
	B_ShowHelp_HeroChoice_Once = TRUE;
};

/*
func void B_ShowHelp_Mushrooms()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Log_Paper.tga",0);
	Doc_SetFont(nDocID,-1,FONT_ScreenSmall);
	Doc_SetMargins(nDocID,0,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"                       Грибы");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Поиск и сбор грибов - ваша основная (но не единственная) задача в этом моде. Грибы случайным образом засеиваются в начале игры и продолжают расти в ее процессе, в том числе на месте уже собранных. Гриб может и исчезнуть - соберет его один из соперников, или он просто развалится от старости.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"За сдачу грибов Константино вы получаете золото, опыт и очки, по которым определяется результат конкурса. Разные грибы имеют разную ценность. Цены у Константино и других торговцев различаются кардинально.");
	Doc_Show(nDocID);
};
//*/


