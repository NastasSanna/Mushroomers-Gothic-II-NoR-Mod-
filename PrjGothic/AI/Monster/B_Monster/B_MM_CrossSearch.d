
//идет к предмету
func void B_CrossGoToItem()
{
	if(!Hlp_IsValidItem(item))
	{
		return;
	};
	if(Npc_GetHeightToItem(self,item) > 500)
	{
		return;
	};
	var int rnd; rnd = Hlp_Random(100);
	AI_GotoItem(self,item);
	if((Npc_GetDistToItem(self,item) < 300) && (rnd == 1))
	{
		AI_PlayAni(self,"T_WARN");
	}
	else if (rnd < 5)
	{
		AI_PlayAni(self,"R_ROAM1");
	};
};

//поиск предмета в цикле
func int B_CrossSearchItem()
{
	//ищет только Крестик
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Molerat_Cross) && MIS_Till_Pet_Search)
	{
		//если есть предмет и Тилл не слишком далеко
		Npc_PerceiveAll(self);
		if((Npc_GetDistToNpc(self,hero) < 2500) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			//ищем еду
			var int CrossSearchFlags;	CrossSearchFlags = ITEM_KAT_FOOD;
			if(Wld_DetectItem(self,CrossSearchFlags))
			{
				B_CrossGoToItem();
				return TRUE;
			};
		};
	};
	return FALSE;
};

