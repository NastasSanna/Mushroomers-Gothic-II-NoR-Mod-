/**************************************************************************

							НАЙДЕН ПРЕДМЕТ

  Игрок нашел предметы itm в количестве amount.
  Предметы будут добавлены в инвентарь, выдано сообщение
  
***************************************************************************/


func void B_PlayerFindItem(var int itm, var int amount)
{
	if(Npc_IsPlayer(self) && (amount > 0))
	{
		var string concatText;
		var string itemname;
		CreateInvItems(self, itm, amount);
		itemname = item.name;
		if(itm == ItMi_Gold) // золото
		{
			if ((amount % 10 == 1) && (amount % 100 != 11)) // особенность русского языка
			{
				concatText = ConcatStrings(IntToString(amount),PRINT_Gold1);	// 1, 21, 101... золотой
			}
			else
			{
				concatText = ConcatStrings(IntToString(amount),PRINT_Gold);		// amount золотых
			};
			Snd_Play("Geldbeutel");
		}
		else // не золото
		{
			concatText = item.name; // название предмета
			// если получено несколько предметов - в скобках указать сколько
			if(amount > 1) 
			{
				concatText = ConcatStrings(concatText," (");
				concatText = ConcatStrings(concatText,IntToString(amount));
				concatText = ConcatStrings(concatText,PRINT_Items);
				concatText = ConcatStrings(concatText,")");
			};
		};
		concatText = ConcatStrings(PRINT_Found, concatText);
		Print(concatText);
	};
};

