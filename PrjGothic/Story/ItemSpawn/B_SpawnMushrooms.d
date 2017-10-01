

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
		txt = ConcatStrings("¬сего: ",IntToString(sum));
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


// ---------------------------------------------------------------------
//search, nature - шанс, что гриб соберут/исчезнет. «адаетс€ так: через сколько дн*ч*мин гриб гарантированно пропадет
func int _DespawnMR_Try(var int ItmPtr, var int Minutes,
  var int nature, var int search, var int MR_Index)
{
	//MEM_Debug("_DespawnMR_Try");
	if (B_AddCompetitors(/*Minutes,*/search ,MR_Index))	{	//гриб собрали
		_LH_Add(_@(SP_Delete_List), ItmPtr);
		return TRUE;
	};
	if (Hlp_Random(nature) < Minutes)	{	//просто пропал
		_LH_Add(_@(SP_Delete_List), ItmPtr);
		MEM_Debug("MR disappear");
		return TRUE;
	};
	return FALSE;
};
func void SP_CheckDeleteItem_DespawnMR(var int ItmPtr, var int Minutes)
{
	if (!Hlp_Is_oCItem(ItmPtr))	{return;};
	var oCItem itm;	itm = _^(ItmPtr);
	var int x;	x = 0;
	
	//ночные искры исчезают на рассвете
	if (Hlp_IsItem(itm, ItMr_NightSparkles))	{
		if ((Wld_IsTime(4,0,6,0) && (Hlp_Random(100) < 1)) || Wld_IsTime(6,0,21,0))	{
			if (Npc_GetDistToItem(hero,itm) < 5000)	{
				//Wld_PlayEffect("NIGHTSPARCLES_BURST",item,item,0,0,0,FALSE); UNFINISHED
			};
			_LH_Add(_@(SP_Delete_List), ItmPtr);
		};
		return;
	};
	
	// остальные грибы не могут исчезнуть на глазах √√
	if (Npc_CanSeeItem(hero,itm) || (Npc_GetDistToItem(hero,itm) < 5000))	{return;};
	
	//гриб может пропасть
	if (Hlp_IsItem(itm, ItPl_Mushroom_01))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*10 - 24*60, 4*24*60, MR_01);
	}
	else	if (Hlp_IsItem(itm, ItPl_Mushroom_02))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*24*60 - 24*60, 6*24*60, MR_02);
	}
	else	if (Hlp_IsItem(itm, ItMr_Bottle))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 2*24*60 - 24*60, 3*24*60, MR_Bottle);
	}
	else	if (Hlp_IsItem(itm, ItMr_Branch))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*24*60 - 24*60, 10*24*60, MR_Branch);
	}
	else	if (Hlp_IsItem(itm, ItMr_BrownOiler))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 8*24*60, MR_BrownOiler);
	}
	else	if (Hlp_IsItem(itm, ItMr_DragonTears))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*24*60 - 24*60, 12*24*60, MR_DragonTears);
	}
	else	if (Hlp_IsItem(itm, ItMr_Foggy))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 6*24*60 - 24*60, 10*24*60, MR_Foggy);
	}
	else	if (Hlp_IsItem(itm, ItMr_Governor))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*12*60 - 24*60, 7*24*60, MR_Governor);
	}
	else	if (Hlp_IsItem(itm, ItMr_Ivy))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 6*24*60, MR_Ivy);
	}
	else	if (Hlp_IsItem(itm, ItMr_LadysEar))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 5*24*60, MR_LadysEar);
	}
	else	if (Hlp_IsItem(itm, ItMr_Oyster))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*24*60 - 24*60, 6*24*60, MR_Oyster);
	}
	else	if (Hlp_IsItem(itm, ItMr_Piny))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 3*24*60, MR_Piny);
	}
	else	if (Hlp_IsItem(itm, ItMr_Red))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 2*24*60, MR_Red);
	}
	else	if (Hlp_IsItem(itm, ItMr_Stone))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 6*24*60, MR_Stone);
	}
	else	if (Hlp_IsItem(itm, ItMr_Sunrise))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 9*24*60, MR_Sunrise);
	}
	else	if (Hlp_IsItem(itm, ItMr_Trident))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 11*24*60, MR_Trident);
	}
	else	if (Hlp_IsItem(itm, ItMr_Violet))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, 4*24*60 - 24*60, 9*24*60, MR_Violet);
	}
	
	//маленький кабанчик может вырасти в большой, или его соберут
	else if (Hlp_IsItem(itm, ItMr_KeilBig))	{
		if (Hlp_Random(2*24*60) < Minutes)	{
			_LH_Add(_@(SP_Delete_List), ItmPtr);
		};
	}
	else	if (Hlp_IsItem(itm, ItMr_KeilSmall))	{
		if (!_DespawnMR_Try(ItmPtr, Minutes, 3*24*60 - 24*60, 3*24*60, MR_Keil))	{
			if (Hlp_Random(4*24*60) < Minutes)	{
				B_ReplaseItem(ItmPtr, ItMr_KeilBig);
			};
		};
	};
};

