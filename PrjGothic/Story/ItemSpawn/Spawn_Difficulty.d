
//настройки сложности для засева грибов

var int MR_Opts_MrAmount;	//сколько грибов?	
	const int MR_OptsAmount_Less = -1;
	const int MR_OptsAmount_Norm = 0;
	const int MR_OptsAmount_More = 1;
var int MR_Opts_CmpActivity;	//сколько грибов соберут конкуренты?
	const int MR_Opts_Base = 100;
	const int MR_Opts_MuchLess = -90;
	const int MR_Opts_Less = -50;
	const int MR_Opts_Norm = -0;
	const int MR_Opts_More = 75;
	const int MR_Opts_MuchMore = 100;
	const int MR_Opts_SuperMore = 400;
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
//период естественного спауна/деспауна
const int MR_Spawn_Period[MR_Count] = {	
	6*12*60,		//"01"
	8*12*60,		//"02"
	5*12*60,		//"STN"
	4*12*60,		//"SNR"
	9*12*60,		//"FOG"
	6*12*60,		//"PIN"
	5*12*60,		//"RED"
	4*12*60,		//"BTL"
	5*12*60,		//"OIL"
	8*12*60,		//"SEA"
	7*12*60,		//"GOV"
	6*12*60,		//"KL"
	7*12*60,		//"BRCH"
	6*12*60,		//"EAR"
	7*12*60,		//"TRI"
	1*12*60,		//"NSP"
	6*12*60,		//"DRG"
	0,			//"HRT"
	0,			//"GLD"
	6*12*60,		//"IVY"
	8*12*60			//"VLT"
};
//период, по истечении которого гриб 100% соберут
const int MR_Pickup_Period[MR_Count] = {	
	3*24*60,		//"01"
	4*24*60,		//"02"
	3*24*60,		//"STN"
	4*24*60,		//"SNR"
	9*24*60,		//"FOG"
	3*24*60,		//"PIN"
	2*24*60,		//"RED"
	2*24*60,		//"BTL"
	5*24*60,		//"OIL"
	6*24*60,		//"SEA"
	5*24*60,		//"GOV"
	3*24*60,		//"KL"
	7*24*60,		//"BRCH"
	4*24*60,		//"EAR"
	8*24*60,		//"TRI"
	9*24*60,		//"NSP"
	8*24*60,		//"DRG"
	0,			//"HRT"
	0,			//"GLD"
	5*24*60,		//"IVY"
	6*24*60			//"VLT"
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

//период спауна/деспауна грибов в игровых минутах
func int _Spawn_MR_GetPeriod(var int MR_Index)
{
	if (MR_Index < MR_Count)	{
		var int Result;
		Result = MEM_ReadStatArr(MR_Spawn_Period, MR_Index);
		return Result;
	};
	return 0;
};
//период спауна/деспауна грибов в игровых минутах
func int _Spawn_MR_GetPickupPeriod(var int MR_Index)
{
	if (MR_Index < MR_Count)	{
		var int Result;
		Result = MEM_ReadStatArr(MR_Pickup_Period, MR_Index);
		return Result;
	};
	return 0;
};

