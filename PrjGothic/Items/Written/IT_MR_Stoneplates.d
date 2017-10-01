

// ДИАЛОГИ ===============================================
const int Clayplate_Numbers_View = 0;
var int Clayplate_Numbers_Side;
	const int Clayplate_Numbers_Face = 1;
	const int Clayplate_Numbers_Back = 2;
var int Clayplate_Numbers_BlackBack;
var int Use_Clayplate_Numbers_Once;

//--------------------------------------------
instance DIA_IT_Clayplate_Numbers_End(C_Info)
{
	nr = 999;
	condition = DIA_IT_Clayplate_Numbers_End_cond;
	information = DIA_IT_Clayplate_Numbers_End_info;
	description = Dialog_Ende;
	permanent = TRUE;
};
func int DIA_IT_Clayplate_Numbers_End_cond()
{
	if (Clayplate_Numbers_Side > 0)	{
		return TRUE;
	};
};
func void DIA_IT_Clayplate_Numbers_End_info()
{
	Clayplate_Numbers_Side = 0;
	View_Close(Clayplate_Numbers_View);
	View_Delete(Clayplate_Numbers_View);
	Clayplate_Numbers_View = 0;
	
	//запись в журнал + выдать листок для записи
	if (!Use_Clayplate_Numbers_Once)	{
		Use_Clayplate_Numbers_Once = TRUE;
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_NumbersWrite);
		CreateInvItem(self,ItWr_Clayplate_Numbers_Result);
	};
		
	AI_StopProcessInfos(self);
};
//--------------------------------------------
instance DIA_IT_Clayplate_Numbers_Turn(C_Info)
{
	condition = DIA_IT_Clayplate_Numbers_Turn_cond;
	information = DIA_IT_Clayplate_Numbers_Turn_info;
	description = "Перевернуть табличку";
	permanent = TRUE;
};
func int DIA_IT_Clayplate_Numbers_Turn_cond()
{
	if (Clayplate_Numbers_Side > 0)	{
		return TRUE;
	};
};
var int DIA_IT_Clayplate_Numbers_Turn_Once;
func void DIA_IT_Clayplate_Numbers_Turn_info()
{
	if (Clayplate_Numbers_Side == Clayplate_Numbers_Face)	{
		if (Clayplate_Numbers_BlackBack)	{
			View_SetTexture(Clayplate_Numbers_View,"Clayplate_Numbers_BackBlack.TGA");
		}
		else	{
			View_SetTexture(Clayplate_Numbers_View,"Clayplate_Numbers_Back.TGA");
			if (!DIA_IT_Clayplate_Numbers_Turn_Once)	{
				AI_Output(self,other,"DIA_IT_Clayplate_Numbers_Turn_10_00");	//Здесь есть какие-то надписи, но они очень бледные. Если замазать углем, будет лучше видно.
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_NumbersBack);
				DIA_IT_Clayplate_Numbers_Turn_Once = TRUE;
			};
		};
		Clayplate_Numbers_Side = Clayplate_Numbers_Back;
	}
	else	{
		View_SetTexture(Clayplate_Numbers_View,"Clayplate_Numbers_Face.TGA");
		Clayplate_Numbers_Side = Clayplate_Numbers_Face;
	};
	View_Open(Clayplate_Numbers_View);
};
//--------------------------------------------
instance DIA_IT_Clayplate_Numbers_Black(C_Info)
{
	condition = DIA_IT_Clayplate_Numbers_Black_cond;
	information = DIA_IT_Clayplate_Numbers_Black_info;
	description = "Втереть уголь";
};
func int DIA_IT_Clayplate_Numbers_Black_cond()
{
	if ((Clayplate_Numbers_Side == Clayplate_Numbers_Back) && !Clayplate_Numbers_BlackBack
		&& Npc_HasItems(self,ItMi_Coal))	{
		return TRUE;
	};
};
func void DIA_IT_Clayplate_Numbers_Black_info()
{
	Npc_RemoveInvItem(self,ItMi_Coal);
	Clayplate_Numbers_BlackBack = TRUE;
	Clayplate_Numbers_Side = Clayplate_Numbers_Face;
	DIA_IT_Clayplate_Numbers_Turn_info();
};