//---------------------------------------------------------------------
	
func void SP_Process(var int Vobptr)
{
	if (VobPtr == 0)	{return;};
	var int NewSP_ptr;	NewSP_ptr = SP_Analyze(MEM_ReadString(Vobptr + 16), Vobptr+60);
	if (NewSP_ptr == 0)	{return;};
	var zCSpawnPoint NewSP;	NewSP = _^(NewSP_ptr);
	
	//добавление в нужный список (только в один!)
	if (NewSP.MainFlag == SP_MR)	{
		_LH_Add(_Spawn_MR_GetListHead(NewSP.flags), _@(NewSP));
		return;
	};
	
	//еда только в начале игры
	if ((NewSP.MainFlag == SP_FOOD) && (_OnGameStart_Once == FALSE))	{
		_LH_Add(_@(SP_FOOD_List), _@(NewSP));
		//Spawn_Food(_@(NewSP));
		return;
	};	
	// если дошли сюда - NewSP не был добавлен ни в один список
	MEM_Free(_@(NewSP));	//освобождаем пам€ть
};

// ------------------------------------------------------------------

func void DEBUG_MRCount()
{
	var int i;	i = 0;
	var string txt;
	var int loop;	loop = MEM_StackPos.position;
	if (i < MR_Count)
	{
		txt = ConcatStrings("MR",MEM_ReadStatStringArr(SP_MR_Abbr, i));
		txt = ConcatStrings(txt,": ");
		MEM_Debug(ConcatStrings(txt, IntToString(MEM_ReadStatArr(SP_MR_Lists, i*2+1))));
		i += 1;
		MEM_StackPos.position = loop;
	};	
};

