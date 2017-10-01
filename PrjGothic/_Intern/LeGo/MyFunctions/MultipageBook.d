

var int MultiBook_DocID;
var int MultiBook_Page;
var int MultiBook_PagesCount;
var int OPT_KEY_End;	var int OPT_KEY_End2;
var func MultiBook_PrintFunc;

//================================================================
func void MultiBook_Show()
{
	MEM_Debug(IntToString(MultiBook_Page));
	if (MultiBook_Page < 0)	{
		MultiBook_Page = 0;
	}
	else if (MultiBook_Page >= MultiBook_PagesCount)	{
		MultiBook_Page = MultiBook_PagesCount - 1;
	};
	MultiBook_DocID;
	MultiBook_Page;
	MEM_Call(MultiBook_PrintFunc);
	Doc_Show(MultiBook_DocID);
};
//================================================================
func void MultiBook_Cycle()
{
	if ((MEM_KeyState(MOUSE_BUTTONRIGHT) == KEY_PRESSED)
		|| (MEM_KeyState(OPT_KEY_End) == KEY_PRESSED) || (MEM_KeyState(OPT_KEY_End2) == KEY_PRESSED))	{
		return;
	};
	if (MEM_KeyState(KEY_LEFTARROW) == KEY_PRESSED)	{
		if (MultiBook_Page > 0)	{
			MultiBook_Page -= 1;
			MultiBook_Show();
		};
	}
	else if (MEM_KeyState(KEY_RIGHTARROW) == KEY_PRESSED)	{
		if (MultiBook_Page < MultiBook_PagesCount - 1)	{
			MultiBook_Page += 1;
			MultiBook_Show();
		};
	}
	else if (MEM_KeyState(KEY_HOME) == KEY_PRESSED)	{
		MultiBook_Page = 0;
		MultiBook_Show();
	}
	else if (MEM_KeyState(KEY_END) == KEY_PRESSED)	{
		MultiBook_Page = MultiBook_PagesCount - 1;
		MultiBook_Show();
	};
	FF_ApplyExt(MultiBook_Cycle,100,1);
};

//================================================================
func void MultiBook_Start(var int startPage, var int pagesCount, var func printFunc)
{
	MultiBook_Page = startPage;
	MultiBook_PagesCount = pagesCount;
	MultiBook_PrintFunc = printFunc;
	OPT_KEY_End = MEM_GetKey("keyEnd");
	OPT_KEY_End2 = MEM_GetSecondaryKey("keyEnd");

	MultiBook_DocID = Doc_Create();
	MultiBook_Show();

	FF_ApplyExt(MultiBook_Cycle,1000,1);
};

