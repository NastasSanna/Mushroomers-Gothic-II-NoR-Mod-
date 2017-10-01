
const string MOBNAME_SCORETABLE = "Очки участников конкурса";
const string MOBNAME_PICTURE = "Рисунок";

var int LOOK_POSTER_WOMAN_Once;
var int LOOK_POSTER_WOMAN2_Once;
var int LOOK_POSTER_WOMAN4_Once;

func int LOOK_SCORETABLE()
{
	if (Npc_IsPlayer(self))	{
		B_Show_ScoreList();
	};
	return FALSE;
};

func void Show_Poster(var string file_name)
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,file_name,0);
	Doc_Show(nDocID);
	B_GiveAchievement_ArtFan();
};

func int LOOK_POSTER_WOMAN()
{
	if (Npc_IsPlayer(self))	{
		LOOK_POSTER_WOMAN_Once = TRUE;
		Show_Poster("POSTER_Woman.TGA");
	};
	return FALSE;
};
func int LOOK_POSTER_WOMAN2()
{
	if (Npc_IsPlayer(self))	{
		LOOK_POSTER_WOMAN2_Once = TRUE;
		Show_Poster("POSTER_Woman2.TGA");
	};
	return FALSE;
};
func int LOOK_POSTER_WOMAN4()
{
	if (Npc_IsPlayer(self))	{
		LOOK_POSTER_WOMAN4_Once = TRUE;
		Show_Poster("POSTER_Woman4.TGA");
	};
	return FALSE;
};