//обход VobTree в начале
//вызывать из INIT_Global
func void SP_SearchVobTree()
{
	MEM_Debug("SP_SearchVobTree: Run");
	SP_ClearAllLists();
	var int label;	var int label2;	
	//var zCVob curVob;	var String VobName;
	var zCTree curItem;	curItem = _^(MEM_Vobtree.firstChild);
	var zCClassDef clsdef;
	//repeat
	label = MEM_StackPos.position;
	if (curItem.data)	{
		clsdef = _^(MEM_GetClassDef(curItem.data));
		if (Hlp_StrCmp(clsdef.className, "zCVobSpot"))	{	//только FP
			SP_Process(curItem.data);
//			B_AddSPInArray(NewSP.flags, NewSP.name);
		};
	};
	// until not end vobtree (no more child, next or parent):
	// пока не закончитс€ vobtree (не останетс€ детей, соседей и предков):
	if (curItem.firstChild)	{
		curItem = _^(curItem.firstChild);
		MEM_StackPos.position = label;
	}
	else if (curItem.next)	{
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
	// there may be many parents
	// предков может быть несколько, ищем всех
	label2 = MEM_StackPos.position;
	if (curItem.parent)	{
		curItem = _^(curItem.parent);
		if (curItem.next)	{	//если у предка есть соседи
			curItem = _^(curItem.next);
			MEM_StackPos.position = label;
		}
		else	{	// нет - ищем следующего предка
			MEM_StackPos.position = label2;
		};
	};
	DEBUG_MRCount();
};

//===================================================

//проход списка предметов в мире (первоначальный)
func void SP_SearchItemsList_Start()
{
	MEM_Debug("SP_SearchItemsList_Start");
	//VAR zCVob curVob;
	VAR zCListSort curItem;	curItem = _^(MEM_World.voblist_items);
	// repeat
	var int label;	label = MEM_StackPos.position;
		if (curItem.data)	{
			//curVob = _^(curItem.data);
			//MEM_Debug(curVob._zCObject_objectName);
			//нужно удалить?
			SP_CheckDeleteItem_Start(curItem.data);
		};
	//until (!curItem.next);
	if (curItem.next)	{
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
	
	SP_DeleteVobsFromList();
};

//---------------------------------------------------------------

//проход списка предметов в мире (регул€рный)
func void SP_SearchItemsList_Cycle(var int Minutes)
{
	//var oCItem curVob;
	VAR zCListSort curItem;	curItem = _^(MEM_World.voblist_items);
	//repeat
	var int label;	label = MEM_StackPos.position;
		if (curItem.data)	{
			//curVob = _^(curItem.data);
			//нужно удалить?
			if (MEM_ReadInt(curItem.data + 348) == FLAG_MR)	{//curVob.weight - не исп. по назначению, здесь отмечены грибы
				//if (Hlp_random(60) < 10)	{
					SP_CheckDeleteItem_DespawnMR(curItem.data, Minutes);
				//};
			};
		};
	//until (!curItem.next);
	if (curItem.next)	{
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
	
	SP_DeleteVobsFromList();
};

//==============================================================

//безусловный спаун всех грибов
func void Spawn_MR_All()
{
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_01), ItPl_Mushroom_01, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_02), ItPl_Mushroom_02, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Bottle), ItMr_Bottle, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Branch), ItMr_Branch, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_BrownOiler), ItMr_BrownOiler, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_DragonTears), ItMr_DragonTears, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Foggy), ItMr_Foggy, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Governor), ItMr_Governor, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Oyster), ItMr_Oyster, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Piny), ItMr_Piny, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Red), ItMr_Red, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Stone), ItMr_Stone, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Sunrise), ItMr_Sunrise, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Trident), ItMr_Trident, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Violet), ItMr_Violet, 100,1,-1);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Ivy), ItMr_Ivy, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_LadysEar), ItMr_LadysEar, 100,1,-1);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_GoldPlate), ItMr_GoldPlate, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Heart), ItMr_Heart, 100,1,-1);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Keil), ItMr_KeilSmall, 100,1,-1);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_NightSparkles), ItMr_NightSparkles, 100,1,-1);
};

//обычный первоначальный и текущий спаун грибов
func void Spawn_MR_Normal(var int Minutes)
{
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_01), 		ItPl_Mushroom_01, 	_Spawn_MR_GetIntencity(MR_01), 			3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_02), 		ItPl_Mushroom_02, 	_Spawn_MR_GetIntencity(MR_02), 			4*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Bottle), 	ItMr_Bottle, 		_Spawn_MR_GetIntencity(MR_Bottle), 		2*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Branch), 	ItMr_Branch, 		_Spawn_MR_GetIntencity(MR_Branch), 		4*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_BrownOiler), ItMr_BrownOiler, 	_Spawn_MR_GetIntencity(MR_BrownOiler), 	3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Governor), ItMr_Governor, 		_Spawn_MR_GetIntencity(MR_Governor), 	4*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Piny), 	ItMr_Piny, 			_Spawn_MR_GetIntencity(MR_Piny), 		3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Red), 		ItMr_Red, 			_Spawn_MR_GetIntencity(MR_Red), 		3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Stone), 	ItMr_Stone, 		_Spawn_MR_GetIntencity(MR_Stone), 		3*24*60, Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Ivy), 		ItMr_Ivy, 			_Spawn_MR_GetIntencity(MR_Ivy), 		3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_LadysEar), ItMr_LadysEar, 		_Spawn_MR_GetIntencity(MR_LadysEar), 	3*24*60, Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Keil), 	ItMr_KeilSmall, 	_Spawn_MR_GetIntencity(MR_Keil), 		3*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Keil), 	ItMr_KeilBig, 		_Spawn_MR_GetIntencity(MR_Keil), 		6*24*60, Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Oyster), 	ItMr_Oyster, 		_Spawn_MR_GetIntencity(MR_Oyster), 		4*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Foggy), 	ItMr_Foggy, 		_Spawn_MR_GetIntencity(MR_Foggy), 		6*24*60, Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_DragonTears), ItMr_DragonTears, _Spawn_MR_GetIntencity(MR_DragonTears), 4*24*60, Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Violet), 	ItMr_Violet, 		_Spawn_MR_GetIntencity(MR_Violet), 		4*24*60, Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Trident), 	ItMr_Trident, 		_Spawn_MR_GetIntencity(MR_Trident), 	3*24*60, Minutes);
};

