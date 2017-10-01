
var int Result_View;

func void B_ShowResult()
{
	if (Result_View != 0)	{ return; };
	MEM_InitGlobalInst();
	Print_GetScreenSize();
	
	Result_View = View_CreateCenter(PS_VMax / 2, PS_VMax / 2, PS_VMax * 8 / 10, PS_VMax * 9 / 10);
	View_SetTexture(Result_View, "Log_Paper.tga");
	View_Open(Result_View);
	var int x_pos_text;
	var int x_pos_sold;
	var int x_pos_gold;
	var int x_pos_eaten;
	var int y_pos;
	var int cnt_sold;
	var int cnt_gold;
	var int cnt_eaten;
	
	x_pos_text = PS_VMax * 1 / 10;
	x_pos_sold = PS_VMax * 4 / 10;//x_pos_text + 250 * PS_VMax / Print_Screen[PS_X];
	x_pos_gold = PS_VMax * 6 / 10;
	x_pos_eaten = PS_VMax * 8 / 10;
	y_pos = 44 * PS_VMax / Print_Screen[PS_Y];
	var int dy;	dy = (PS_VMax * 8 / 10 - 2 * y_pos) / (MR_Count + 2);	//межстрочный интервал
	View_AddText(Result_View, x_pos_text, y_pos, "Грибов", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_sold, y_pos, "Сдано", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_sold, y_pos + dy, "Константино", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_gold, y_pos, "Получено", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_gold, y_pos + dy, "золота", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_eaten, y_pos, "Съедено", FONT_ScreenSmall);
	y_pos += dy * 2 + dy / 2;
	
	var int i;	i = 0;
	var int sum_sold; sum_sold = 0;
	var int sum_gold; sum_gold = 0;
	var int sum_eaten; sum_eaten = 0;
	while (i < MR_Count);
		cnt_sold = MEM_ReadStatArr(MR_Counter, i);
		cnt_eaten = MEM_ReadStatArr(MR_Eaten, i);
		if (cnt_sold || cnt_eaten)	{
			cnt_gold = cnt_sold * MEM_ReadStatArr(MR_Price, i);
			if (i == MR_Oyster)	{	cnt_gold += 100;	};
			View_AddText(Result_View, x_pos_text, y_pos, MEM_ReadStatStringArr(MR_Names, i), FONT_ScreenSmall);
			View_AddText(Result_View, x_pos_sold, y_pos, IntToString(cnt_sold), FONT_ScreenSmall);
			View_AddText(Result_View, x_pos_gold, y_pos, IntToString(cnt_gold), FONT_ScreenSmall);
			View_AddText(Result_View, x_pos_eaten, y_pos, IntToString(cnt_eaten), FONT_ScreenSmall);
			y_pos += dy;
			sum_sold += cnt_sold;
			sum_gold += cnt_gold;
			sum_eaten += cnt_eaten;
		};
		i += 1;
	end;

	View_AddText(Result_View, x_pos_text, y_pos, "----------------", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_sold, y_pos, "------", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_gold, y_pos, "------", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_eaten, y_pos, "------", FONT_ScreenSmall);
	y_pos += dy;
	View_AddText(Result_View, x_pos_text, y_pos, "ВСЕГО:", FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_sold, y_pos, IntToString(sum_sold), FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_gold, y_pos, IntToString(sum_gold), FONT_ScreenSmall);
	View_AddText(Result_View, x_pos_eaten, y_pos, IntToString(sum_eaten), FONT_ScreenSmall);
};
func void B_HideResult()
{
	if (Result_View != 0)	{
		View_Close(Result_View);
		View_Delete(Result_View);
		Result_View = 0;
	};
};

