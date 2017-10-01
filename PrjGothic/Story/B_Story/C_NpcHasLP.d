
// достаточно ли у oth очков обучения. комментарий выдает slf
// TRUE - недостаточно, FALSE - достаточно
func int C_NotEnoughLP(var C_Npc slf,var C_Npc oth,var int lp)
{
	// если у обучаемого недостаточно очков обучения
	if(oth.lp < lp)
	{
		var string txt;
		txt = ConcatStrings(PRINT_NotEnoughLP, " (");
		txt = ConcatStrings(txt, IntToString(lp - oth.lp));
		txt = ConcatStrings(txt, PRINT_LP);
		txt = ConcatStrings(txt,")");
		PrintScreen(txt,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return TRUE;
	};
	return FALSE;
};