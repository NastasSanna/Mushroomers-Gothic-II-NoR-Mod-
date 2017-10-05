
// готовка всего независимо от mobsi
//пожарить мясо на чем угодно

//жарка MuttonCount кусков мяса
func void Cook_Meat_DoCook(var int MuttonCount)
{
	//на 1 кусок 2 минуты игрового времени +- 5 минут
	var int time;	time = 2 * MuttonCount;
	if (MuttonCount > 10)	{
		time += Hlp_Random(5);
	};
	//жарим
	Npc_RemoveInvItems(self,ItFoMuttonRaw,MuttonCount);
	CreateInvItems(self,ItFoMutton,MuttonCount);
	//ждем
	//AI_PrintScreen(PRINT_SomeTimeLater,-1,25,FONT_Screen,3);
	AI_Wait(self, 1.2);
	B_SetTimePlus(0, time);
	//готово
};