//************************************  ВВОД ЧИСЕЛ ************************************************

const int Clayplate_Numbers_InputView = 0;

var int DIA_InputNumber_Line;	//для какой древней цифры вводим значение

//что навводили
var int INPUT_OldNumbers_1;
var int INPUT_OldNumbers_2;
var int INPUT_OldNumbers_10;
var int INPUT_OldNumbers_50;
var int INPUT_OldNumbers_100;
var int INPUT_OldNumbers_500;
var int INPUT_OldNumbers_1000;

//все отгадали?
func int C_Erol_Plates_CheckNumbers()
{
	if ((INPUT_OldNumbers_1 == 1)
		&& (INPUT_OldNumbers_2 == 2)
		&& (INPUT_OldNumbers_10 == 10)
		&& (INPUT_OldNumbers_50 == 50)
		&& (INPUT_OldNumbers_100 == 100)
		&& (INPUT_OldNumbers_500 == 500)
		&& (INPUT_OldNumbers_1000 == 1000))
	{
		return TRUE;
	};		
	return FALSE;
};

//вывод на экран введенных значений
func string _Numbers_Input_Line(var int value, var int line)
{
	var string txt;	txt = " = ";
	if (value > 0)	{txt = ConcatStrings(txt,IntToString(value));};
	if (!MIS_Erol_Plates_NumbersSolved && (DIA_InputNumber_Line == line))	{	txt = ConcatStrings(txt,"_");};
	return txt;
};
func void DIA_IT_Clayplate_Numbers_Input_Show()
{
	View_DeleteText(Clayplate_Numbers_InputView);
	var int x; x = PS_VMax * 155 / 512;
	var int y; y = PS_VMax * 120 / 512;
	var int d; d = PS_VMax * 40 / 512 + 1;
	View_AddText(Clayplate_Numbers_InputView, x, y    , _Numbers_Input_Line(INPUT_OldNumbers_1000,1000), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d  , _Numbers_Input_Line(INPUT_OldNumbers_500,500), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d*2, _Numbers_Input_Line(INPUT_OldNumbers_100,100), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d*3, _Numbers_Input_Line(INPUT_OldNumbers_50,50), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d*4, _Numbers_Input_Line(INPUT_OldNumbers_10,10), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d*5, _Numbers_Input_Line(INPUT_OldNumbers_2,2), FONT_BookHeadline);
	View_AddText(Clayplate_Numbers_InputView, x, y+d*6, _Numbers_Input_Line(INPUT_OldNumbers_1,1), FONT_BookHeadline);
	
	if (MIS_Erol_Plates_NumbersSolved)	{
		View_AddText(Clayplate_Numbers_InputView, PS_VMax / 8, PS_VMax * 448/512, "Загадка решена, ESC - закрыть", FONT_Book);
	}
	else	{
		View_AddText(Clayplate_Numbers_InputView, PS_VMax / 8, PS_VMax * 448/512, "СТРЕЛКИ ВВЕРХ-ВНИЗ - выбор числа, ESC - закрыть", FONT_Book);
	};

	View_Render(Clayplate_Numbers_InputView);
	/*Doc_SetPages(Clayplate_Numbers_DocID,1);
	Doc_SetPage(Clayplate_Numbers_DocID,0,"Letter_OldNumber.TGA",0);
	Doc_SetMargins(Clayplate_Numbers_DocID,0,190,125,80,80,1);
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_1000,1000));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_500,500));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_100,100));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_50,50));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_10,10));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_2,2));
	Doc_PrintLine(Clayplate_Numbers_DocID,0,_Numbers_Input_Show_Line(INPUT_OldNumbers_1,1));
	//*/
};
func int _Numbers_Input(var int value, var int number)
{
	var int result;	result = value;
	if (number == -1)	{
		result = result / 10;
	}
	else	{
		result = result * 10 + number;
	};
	return result;
};
func void _Numbers_Input_InLine(var int number, var int line)
{
	if (line == 1)		{INPUT_OldNumbers_1 = _Numbers_Input(INPUT_OldNumbers_1, number);}	else
	if (line == 2)		{INPUT_OldNumbers_2 = _Numbers_Input(INPUT_OldNumbers_2, number);}	else
	if (line == 10)		{INPUT_OldNumbers_10 = _Numbers_Input(INPUT_OldNumbers_10, number);}	else
	if (line == 50)		{INPUT_OldNumbers_50 = _Numbers_Input(INPUT_OldNumbers_50, number);}	else
	if (line == 100)	{INPUT_OldNumbers_100 = _Numbers_Input(INPUT_OldNumbers_100, number);}	else
	if (line == 500)	{INPUT_OldNumbers_500 = _Numbers_Input(INPUT_OldNumbers_500, number);}	else
	if (line == 1000)	{INPUT_OldNumbers_1000 = _Numbers_Input(INPUT_OldNumbers_1000, number);};
};

