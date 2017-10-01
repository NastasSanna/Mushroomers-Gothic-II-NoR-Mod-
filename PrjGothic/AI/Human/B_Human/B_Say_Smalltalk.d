/**************************************************************************

							ФОНОВЫЕ РАЗГОВОРЫ

  B_Say_Smalltalk	()
  Персонаж sуlf говорит сам себе стандартную фоновую фразу. Имитирует
общение NPC между собой.

  Фразы выбираются случайно, некоторые с учетом гильдии.
  Общие фразы 01-25, специальные фразы гильдий 26-30.

  Связаные файлы:
 стандартные фразы					 				Story\SVM.d
 функция B_Say										AI\Human\B_Human\B_say.d

***************************************************************************/

func void B_Say_Smalltalk()
{
	B_MM_DeSynchronize();
	// внутренние переменные случайных чисел //NS: одной можно обойтись, но неудобно
	var int random;
	var int Choice;
	random = Hlp_Random(120);
	Choice = Hlp_Random(1);
	
	// ОБЩИЕ ФРАЗЫ ---------------------------------------------------------
	
	/* выдаются с равной вероятностью */
	
	if(random < 5)
	{
		B_Say(self,self,"$SMALLTALK01");
	}
	else if(random < 10)
	{
		B_Say(self,self,"$SMALLTALK02");
	}
	else if(random < 15)
	{
		B_Say(self,self,"$SMALLTALK03");
	}
	else if(random < 20)
	{
		B_Say(self,self,"$SMALLTALK04");
	}
	else if(random < 25)
	{
		B_Say(self,self,"$SMALLTALK05");
	}
	else if(random < 30)
	{
		B_Say(self,self,"$SMALLTALK06");
	}
	else if(random < 35)
	{
		B_Say(self,self,"$SMALLTALK07");
	}
	else if(random < 40)
	{
		B_Say(self,self,"$SMALLTALK08");
	}
	else if(random < 45)
	{
		B_Say(self,self,"$SMALLTALK09");
	}
	else if(random < 50)
	{
		B_Say(self,self,"$SMALLTALK10");
	}
	else if(random < 55)
	{
		B_Say(self,self,"$SMALLTALK11");
	}
	else if(random < 60)
	{
		B_Say(self,self,"$SMALLTALK12");
	}
	else if(random < 65)
	{
		B_Say(self,self,"$SMALLTALK13");
	}
	else if(random < 70)
	{
		B_Say(self,self,"$SMALLTALK14");
	}
	else if(random < 75)
	{
		B_Say(self,self,"$SMALLTALK15");
	}
	else if(random < 80)
	{
		B_Say(self,self,"$SMALLTALK16");
	}
	else if(random < 85)
	{
		B_Say(self,self,"$SMALLTALK17");
	}
	else if(random < 90)
	{
		B_Say(self,self,"$SMALLTALK18");
	}
	else if(random < 95)
	{
		B_Say(self,self,"$SMALLTALK19");
	}
	else if(random < 100)
	{
		B_Say(self,self,"$SMALLTALK20");
	}
	else if(random < 105)
	{
		B_Say(self,self,"$SMALLTALK21");
	}
	
	// ОСОБЫЕ ФРАЗЫ --------------------------------------------------------------------
	/* зависят от гильдии, вероятность специальных фраз вдвое меньше, чем у общих */
	
	else if(random < 110)
	{
		// для послушников, паладинов, магов огня (про Инноса)
		if((Npc_GetTrueGuild(self) == GIL_NOV) || (Npc_GetTrueGuild(self) == GIL_PAL) || (Npc_GetTrueGuild(self) == GIL_KDF))
		{
			// с равной вероятностью обычная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK28");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK22");
			};
		}
		// для бандитов, наемников, охотников на драконов, пиратов
		else if((Npc_GetTrueGuild(self) == GIL_BDT) || (Npc_GetTrueGuild(self) == GIL_SLD) 
			|| (Npc_GetTrueGuild(self) == GIL_PIR))
		{
			// с равной вероятностью обычная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK25");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK22");
			};
		}
		// для всех остальных - обычная фраза
		else
		{
			B_Say(self,self,"$SMALLTALK22");
		};
	}
	else if(random < 115)
	{
		// для послушников, паладинов, магов огня (про Инноса)
		if((Npc_GetTrueGuild(self) == GIL_NOV) || (Npc_GetTrueGuild(self) == GIL_PAL) || (Npc_GetTrueGuild(self) == GIL_KDF))
		{
			// с равной вероятностью обычная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK29");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK23");
			};
		}
		else if((Npc_GetTrueGuild(self) == GIL_BDT) || (Npc_GetTrueGuild(self) == GIL_SLD)
			|| (Npc_GetTrueGuild(self) == GIL_PIR))
		{
			// с равной вероятностью обычная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK26");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK23");
			};
		}
		// для всех остальных - обычная фраза
		else
		{
			B_Say(self,self,"$SMALLTALK23");
		};
	}
	else if(random <= 120)
	{
		// для послушников, паладинов, магов огня (про Инноса)
		if((Npc_GetTrueGuild(self) == GIL_NOV) || (Npc_GetTrueGuild(self) == GIL_PAL) || (Npc_GetTrueGuild(self) == GIL_KDF))
		{
			// с равной вероятностью обчная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK30");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK24");
			};
		}
		// для бандитов, наемников, охотников на драконов и пиратов
		else if((Npc_GetTrueGuild(self) == GIL_BDT) || (Npc_GetTrueGuild(self) == GIL_SLD)
			|| (Npc_GetTrueGuild(self) == GIL_PIR))
		{
			// с равной вероятностью обчная или специальная фраза
			if(Choice == 0)
			{
				B_Say(self,self,"$SMALLTALK27");
			}
			else
			{
				B_Say(self,self,"$SMALLTALK24");
			};
		}
		// для всех остальных - обычная фраза
		else
		{
			B_Say(self,self,"$SMALLTALK24");
		};
	};
};

