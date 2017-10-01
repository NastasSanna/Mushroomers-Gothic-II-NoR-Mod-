
func void B_GiveDeathInv(var C_Npc slf, var C_Npc oth)
{
	
	// если инвентарь уже заполнен - ничего не делать
	if(slf.aivar[AIV_DeathInvGiven] == TRUE)
	{
		return;
	};
	
	slf.aivar[AIV_DeathInvGiven] = TRUE;
	
	// Охотничьи трофеи -----------------------------------------------------------
	
	// если убитый - монстр, с которого можно снять трофей
	if ((slf.guild > GIL_SEPERATOR_HUM) && (slf.guild < GIL_SEPERATOR_ORC) && (slf.guild != GIL_GOBBO))
	{
		// удалить трофеи, которые ГГ не может добыть
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_Teeth, Npc_HasItems(slf, ItAt_Teeth));
			Npc_RemoveInvItems(slf, ItAt_SharkTeeth, Npc_HasItems(slf, ItAt_SharkTeeth));
			Npc_RemoveInvItems(slf, ItAt_TrollTooth, Npc_HasItems(slf, ItAt_TrollTooth));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_Claw, Npc_HasItems(slf, ItAt_Claw));
			Npc_RemoveInvItems(slf, ItAt_LurkerClaw, Npc_HasItems(slf, ItAt_LurkerClaw));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_SheepFur, Npc_HasItems(slf, ItAt_SheepFur));
			Npc_RemoveInvItems(slf, ItAt_WolfFur, Npc_HasItems(slf, ItAt_WolfFur));
			Npc_RemoveInvItems(slf, ItAt_WargFur, Npc_HasItems(slf, ItAt_WargFur));
			Npc_RemoveInvItems(slf, ItAt_ShadowFur, Npc_HasItems(slf, ItAt_ShadowFur));
			Npc_RemoveInvItems(slf, ItAt_TrollFur, Npc_HasItems(slf, ItAt_TrollFur));
			Npc_RemoveInvItems(slf, ItAt_TrollBlackFur, Npc_HasItems(slf, ItAt_TrollBlackFur));
			Npc_RemoveInvItems(slf, ItAt_Addon_KeilerFur, Npc_HasItems(slf, ItAt_Addon_KeilerFur));
			Npc_RemoveInvItems(slf, ItAt_IceWolfFur, Npc_HasItems(slf, ItAt_IceWolfFur));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Npc_RemoveInvItems(slf, itat_LurkerSkin, Npc_HasItems(slf, itat_LurkerSkin));
			Npc_RemoveInvItems(slf, ItAt_SharkSkin, Npc_HasItems(slf, ItAt_SharkSkin));
		};	
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_StoneGolemHeart, Npc_HasItems(slf, ItAt_StoneGolemHeart));
			Npc_RemoveInvItems(slf, ItAt_FireGolemHeart, Npc_HasItems(slf, ItAt_FireGolemHeart));
			Npc_RemoveInvItems(slf, ItAt_IceGolemHeart, Npc_HasItems(slf, ItAt_IceGolemHeart));
			Npc_RemoveInvItems(slf, ItAt_DemonHeart, Npc_HasItems(slf, ItAt_DemonHeart));
			Npc_RemoveInvItems(slf, ItAt_DemonHeart, Npc_HasItems(slf, ItAt_DemonHeart));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_ShadowHorn, Npc_HasItems(slf, ItAt_ShadowHorn));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_WaranFiretongue, Npc_HasItems(slf, ItAt_WaranFiretongue));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_Wing, Npc_HasItems(slf, ItAt_Wing));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_Sting, Npc_HasItems(slf, ItAt_Sting));
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_BugMandibles, Npc_HasItems(slf, ItAt_BugMandibles));
			Npc_RemoveInvItems(slf, ItAt_CrawlerMandibles, Npc_HasItems(slf, ItAt_CrawlerMandibles));
		};		
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_CrawlerPlate, Npc_HasItems(slf, ItAt_CrawlerPlate));
		};		
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_DrgSnapperHorn, Npc_HasItems(slf, ItAt_DrgSnapperHorn));
		};	
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_DragonScale, Npc_HasItems(slf, ItAt_DragonScale));
		};	
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_DragonBlood, Npc_HasItems(slf, ItAt_DragonBlood));
		};	
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_KeilerTusk] == FALSE)
		{
			Npc_RemoveInvItems(slf, ItAt_KeilerJawRaw, Npc_HasItems(slf, ItAt_KeilerJawRaw));
			Npc_RemoveInvItems(slf, ItAt_KeilerHogJawRaw, Npc_HasItems(slf, ItAt_KeilerHogJawRaw));
		};
		
		//если есть хороший нож - то больше мяса
		if (Npc_HasItems(slf,ItFoMuttonRaw) && Npc_HasItems(oth,ItMW_MR_1h_BrianKnife))	{
			CreateInvItem(slf,ItFoMuttonRaw);
		};
	};	

	// Случайное заполнение инвентаря ---------------------------------------------
	var int Rnd;
	
	// зеленый гоблин - рыба/трава/ничего и серебряное кольцо/2-6 золотых
	if(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)
	{
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItPl_Health_Herb_01,1);
		}
		else if (Rnd < 35)		//15%
		{			
			CreateInvItems(slf,ItPl_Mana_Herb_01,1);
		}
		else if (Rnd < 75)		//40%
		{			
			CreateInvItems(slf,ItFo_Fish,1);
		};	
		Rnd = C_Random(100);
		if (Rnd == 99)			//1%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else					//99%
		{
			CreateInvItems(slf,ItMi_Gold,C_Random(5) + 2);
		};
	};
	
	// черный гоблин - рыба/трава/ничего и золотое кольцо/5-10 золотых
	if(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItPl_Health_Herb_02,1);
		}
		else if (Rnd < 45)		//25%
		{			
			CreateInvItems(slf,ItPl_Mana_Herb_02,1);
		}
		else if (Rnd < 75)		//30%
		{			
			CreateInvItems(slf,ItFo_Fish,1);
		};	
		if (Rnd == 99)			//1%
		{			
			CreateInvItems(slf,ItMi_GoldRing,1);
		}
		else					//99%
		{
			CreateInvItems(slf,ItMi_Gold,C_Random(6) + 5);
		};
	};

	// орк-воин - лечебное зелье/мясо/лечебное растение/самогон/ничего и кольцо/5-25 золотых
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)
	{
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItFoMuttonRaw,1);
		}
		else if (Rnd < 40)		//20%
		{			
			CreateInvItems(slf,ItFo_Booze,1);
		}
		else if (Rnd < 60)		//20%
		{			
			CreateInvItems(slf,ItPl_Health_Herb_01,1);
		}	
		else if (Rnd < 80)		//20%
		{			
			CreateInvItems(slf,ItPo_Health_01,1);
		}
		else if (Rnd < 90)		//10%
		{			
			CreateInvItems(slf,ItPo_Health_02,1);
		}
		else if (Rnd < 95)		//5%
		{			
			CreateInvItems(slf,ItPo_Health_03,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 5)			//5%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else					//95%
		{
			CreateInvItems(slf,ItMi_Gold,5+C_Random(21));
		};
	};

	// орк-шаман - зелье маны/растение маны/уголь/сера/ничего и кольцо/0-10 золотых
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItPl_Mana_Herb_02,1);
		}
		else if (Rnd < 40)		//20%
		{			
			CreateInvItems(slf,ItMi_Coal,1);
		}
		else if (Rnd < 60)		//20%
		{			
			CreateInvItems(slf,ItMi_Sulfur,1);
		}	
		else if (Rnd < 80)		//20%
		{			
			CreateInvItems(slf,ItPo_Mana_01,1);
		}
		else if (Rnd < 90)		//10%
		{			
			CreateInvItems(slf,ItPo_Mana_02,1);
		}
		else if (Rnd < 95)		//5%
		{			
			CreateInvItems(slf,ItPo_Mana_03,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 5)			//5%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else if (Rnd < 10)		//5%
		{			
			CreateInvItems(slf,ItMi_GoldRing,1);
		}
		else					//95%
		{
			CreateInvItems(slf,ItMi_Gold,C_Random(11));
		};
	};

	// элитный орк - шкуру волка/варга/клыки/ничего, зелье лечения/свиток лечения/ничего и кольцо/10-25 золотых
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		Rnd = C_Random(100);
		if (Rnd < 5)		//5%
		{			
			CreateInvItems(slf,ItAt_WargFur,1);
		}
		else if (Rnd < 15)	//10%
		{			
			CreateInvItems(slf,ItAt_WolfFur,1);
		}
		else if (Rnd < 25)	//20%
		{			
			CreateInvItems(slf,ItAt_Teeth,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 25)		//25%
		{			
			CreateInvItems(slf,ItSc_LightHeal,1);
		}	
		else if (Rnd < 50)		//25%
		{			
			CreateInvItems(slf,ItPo_Health_01,1);
		}
		else if (Rnd < 70)		//20%
		{			
			CreateInvItems(slf,ItPo_Health_02,1);
		}
		else if (Rnd < 85)		//15%
		{			
			CreateInvItems(slf,ItPo_Health_03,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 5)			//5%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else if (Rnd < 15)		//10%
		{			
			CreateInvItems(slf,ItMi_GoldRing,1);
		}
		else					//95%
		{
			CreateInvItems(slf,ItMi_Gold,10+C_Random(16));
		};
	};

	// демон - сера/ничего, зелье лечения/маны/ничего и кольцо/ничего
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	{
		Rnd = C_Random(100);
		if (Rnd < 30)			//30%
		{			
			CreateInvItems(slf,ItMi_Pitch,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 30)			//30%
		{			
			CreateInvItems(slf,ItPo_Health_02,1);
		}	
		else if (Rnd < 60)		//30%
		{			
			CreateInvItems(slf,ItPo_Mana_01,1);
		}
		else if (Rnd < 80)		//20%
		{			
			CreateInvItems(slf,ItPo_Mana_02,1);
		}
		else if (Rnd < 90)		//10%
		{			
			CreateInvItems(slf,ItPo_Mana_03,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else if (Rnd < 30)		//10%
		{			
			CreateInvItems(slf,ItMi_GoldRing,1);
		};
	};
	// демон-лорд - свиток вызова/ничего, зелье лечения/маны/ничего и кольцо/ничего
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		Rnd = C_Random(100);
		if (Rnd < 20)			//20%
		{			
			CreateInvItems(slf,ItSc_SumDemon,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 25)			//25%
		{			
			CreateInvItems(slf,ItPo_Health_02,1);
		}	
		else if (Rnd < 50)		//25%
		{			
			CreateInvItems(slf,ItPo_Mana_01,1);
		}
		else if (Rnd < 80)		//30%
		{			
			CreateInvItems(slf,ItPo_Mana_02,1);
		}
		else if (Rnd < 95)		//15%
		{			
			CreateInvItems(slf,ItPo_Mana_03,1);
		};
		Rnd = C_Random(100);
		if (Rnd < 10)			//10%
		{			
			CreateInvItems(slf,ItMi_SilverRing,1);
		}
		else if (Rnd < 40)		//30%
		{			
			CreateInvItems(slf,ItMi_GoldRing,1);
		};
	};
};

