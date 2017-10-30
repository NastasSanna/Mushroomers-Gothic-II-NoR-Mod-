
var int SP_MR_InWorldCount[MR_Count];

/*func int _Spawn_MR_GetInstance(var int index)
{
	if (index == MR_01)				{ return ItPl_Mushroom_01;	} else
	if (index == MR_02)				{ return ItPl_Mushroom_02;	} else
	if (index == MR_Stone)			{ return ItMr_Stone;	} else
	if (index == MR_Sunrise)		{ return ItMr_Sunrise;	} else
	if (index == MR_Foggy)			{ return ItMr_Foggy;	} else
	if (index == MR_Piny)			{ return ItMr_Piny;	} else
	if (index == MR_Red	)			{ return ItMr_Red;	} else
	if (index == MR_Bottle)			{ return ItMr_Bottle;	} else
	if (index == MR_BrownOiler)		{ return ItMr_BrownOiler;	} else
	if (index == MR_Oyster)			{ return ItMr_Oyster;	} else
	if (index == MR_Governor)		{ return ItMr_Governor;	} else
	if (index == MR_Keil)			{ return ItMr_KeilSmall;	} else
	if (index == MR_Branch)			{ return ItMr_Branch;	} else
	if (index == MR_LadysEar)		{ return ItMr_LadysEar;	} else
	if (index == MR_Trident)		{ return ItMr_Trident;	} else
	if (index == MR_NightSparkles)	{ return ItMr_NightSparkles;	} else
	if (index == MR_DragonTears)	{ return ItMr_DragonTears;	} else
	if (index == MR_Heart)			{ return ItMr_Heart;	} else
	if (index == MR_GoldPlate)		{ return ItMr_GoldPlate;	} else
	if (index == MR_Ivy)			{ return ItMr_Ivy;	} else
	if (index == MR_Violet)			{ return ItMr_Violet;	};
	return 0;
};
//*/

func int _Spawn_MR_GetIndex(var C_ITEM itm)
{
	if (Hlp_IsItem(itm,ItPl_Mushroom_01))		{ return MR_01;	} else
	if (Hlp_IsItem(itm,ItPl_Mushroom_02))		{ return MR_02;	} else
	if (Hlp_IsItem(itm,ItMr_Stone))				{ return MR_Stone;	} else
	if (Hlp_IsItem(itm,ItMr_Sunrise))			{ return MR_Sunrise;	} else
	if (Hlp_IsItem(itm,ItMr_Foggy))				{ return MR_Foggy;	} else
	if (Hlp_IsItem(itm,ItMr_Piny))				{ return MR_Piny;	} else
	if (Hlp_IsItem(itm,ItMr_Red))				{ return MR_Red;	} else
	if (Hlp_IsItem(itm,ItMr_Bottle))			{ return MR_Bottle;	} else
	if (Hlp_IsItem(itm,ItMr_BrownOiler))		{ return MR_BrownOiler;	} else
	if (Hlp_IsItem(itm,ItMr_Oyster))			{ return MR_Oyster;	} else
	if (Hlp_IsItem(itm,ItMr_Governor))			{ return MR_Governor;	} else
	if (Hlp_IsItem(itm,ItMr_KeilSmall))			{ return MR_Keil;	} else
	if (Hlp_IsItem(itm,ItMr_Branch))			{ return MR_Branch;	} else
	if (Hlp_IsItem(itm,ItMr_LadysEar))			{ return MR_LadysEar;	} else
	if (Hlp_IsItem(itm,ItMr_Trident))			{ return MR_Trident;	} else
	if (Hlp_IsItem(itm,ItMr_NightSparkles))		{ return MR_NightSparkles;	} else
	if (Hlp_IsItem(itm,ItMr_DragonTears))		{ return MR_DragonTears;	} else
	if (Hlp_IsItem(itm,ItMr_Heart))				{ return MR_Heart;	} else
	if (Hlp_IsItem(itm,ItMr_GoldPlate))			{ return MR_GoldPlate;	} else
	if (Hlp_IsItem(itm,ItMr_Ivy))				{ return MR_Ivy;	} else
	if (Hlp_IsItem(itm,ItMr_Violet))			{ return MR_Violet;	};
	return -1;
};

// подсчет количества грибов в мире (DEBUG) ---------------------------
func void _SP_Count_ClearInWorld()
{
	var int i;	i = 0;
	while(i < MR_Count);
		MEM_WriteStatArr(SP_MR_InWorldCount,i,0);
		i += 1;
	end;
};

func void _SP_Count_AddInWorld(var int mr_ptr)
{
	var C_ITEM mr;	mr = _^(mr_ptr);
	var int i;	i = _Spawn_MR_GetIndex(mr);
	if (i >= 0) {
		var int cnt;	cnt = MEM_ReadStatArr(SP_MR_InWorldCount,i) + 1;
		MEM_WriteStatArr(SP_MR_InWorldCount,i,cnt);
	};
};

func int _SP_Count_GetInWorld(var int index)
{
	var int cnt;	cnt = MEM_ReadStatArr(SP_MR_InWorldCount,index) + 1;
	return cnt;
};

func int _SP_Count_GetAllInWorld()
{
	var int cnt;
	var int sum; sum = 0;
	var int i;	i = 0;
	while(i < MR_Count);
		cnt = MEM_ReadStatArr(SP_MR_InWorldCount,i);
		sum += cnt;
		i += 1;
	end;
	return sum;
};

func void _SP_Count_PrintInWorld()
{
	var string txt;
	var int cnt;
	var int sum; sum = 0;
	var int i;	i = 0;
	while(i < MR_Count);
		cnt = MEM_ReadStatArr(SP_MR_InWorldCount,i);
		txt = MEM_ReadStatStringArr(SP_MR_Abbr,i);
		txt = ConcatStrings(txt,": ");
		txt = ConcatStrings(txt,IntToString(cnt));
		PrintScreen(txt,10,10+2*i,FONT_ScreenSmall,5);
		i += 1;
		sum += cnt;
	end;
		txt = ConcatStrings("Всего: ",IntToString(sum));
		PrintScreen(txt,10,11+2*i,FONT_ScreenSmall,5);
};

//проход списка предметов в мире
func void _SP_SearchItemsList_Count()
{
	_SP_Count_ClearInWorld();
	VAR zCVob curVob;
	VAR zCListSort curItem;	curItem = _^(MEM_World.voblist_items);
	// repeat
	var int label;	label = MEM_StackPos.position;
		if (curItem.data)	{
			curVob = _^(curItem.data);
			_SP_Count_AddInWorld(curItem.data);
		};
	//until (!curItem.next);
	if (curItem.next)	{
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
};
