
//рычаг от пещеры на острове воров
//высегда выкл., воры внутри
func int CanUse_Thief_Isle()
{
	if (Npc_IsPlayer(self))	{
		PrintScreen("Не двигается.",-1,20,FONT_ScreenSmall,2);
	};
	return FALSE;
};