//ввод и управление
func void _Numbers_Input_Cycle()
{
	// стрелки
	if (!MIS_Erol_Plates_NumbersSolved)	{
		if (MEM_KeyState(KEY_DOWNARROW) == KEY_PRESSED)	{
			if (DIA_InputNumber_Line == 1)	{DIA_InputNumber_Line = 1000;} else
			if (DIA_InputNumber_Line == 2)	{DIA_InputNumber_Line = 1;} else
			if (DIA_InputNumber_Line == 10)	{DIA_InputNumber_Line = 2;} else
			if (DIA_InputNumber_Line == 50)	{DIA_InputNumber_Line = 10;} else
			if (DIA_InputNumber_Line == 100)	{DIA_InputNumber_Line = 50;} else
			if (DIA_InputNumber_Line == 500)	{DIA_InputNumber_Line = 100;} else
			if (DIA_InputNumber_Line == 1000)	{DIA_InputNumber_Line = 500;} else	{DIA_InputNumber_Line = 1;};
		}
		else if (MEM_KeyState(KEY_UPARROW) == KEY_PRESSED)	{
			if (DIA_InputNumber_Line == 1)	{DIA_InputNumber_Line = 2;} else
			if (DIA_InputNumber_Line == 2)	{DIA_InputNumber_Line = 10;} else
			if (DIA_InputNumber_Line == 10)	{DIA_InputNumber_Line = 50;} else
			if (DIA_InputNumber_Line == 50)	{DIA_InputNumber_Line = 100;} else
			if (DIA_InputNumber_Line == 100)	{DIA_InputNumber_Line = 500;} else
			if (DIA_InputNumber_Line == 500)	{DIA_InputNumber_Line = 1000;} else
			if (DIA_InputNumber_Line == 1000)	{DIA_InputNumber_Line = 1;} else	{DIA_InputNumber_Line = 1;};
		}
	// цифры
		else if (MEM_KeyState(KEY_0) == KEY_PRESSED)	{
			_Numbers_Input_InLine(0,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_1) == KEY_PRESSED)	{
			_Numbers_Input_InLine(1,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_2) == KEY_PRESSED)	{
			_Numbers_Input_InLine(2,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_3) == KEY_PRESSED)	{
			_Numbers_Input_InLine(3,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_4) == KEY_PRESSED)	{
			_Numbers_Input_InLine(4,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_5) == KEY_PRESSED)	{
			_Numbers_Input_InLine(5,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_6) == KEY_PRESSED)	{
			_Numbers_Input_InLine(6,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_7) == KEY_PRESSED)	{
			_Numbers_Input_InLine(7,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_8) == KEY_PRESSED)	{
			_Numbers_Input_InLine(8,DIA_InputNumber_Line);
		}
		else if (MEM_KeyState(KEY_9) == KEY_PRESSED)	{
			_Numbers_Input_InLine(9,DIA_InputNumber_Line);
		}
	// <- C
		else if (MEM_KeyState(KEY_BACK) == KEY_PRESSED)	{
			_Numbers_Input_InLine(-1,DIA_InputNumber_Line);
		};
	};
	// выход
		if (MEM_KeyState(KEY_ESCAPE) == KEY_PRESSED)	{
			//закрыть на экране
			View_Close(Clayplate_Numbers_InputView);
			View_Delete(Clayplate_Numbers_InputView);
			Clayplate_Numbers_InputView = 0;
			
			//все разгадали?
			if (C_Erol_Plates_CheckNumbers() && !MIS_Erol_Plates_NumbersSolved)
			{
				MIS_Erol_Plates_NumbersSolved = TRUE;
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_NumbersSolved);
			};
			return;
		};
		
		//вывод на экран
		DIA_IT_Clayplate_Numbers_Input_Show();
		//чтобы перехватить управление
		var int DocID;	DocID = Doc_Create();
		Doc_Show(DocID);
		
		//цикл
		FF_ApplyExt(_Numbers_Input_Cycle,50,1);
	//};
};