//ночные искры растут только ночью
func void Spawn_MR_NightSparcles()
{
	if (SP_NightSparkles_Night <= Wld_GetDay())	{
		if (Wld_IsTime(21,0,0,0))	{
			_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_NightSparkles), ItMr_NightSparkles, _Spawn_MR_GetIntencity(MR_NightSparkles),1,-1);
			SP_NightSparkles_Night = Wld_GetDay() + 1;
		};
		if (Wld_IsTime(0,0,4,0) && (SP_NightSparkles_Night < Wld_GetDay()))	{
			_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_NightSparkles), ItMr_NightSparkles, _Spawn_MR_GetIntencity(MR_NightSparkles) / 2,1,-1);
			SP_NightSparkles_Night = Wld_GetDay();
		};
	};
};

//а зорьник - только утром
func void Spawn_MR_Sunrise(var int Minutes)
{
	if (Wld_IsTime(5,0,12,0))	{
		_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Sunrise), ItMr_Sunrise, _Spawn_MR_GetIntencity(MR_Sunrise), 3*24*60, Minutes);
	};
};

//еда
func void Spawn_Food_Start()
{
	if (SP_FOOD_List[0] == 0)	{return;};
	var zCList SPList; SPList = _^(SP_FOOD_List[0]);
	var int loop;	loop = MEM_StackPos.position;
	if (SPList.data)	{
		Spawn_Food(SPList.data);
	};
	if (SPList.next)	{
		SPList = _^(SPList.next);
		MEM_StackPos.position = loop;
	};
};

//ќ—ќЅџ≈ √–»Ѕџ ----------------------------------------------
const int SPArr_MR_GoldPlate_Cnt = 5;
const string SPArr_MR_GoldPlate[SPArr_MR_GoldPlate_Cnt] =
{
	"SP_MRGLD_RS1000_RB1500_CNT1_SUNCRCL",
	"SP_MRGLD_NP_SUNCRCLCAVE",
	"SP_MRGLD_NP_SECRETCAVE",
	"SP_MRGLD_NP_MONASTERY_01",
	"SP_MRGLD_NP_RUINEN"
};

const int SPArr_MR_Heart_Cnt = 5;
const string SPArr_MR_Heart[SPArr_MR_Heart_Cnt] =
{
	"SP_MRHRT_NP_TROLLCAVE",
	"SP_MRHRT_NP_RIVERCAVE",
	"SP_MRHRT_NP_FORESTCIRCLE",
	"SP_MRHRT_NP_BELIARCAVE",
	"SP_MRHRT_NP_SHADOWCITY"
};

func void _SpawnBySPName(var string SPname, var int ItemInst)
{
	var int SPvob_ptr;	SPvob_ptr = MEM_SearchVobByName(SPname);
	var int SP_ptr;		SP_ptr = SP_Analyze(MEM_ReadString(SPvob_ptr + 16), SPvob_ptr+60);
	
	Spawn_Items(SP_ptr,ItemInst,100);
	
	MEM_Free(SP_ptr);
};

