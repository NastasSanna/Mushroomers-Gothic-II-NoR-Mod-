
//настройки сложности для засева грибов

var int MR_Opts_MrAmount;	//сколько грибов?	
	const int MR_OptsAmount_Less = -1;
	const int MR_OptsAmount_Norm = 0;
	const int MR_OptsAmount_More = 1;
var int MR_Opts_CmpActivity;	//сколько грибов соберут конкуренты?
	const int MR_Opts_MuchLess = -90;
	const int MR_Opts_Less = -50;
	const int MR_Opts_Norm = 0;
	const int MR_Opts_More = 75;
	const int MR_Opts_MuchMore = 150;
	const int MR_Opts_SuperMore = 300;
var int MR_Opts_MM_Flee;	//сбегают ли слабые монстры?
	const int MR_Opts_MM_Flee_Never = -1;
	const int MR_Opts_MM_Flee_Random = 0;
	const int MR_Opts_MM_Flee_Always = 1;

var int OPT_HideMrNames;	//не работает


//интенсивность засева - мало
const int MR_Opts_Intensity_Len = 3 * MR_Count;
const int MR_Opts_Intensity[MR_Opts_Intensity_Len] = {	
//	мало	норм	много
	8,		12,		20,		//"01", 409
	9,		18,		24,		//"02", 344
	15,		25,		35,		//"STN", 143
	12,		20,		28,		//"SNR", 76
	7,		12,		18,		//"FOG", 21
	16,		24,		30,		//"PIN", 156
	20,		30,		40,		//"RED", 352
	20,		25,		35,		//"BTL", 77
	10,		15,		20,		//"OIL", 467
	10,		20,		25,		//"SEA", 67
	15,		20,		25,		//"GOV", 81
	10,		16,		22,		//"KL", 89
	8,		12,		15,		//"BRCH", 81
	20,		30,		45,		//"EAR", 91
	10,		15,		20,		//"TRI", 48
	10,		15,		20,		//"NSP", 70
	15,		20,		25,		//"DRG", 59
	0,		0,		0,		//"HRT", 5
	0,		0,		0,		//"GLD", 5
	22,		30,		35,		//"IVY", 53
	15,		22,		30		//"VLT" 33
};

//получить интенсивность спауна с учетом сложности
func int _Spawn_MR_GetIntencity(var int MR_Index)
{
	var int Result;
	Result = MEM_ReadStatArr(MR_Opts_Intensity, MR_Index * 3 + (1 + MR_Opts_MrAmount));
	if(PATRONGOD == PATRONGOD_Adanos)	{
		if ((MR_Index == MR_Oyster) || (MR_Index == MR_Foggy))	{
			Result += 10;
		};
	}
	else	if(PATRONGOD == PATRONGOD_Innos)	{
		if ((MR_Index == MR_DragonTears) || (MR_Index == MR_Sunrise))	{
			Result += 10;
		};
	}
	else	if(PATRONGOD == PATRONGOD_Beliar)	{
		if ((MR_Index == MR_Violet) || (MR_Index == MR_Trident))	{
			Result += 10;
		};
	};
	return Result;
};
