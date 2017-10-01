
//Вывод сообщения о том, что взять нечего (внутр.)
func void player_plunder_is_empty()
{
	// генерация случайного числа от 0 до 99
	var int rnd;
	rnd = Hlp_Random(100);
	if(rnd < 40)
	{  // с вероятностью 40% - сообщение "Из этого не выйдет ничего хорошего..."
		Print(PRINT_NOTHINGTOGET);
		B_Say_Overlay(self,self,"$NOTHINGTOGET");
	}
	else if(rnd < 80)
	{  // с вероятностью 40% - сообщение "Там ничего нет..."
		Print(PRINT_NOTHINGTOGET02);
		B_Say_Overlay(self,self,"$NOTHINGTOGET02");
	}
	else
	{  // с вероятностью 20% - сообщение "Нечего взять..."
		Print(PRINT_NOTHINGTOGET03);
		B_Say_Overlay(self,self,"$NOTHINGTOGET03");
	};
};