func void B_SpawnMR_Special()
{
	var int GldPlate_cnt; GldPlate_cnt = 2;
	var int Heart_cnt; Heart_cnt = 2;
	if (PATRONGOD == PATRONGOD_Beliar)	{
		GldPlate_cnt -= 1;
		Heart_cnt += 1;
	}
	else	if (PATRONGOD == PATRONGOD_Innos)	{
		GldPlate_cnt += 1;
		Heart_cnt -= 1;
	};
	
	var int i;
	var string SPname;
	var int max[3]; var int max_ind[3];
	var int rnd;
	
	// золота€ чаша ------------------------
	// where spawn?
	max[0] = 0;	max[1] = 0;	max[2] = 0;
	max_ind[0] = 0;	max_ind[1] = 0;	max_ind[2] = 0;
	i = 0;
	while(i < SPArr_MR_GoldPlate_Cnt);
		rnd = 1 + Hlp_Random(100);
//		MEM_Debug(ConcatStrings("SPArr_MR_GoldPlate rnd=",IntToString(rnd)));
		if (rnd > max[0])	{
			max[2] = max[1];	max_ind[2] = max_ind[1];
			max[1] = max[0];	max_ind[1] = max_ind[0];
			max[0] = rnd;		max_ind[0] = i;
		}
		else	if (rnd > max[1])	{
			max[2] = max[1];	max_ind[2] = max_ind[1];
			max[1] = rnd;		max_ind[1] = i;
		}
		else	if (rnd > max[2])	{
			max[2] = rnd;	max_ind[2] = i;
		};
		i += 1;
	end;
//	MEM_Debug(ConcatStrings("max_ind[0]=",IntToString(max_ind[0])));
//	MEM_Debug(ConcatStrings("max_ind[1]=",IntToString(max_ind[1])));
//	MEM_Debug(ConcatStrings("max_ind[2]=",IntToString(max_ind[2])));
		
	//do spawn
	SPname = MEM_ReadStatStringArr(SPArr_MR_GoldPlate, max_ind[0]);
	_SpawnBySPName(SPname, ItMr_GoldPlate);
	if (GldPlate_cnt > 1)	{
		SPname = MEM_ReadStatStringArr(SPArr_MR_GoldPlate, max_ind[1]);
		_SpawnBySPName(SPname, ItMr_GoldPlate);
	};
	if (GldPlate_cnt > 2)	{
		SPname = MEM_ReadStatStringArr(SPArr_MR_GoldPlate, max_ind[2]);
		_SpawnBySPName(SPname, ItMr_GoldPlate);
	};
		
	// гриб-сердце ----------------------
	max[0] = 0;	max[1] = 0;	max[2] = 0;
	max_ind[0] = 0;	max_ind[1] = 0;	max_ind[2] = 0;
	i = 0;
	while(i < SPArr_MR_Heart_Cnt);
		rnd = 1 + Hlp_Random(100);
//		MEM_Debug(ConcatStrings("SPArr_MR_Heart rnd=",IntToString(rnd)));
		if (rnd > max[0])	{
			max[2] = max[1];	max_ind[2] = max_ind[1];
			max[1] = max[0];	max_ind[1] = max_ind[0];
			max[0] = rnd;		max_ind[0] = i;
		}
		else	if (rnd > max[1])	{
			max[2] = max[1];	max_ind[2] = max_ind[1];
			max[1] = rnd;		max_ind[1] = i;
		}
		else	if (rnd > max[2])	{
			max[2] = rnd;	max_ind[2] = i;
		};
		i += 1;
	end;
		
//	MEM_Debug(ConcatStrings("max_ind[0]=",IntToString(max_ind[0])));
//	MEM_Debug(ConcatStrings("max_ind[1]=",IntToString(max_ind[1])));
//	MEM_Debug(ConcatStrings("max_ind[2]=",IntToString(max_ind[2])));

	//do spawn
	SPname = MEM_ReadStatStringArr(SPArr_MR_Heart, max_ind[0]);
	_SpawnBySPName(SPname, ItMr_Heart);
	if (Heart_cnt > 1)	{
		SPname = MEM_ReadStatStringArr(SPArr_MR_Heart, max_ind[1]);
		_SpawnBySPName(SPname, ItMr_Heart);
	};
	if (Heart_cnt > 2)	{
		SPname = MEM_ReadStatStringArr(SPArr_MR_Heart, max_ind[2]);
		_SpawnBySPName(SPname, ItMr_Heart);
	};
};