/*меню - ввод одной цифры
func void DIA_IT_Clayplate_Numbers_MenuInput()
{
	Info_ClearChoices(DIA_IT_Clayplate_Numbers_Input);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Завершить ввод",DIA_InputNumber_End);
	if (DIA_InputNumber_Value > 0)	{Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"<-",DIA_InputNumber_Clear);};
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"9",DIA_InputNumber_9);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"8",DIA_InputNumber_8);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"7",DIA_InputNumber_7);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"6",DIA_InputNumber_6);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"5",DIA_InputNumber_5);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"4",DIA_InputNumber_4);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"3",DIA_InputNumber_3);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"2",DIA_InputNumber_2);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"1",DIA_InputNumber_1);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"0",DIA_InputNumber_0);
};
//какое число вводим?
func void DIA_IT_Clayplate_Numbers_MenuChoise()
{
	Info_ClearChoices(DIA_IT_Clayplate_Numbers_Input);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,Dialog_Back,DIA_IT_Clayplate_Numbers_Input_Back);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести седьмую цифру",DIA_IT_Clayplate_Numbers_Input_1);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести шестую цифру",DIA_IT_Clayplate_Numbers_Input_2);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести пятую цифру",DIA_IT_Clayplate_Numbers_Input_10);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести четвертую цифру",DIA_IT_Clayplate_Numbers_Input_50);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести третью цифру",DIA_IT_Clayplate_Numbers_Input_100);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести вторую цифру",DIA_IT_Clayplate_Numbers_Input_500);
	Info_AddChoice(DIA_IT_Clayplate_Numbers_Input,"Ввести первую цифру",DIA_IT_Clayplate_Numbers_Input_1000);
};
//--------------------------------
//выполнить ввод цифры
func void DIA_InputNumber()
{
	DIA_InputNumber_Value = 0;
	DIA_IT_Clayplate_Numbers_MenuInput();
};
func void DIA_InputNumber_Save(var int number)
{
	if (number == DIA_InputNumber_Value_Back)	{
		DIA_InputNumber_Value = DIA_InputNumber_Value / 10;
		DIA_IT_Clayplate_Numbers_MenuInput();
	}
	else	if (number == DIA_InputNumber_Value_End)	{
		DIA_IT_Clayplate_Numbers_MenuChoise();
		if (DIA_InputNumber_Origin == 1)	{INPUT_OldNumbers_1 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 2)	{INPUT_OldNumbers_2 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 10)	{INPUT_OldNumbers_10 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 50)	{INPUT_OldNumbers_50 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 100)	{INPUT_OldNumbers_100 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 500)	{INPUT_OldNumbers_500 = DIA_InputNumber_Value;}	else
		if (DIA_InputNumber_Origin == 1000)	{INPUT_OldNumbers_1000 = DIA_InputNumber_Value;};
		DIA_InputNumber_Origin = 0;
	}
	else	{
		DIA_InputNumber_Value = DIA_InputNumber_Value * 10 + number;
		DIA_IT_Clayplate_Numbers_MenuInput();
	};
	DIA_IT_Clayplate_Numbers_Input_Show();
};
func void DIA_InputNumber_0()	{DIA_InputNumber_Save(0);};
func void DIA_InputNumber_1()	{DIA_InputNumber_Save(1);};
func void DIA_InputNumber_2()	{DIA_InputNumber_Save(2);};
func void DIA_InputNumber_3()	{DIA_InputNumber_Save(3);};
func void DIA_InputNumber_4()	{DIA_InputNumber_Save(4);};
func void DIA_InputNumber_5()	{DIA_InputNumber_Save(5);};
func void DIA_InputNumber_6()	{DIA_InputNumber_Save(6);};
func void DIA_InputNumber_7()	{DIA_InputNumber_Save(7);};
func void DIA_InputNumber_8()	{DIA_InputNumber_Save(8);};
func void DIA_InputNumber_9()	{DIA_InputNumber_Save(9);};
func void DIA_InputNumber_Clear()	{DIA_InputNumber_Save(DIA_InputNumber_Value_Back);};
func void DIA_InputNumber_End()	{DIA_InputNumber_Save(DIA_InputNumber_Value_End);};
//-----------------------------
//начать ввод числа
func void DIA_IT_Clayplate_Numbers_Input_Back()	{
	Clayplate_Numbers_Side = 1;
	Clayplate_Numbers_Input = FALSE;
	Info_ClearChoices(DIA_IT_Clayplate_Numbers_Input);
};
func void DIA_IT_Clayplate_Numbers_Input_1()	{	DIA_InputNumber_Origin = 1;		DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_2()	{	DIA_InputNumber_Origin = 2;		DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_10()	{	DIA_InputNumber_Origin = 10;	DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_50()	{	DIA_InputNumber_Origin = 50;	DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_100()	{	DIA_InputNumber_Origin = 100;	DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_500()	{	DIA_InputNumber_Origin = 500;	DIA_InputNumber();};
func void DIA_IT_Clayplate_Numbers_Input_1000()	{	DIA_InputNumber_Origin = 1000;	DIA_InputNumber();};


//--------------------------------------------
instance DIA_IT_Clayplate_Numbers_Input(C_Info)
{
	condition = DIA_IT_Clayplate_Numbers_Input_cond;
	information = DIA_IT_Clayplate_Numbers_Input_info;
	description = "Записать расшифровку";
};
func int DIA_IT_Clayplate_Numbers_Input_cond()
{
	if (Clayplate_Numbers_Side > 0)	{
		return TRUE;
	};
};
func void DIA_IT_Clayplate_Numbers_Input_info()
{
	DIA_IT_Clayplate_Numbers_Input_Show();
	Clayplate_Numbers_Side = 0;
	Clayplate_Numbers_Input = TRUE;
	DIA_IT_Clayplate_Numbers_MenuChoise();
};

//*************************************************************************************************/

