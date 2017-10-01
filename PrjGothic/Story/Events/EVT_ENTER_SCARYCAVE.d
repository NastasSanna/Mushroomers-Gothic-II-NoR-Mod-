
// ни один ГГ не пойдет в страшную пещеру с кучей скоровищ
func void EVT_ENTER_SCARYCAVE()
{
	if (Hlp_Random(100) < 50)	{
		PrintScreen("Дальше я не пойду!",-1,-1,FONT_Screen,3);
	} else {
		PrintScreen("Тут слишком опасно!",-1,-1,FONT_Screen,3);
	};
	AI_GoToWP(hero,"NW_TROLLAREA_TROLLROCKCAVE_02");	
};

var int EVT_ENTER_SCARYCAVE_PRE_Once;
func void EVT_ENTER_SCARYCAVE_PRE()
{
	if (!EVT_ENTER_SCARYCAVE_PRE_Once)	{
		PrintScreen("Пахнет могилой.",15,-1,FONT_Screen,3);
		EVT_ENTER_SCARYCAVE_PRE_Once = TRUE;
	};
};