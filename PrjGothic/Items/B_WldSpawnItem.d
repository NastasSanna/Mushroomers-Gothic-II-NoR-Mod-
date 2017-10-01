// Функции для случайной вставки итемов в мир (на FP/WP)


//NS - 11/07/13
// собирает название вида PointTemplate_insPointNum (2 цифры)
func string C_GetRandomPointName(var string PointTemplate, var int insPointNum)
{
	var string insPoint;
	if (insPointNum < 10)
	{
		insPoint = ConcatStrings(PointTemplate, "_0");
		insPoint = ConcatStrings(insPoint, IntToString(insPointNum));
	}
	else
	{
		insPoint = ConcatStrings(PointTemplate, "_");
		insPoint = ConcatStrings(insPoint, IntToString(insPointNum));
	};
//	MEM_Debug(insPoint);
	return insPoint;
};

//NS - 11/07/13
// вставляет 1 предмет ItemInst в случайный FP/WP с названием PointTemplate_xx
//  если  MaxNum >= 100, то MinNum<=xx<=99
//  если  MinNum < 0, то 0<=xx<=MaxNum
//  если  MaxNum < MinNum, то ничего не вставится
//  PointTemplate следует передавать в верхнем регистре
// возвращает TRUE, если предмет был вставлен
func int B_WldSpawnItem(var int ItemInst, var string PointTemplate, var int MinNum, var int MaxNum)
{
	if (MaxNum < MinNum)	{	return FALSE;	};
	if (MinNum < 0)		{	MinNum = 0;	};
	if (MaxNum > 99)	{	MaxNum = MaxNum % 100;	};
	var int RndNum;
	RndNum = Hlp_Random(MaxNum - MinNum + 1) + MinNum;
	Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, RndNum));
	return TRUE;
};

//NS - 11/07/13
// вставляет Count предметов ItemInst в случайный FP/WP с названием PointTemplate_xx
// так, чтобы FP/WP не повторялись
//   правила те же, что и в предыдущей функции
//   +если Count < 0, ничего не вставится
//   +если Count > MaxNum - MinNum + 1 (не хватает FP/WP), все FP/WP будут заполнены
//  возвращает число успешно вставленных предметов
// есть вариант с Ikarus и без него (через рекурсию), оба работают
	//  вспомогательная функция - n раз генерирует случайное число
	//  и возвращает наименьшее из получившихся значений
	func int _RndMin_N(var int min, var int max, var int n)
	{
		var int x_min;	x_min = max;
		var int x;
		//	var string txt;
		//* Ikarus
		//	txt = ConcatStrings("n = ", IntToString(n));
		var int i; i = 0;
		var int loop; loop = MEM_StackPos.position;
		if (i < n) /*while (i < n);*/
		{
			x = Hlp_Random(max - min + 1) + min;
			if (x < x_min)	{	x_min = x;	};
			i += 1;
			MEM_StackPos.position = loop;
		};
		/*end;*/
		/*/ рекурсия
		if (n <= 1)
		{
			MEM_Debug(ConcatStrings(IntToString(n), " return x"));
			return Hlp_Random(max - min + 1) + min;
		};
		x_min = _RndMin_N(min, max, n - 1);
		x = Hlp_Random(max - min + 1) + min;
		//	txt = ConcatStrings("n = ", IntToString(n));
		//	txt = ConcatStrings(txt, " x = ");
		//	txt = ConcatStrings(txt, IntToString(x));
		if (x < x_min)	{	x_min = x;	};
		//*/
		//MEM_Debug(ConcatStrings(txt, " return x_min"));
		return x_min;
	};
func int B_WldSpawnItems(var int ItemInst, var string PointTemplate, var int MinNum, var int MaxNum, var int Count)
{
	// неверные входные данные
	if (MaxNum < MinNum)	{	return 0;	};
	if (Count <= 0) 		{	return 0;	};
	if (MinNum < 0)		{	MinNum = 0;	};
	if (MaxNum > 99)	{	MaxNum = MaxNum % 100;	};
	
	// слишком большое Count - просто заполняем все FP/WP по порядку
	if (Count >= MaxNum - MinNum + 1)
	{
		Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, MinNum));
		return 1 + B_WldSpawnItems(ItemInst, PointTemplate, MinNum + 1, MaxNum, Count - 1);	
	};
	
	// иначе - генерируем первое (минимальное из всех) число xx
	// в диапазоне от MinNum до MaxNum - (Count - 1) 
	// это гарантирует, что у нас останется еще (Count - 1) мест для остальных предметов
	var int RndNum;	RndNum = MinNum;
	//* Ikarus
	var int i; i = Count;
	var int loop; loop = MEM_StackPos.position;
	if (i > 0) /*while (i > 0);*/
	{
		RndNum = _RndMin_N(MinNum, MaxNum - (i - 1), i);
		MinNum = RndNum + 1;
		Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, RndNum));
		i -= 1;
		MEM_StackPos.position = loop;
	};
	/*end;*/
	return Count;
	/*/ рекурсия
	//		var string txt;
	//		txt = ConcatStrings("Min = ", IntToString(MinNum));
	//		txt = ConcatStrings(txt, " Max = ");
	//		txt = ConcatStrings(txt, IntToString(MaxNum - (Count - 1)));
	//		MEM_Debug(txt);
	RndNum = _RndMin_N(MinNum, MaxNum - (Count - 1), Count);
	Wld_InsertItem(ItemInst, C_DS_GetRandomPointName(PointTemplate, RndNum));
	// запускаем вставку остальных (Count - 1) предметов и возвращаем их общее кол-во
	return 1 + B_DS_WldSpawnItems(ItemInst, PointTemplate, RndNum + 1, MaxNum, Count - 1);
	//*/
};