// =======================================================
instance ItWr_Clayplate_Numbers(C_ITEM)
{
	name = "Глиняная табличка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
	material = MAT_STONE;
	on_state[0] = Use_Clayplate_Numbers;
	scemeName = "MAP";
	description = name;
	text[2] = "Здесь какие-то расчеты.";
	text[3] = "Над чертой стоит сумма чисел, написанных снизу.";
};

func void Use_Clayplate_Numbers()
{
	if (Npc_IsPlayer(self))	{
		//управляющие диалоги
		DIA_IT_Clayplate_Numbers_End.npc = Hlp_GetInstanceID(self);
		DIA_IT_Clayplate_Numbers_Turn.npc = Hlp_GetInstanceID(self);
		DIA_IT_Clayplate_Numbers_Black.npc = Hlp_GetInstanceID(self);
		
		//показать
		Clayplate_Numbers_Side = Clayplate_Numbers_Back;
		Clayplate_Numbers_View = View_CreateCenterPxl(Print_ToPixel(PS_VMax / 2, PS_X),Print_ToPixel(PS_VMax / 2, PS_Y),512,512);
		DIA_IT_Clayplate_Numbers_Turn_info();
		
		AI_ProcessInfos(self);
	};
};

// =======================================================
instance ItWr_Clayplate_Numbers_Result(C_ITEM)
{
	name = "Заметки";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Clayplate_Numbers_Result;
	scemeName = "MAP";
	description = name;
	text[2] = "Здесь записаны результаты расшифровки";
	text[3] = "чисел древнего народа.";
};

