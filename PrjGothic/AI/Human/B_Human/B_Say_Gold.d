/**************************************************************************

						НАЗВАТЬ СТОИМОСТЬ

  B_Say_Gold	(slf,	oth,	goldAmount)
  Персонаж slf (я) называет other (он) стоимость goldAmount. 
  
  Возможные суммы - от 10 до 100 золотых с шагом 10 и от 100 до 1000
золотых с шагом 50.
  Если указана неверная сумма, функция ничего не сделает.
  
  Связаные файлы:
 стандартные фразы					 		Story\SVM.d
 функция B_Say								AI\Human\B_Human\B_Say.d

***************************************************************************/


func void B_Say_Gold(var C_Npc slf,var C_Npc oth,var int goldAmount)
{
	// в зависимости от значения goldAmount назвать нужную сумму
	if(goldAmount == 1000)
	{
		B_Say(slf,oth,"$GOLD_1000");
	}
	else if(goldAmount == 950)
	{
		B_Say(slf,oth,"$GOLD_950");
	}
	else if(goldAmount == 900)
	{
		B_Say(slf,oth,"$GOLD_900");
	}
	else if(goldAmount == 850)
	{
		B_Say(slf,oth,"$GOLD_850");
	}
	else if(goldAmount == 800)
	{
		B_Say(slf,oth,"$GOLD_800");
	}
	else if(goldAmount == 750)
	{
		B_Say(slf,oth,"$GOLD_750");
	}
	else if(goldAmount == 700)
	{
		B_Say(slf,oth,"$GOLD_700");
	}
	else if(goldAmount == 650)
	{
		B_Say(slf,oth,"$GOLD_650");
	}
	else if(goldAmount == 600)
	{
		B_Say(slf,oth,"$GOLD_600");
	}
	else if(goldAmount == 550)
	{
		B_Say(slf,oth,"$GOLD_550");
	}
	else if(goldAmount == 500)
	{
		B_Say(slf,oth,"$GOLD_500");
	}
	else if(goldAmount == 450)
	{
		B_Say(slf,oth,"$GOLD_450");
	}
	else if(goldAmount == 400)
	{
		B_Say(slf,oth,"$GOLD_400");
	}
	else if(goldAmount == 350)
	{
		B_Say(slf,oth,"$GOLD_350");
	}
	else if(goldAmount == 300)
	{
		B_Say(slf,oth,"$GOLD_300");
	}
	else if(goldAmount == 250)
	{
		B_Say(slf,oth,"$GOLD_250");
	}
	else if(goldAmount == 200)
	{
		B_Say(slf,oth,"$GOLD_200");
	}
	else if(goldAmount == 150)
	{
		B_Say(slf,oth,"$GOLD_150");
	}
	else if(goldAmount == 100)
	{
		B_Say(slf,oth,"$GOLD_100");
	}
	else if(goldAmount == 90)
	{
		B_Say(slf,oth,"$GOLD_90");
	}
	else if(goldAmount == 80)
	{
		B_Say(slf,oth,"$GOLD_80");
	}
	else if(goldAmount == 70)
	{
		B_Say(slf,oth,"$GOLD_70");
	}
	else if(goldAmount == 60)
	{
		B_Say(slf,oth,"$GOLD_60");
	}
	else if(goldAmount == 50)
	{
		B_Say(slf,oth,"$GOLD_50");
	}
	else if(goldAmount == 40)
	{
		B_Say(slf,oth,"$GOLD_40");
	}
	else if(goldAmount == 30)
	{
		B_Say(slf,oth,"$GOLD_30");
	}
	else if(goldAmount == 20)
	{
		B_Say(slf,oth,"$GOLD_20");
	}
	else if(goldAmount == 10)
	{
		B_Say(slf,oth,"$GOLD_10");
	};
};

