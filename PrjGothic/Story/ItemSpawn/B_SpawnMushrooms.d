

// ---------------------------------------------------------------------
//проверяем, был ли гриб собран или исчез естественным путем через Minutes
func int _DespawnMR_Try(var int ItmPtr, var int Minutes, var int MR_Index)
{
	//MEM_Debug("_DespawnMR_Try");
	if (B_AddCompetitors(/*Minutes,*/ MR_Index))	{	//гриб собрали
		_LH_Add(_@(SP_Delete_List), ItmPtr);
		return TRUE;
	};
	if (Hlp_Random(_Spawn_MR_GetPeriod(MR_Index)) < Minutes)	{	//просто пропал
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
	
	// остальные грибы не могут исчезнуть на глазах ГГ
	if (Npc_CanSeeItem(hero,itm) || (Npc_GetDistToItem(hero,itm) < 5000))	{return;};
	
	//гриб может пропасть
	if (Hlp_IsItem(itm, ItPl_Mushroom_01))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_01);
	}
	else	if (Hlp_IsItem(itm, ItPl_Mushroom_02))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_02);
	}
	else	if (Hlp_IsItem(itm, ItMr_Bottle))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Bottle);
	}
	else	if (Hlp_IsItem(itm, ItMr_Branch))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Branch);
	}
	else	if (Hlp_IsItem(itm, ItMr_BrownOiler))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_BrownOiler);
	}
	else	if (Hlp_IsItem(itm, ItMr_DragonTears))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_DragonTears);
	}
	else	if (Hlp_IsItem(itm, ItMr_Foggy))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Foggy);
	}
	else	if (Hlp_IsItem(itm, ItMr_Governor))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Governor);
	}
	else	if (Hlp_IsItem(itm, ItMr_Ivy))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Ivy);
	}
	else	if (Hlp_IsItem(itm, ItMr_LadysEar))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_LadysEar);
	}
	else	if (Hlp_IsItem(itm, ItMr_Oyster))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Oyster);
	}
	else	if (Hlp_IsItem(itm, ItMr_Piny))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Piny);
	}
	else	if (Hlp_IsItem(itm, ItMr_Red))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Red);
	}
	else	if (Hlp_IsItem(itm, ItMr_Stone))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Stone);
	}
	else	if (Hlp_IsItem(itm, ItMr_Sunrise))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Sunrise);
	}
	else	if (Hlp_IsItem(itm, ItMr_Trident))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Trident);
	}
	else	if (Hlp_IsItem(itm, ItMr_Violet))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Violet);
	}
	
	//исчезнуть может и большой и маленький кабанчик
	else if (Hlp_IsItem(itm, ItMr_KeilBig))	{
		x = _DespawnMR_Try(ItmPtr, Minutes, MR_Keil);
	}
	else	if (Hlp_IsItem(itm, ItMr_KeilSmall))	{
		if (!_DespawnMR_Try(ItmPtr, Minutes, MR_Keil))	{
			//вырастание кабанчиков отключено, подменыши вызывают баги и вылеты
			//if (Hlp_Random(4*24*60) < Minutes)	{
			//	B_ReplaseItem(ItmPtr, ItMr_KeilBig);
			//};
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
	MEM_Free(_@(NewSP));	//освобождаем память
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
	// пока не закончится vobtree (не останется детей, соседей и предков):
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

//проход списка предметов в мире (регулярный)
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
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_01), 		ItPl_Mushroom_01, 	_Spawn_MR_GetIntencity(MR_01), 			_Spawn_MR_GetPeriod(MR_01), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_02), 		ItPl_Mushroom_02, 	_Spawn_MR_GetIntencity(MR_02), 			_Spawn_MR_GetPeriod(MR_02), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Bottle), 	ItMr_Bottle, 		_Spawn_MR_GetIntencity(MR_Bottle), 		_Spawn_MR_GetPeriod(MR_Bottle), 	Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Branch), 	ItMr_Branch, 		_Spawn_MR_GetIntencity(MR_Branch), 		_Spawn_MR_GetPeriod(MR_Branch), 	Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_BrownOiler), ItMr_BrownOiler, 	_Spawn_MR_GetIntencity(MR_BrownOiler), 	_Spawn_MR_GetPeriod(MR_BrownOiler), Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Governor), ItMr_Governor, 		_Spawn_MR_GetIntencity(MR_Governor), 	_Spawn_MR_GetPeriod(MR_Governor), 	Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Piny), 	ItMr_Piny, 			_Spawn_MR_GetIntencity(MR_Piny), 		_Spawn_MR_GetPeriod(MR_Piny), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Red), 		ItMr_Red, 			_Spawn_MR_GetIntencity(MR_Red), 		_Spawn_MR_GetPeriod(MR_Red), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Stone), 	ItMr_Stone, 		_Spawn_MR_GetIntencity(MR_Stone), 		_Spawn_MR_GetPeriod(MR_Stone), 		Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Ivy), 		ItMr_Ivy, 			_Spawn_MR_GetIntencity(MR_Ivy), 		_Spawn_MR_GetPeriod(MR_Ivy), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_LadysEar), ItMr_LadysEar, 		_Spawn_MR_GetIntencity(MR_LadysEar), 	_Spawn_MR_GetPeriod(MR_LadysEar), 	Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Keil), 	ItMr_KeilSmall, 	_Spawn_MR_GetIntencity(MR_Keil), 		_Spawn_MR_GetPeriod(MR_Keil), 		Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Keil), 	ItMr_KeilBig, 		_Spawn_MR_GetIntencity(MR_Keil), 		_Spawn_MR_GetPeriod(MR_Keil), 		Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Oyster), 	ItMr_Oyster, 		_Spawn_MR_GetIntencity(MR_Oyster), 		_Spawn_MR_GetPeriod(MR_Oyster), 	Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Foggy), 	ItMr_Foggy, 		_Spawn_MR_GetIntencity(MR_Foggy), 		_Spawn_MR_GetPeriod(MR_Foggy), 		Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_DragonTears), ItMr_DragonTears, _Spawn_MR_GetIntencity(MR_DragonTears), _Spawn_MR_GetPeriod(MR_DragonTears), Minutes);
	
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Violet), 	ItMr_Violet, 		_Spawn_MR_GetIntencity(MR_Violet), 		_Spawn_MR_GetPeriod(MR_Violet), 	Minutes);
	_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Trident), 	ItMr_Trident, 		_Spawn_MR_GetIntencity(MR_Trident), 	_Spawn_MR_GetPeriod(MR_Trident), 	Minutes);
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
		_Spawn_ItemsByList(_Spawn_MR_GetListStart(MR_Sunrise), ItMr_Sunrise, _Spawn_MR_GetIntencity(MR_Sunrise), _Spawn_MR_GetPeriod(MR_Sunrise), Minutes);
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

//ОСОБЫЕ ГРИБЫ ----------------------------------------------
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
	
	// золотая чаша ------------------------
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