func void Use_Clayplate_Numbers_Result()
{
	if (Npc_IsPlayer(self))	{
		Clayplate_Numbers_InputView = View_CreateCenterPxl(Print_ToPixel(PS_VMax / 2, PS_X),Print_ToPixel(PS_VMax / 2, PS_Y),512,512);
		View_SetTexture(Clayplate_Numbers_InputView, "Letter_OldNumbers.TGA");
		View_Open(Clayplate_Numbers_InputView);
		
		DIA_InputNumber_Line = 1000;
		DIA_IT_Clayplate_Numbers_Input_Show();
		
		_Numbers_Input_Cycle();
	};
};
// =======================================================
instance ItWr_Stoneplate_Gold(C_ITEM)
{
	name = "Золотая табличка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_GoldChalice;
	visual = "ItMi_StonePlate_Gold.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Текст выгравирован на листе золота.";
	text[3] = "Эта табличка была у скелета с серпом.";
};
// =======================================================
instance ItWr_Stoneplate_Silver(C_ITEM)
{
	name = "Серебряная табличка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_SilverChalice;
	visual = "ItMi_StonePlate_Silver.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Текст выгравирован на серебряном листе.";
	text[3] = "Большой кусок с текстом отломан.";
};
// =======================================================
instance ItWr_Stoneplate_SilverPiece(C_ITEM)
{
	name = "Кусок серебряной таблички";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_SilverRing;
	visual = "ItMi_StonePlate_SilverPiece.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "На обломке видна часть текста.";
	text[3] = "Очевидно, он отломан от целой таблички.";
};

//============================================
//Эрол для Ватраса
instance ItWr_OldStonePlate_Erol(C_Item)
{
	name = "Старая каменная табличка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = value_StonePlateCommon;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	on_state[0] = Use_OldStonePlate_Erol;
	scemeName = "MAP";
	inv_rotx = 90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Здесь какие-то записи на древнем языке.";
	text[3] = "Надо отдать табличку Ватрасу.";
	text[5] = NAME_Value;
	count[5] = value_StonePlateCommon;
};

func void Use_OldStonePlate_Erol()
{
	if (Npc_IsPlayer(self))	{
		B_Say(self,self,"$CANTREADTHIS");
	};
};

// =======================================================
instance ItWr_Stoneplate_Ren(C_ITEM)
{
	name = "Скрижаль Мудрости Рен";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_GoldChalice;
	visual = "ItMi_StonePlate_Gold.3DS";
	scemeName = "MAP";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	text[5] = "бесценная";
	on_state[0] = Use_Stoneplate_Ren;
};

var int Use_Stoneplate_Once;
func void Use_Stoneplate_Ren()
{
	if (Npc_IsPlayer(self))	{
		if (!Use_Stoneplate_Once) {
			B_GiveAchievement_SnowStudio();
			B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Ren);
			Use_Stoneplate_Once = TRUE;
		};
		Snd_Play3D(self,"SNOWSTUDIO_REN");
	};
};
