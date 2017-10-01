/************************************************************************************
								ОБОБРАТЬ ТЕЛО
  
  Мертвое или бесчувственное, после победы в бою. По умолчанию подбирается золото
 и выпавшее оружие. Если ранены, потом лечимся.
 
  Квестовые: B_OnRansackBody
  Сбор мяса: ZS_GetMeat
  
  Набор восприятий: обычный
  Режим перемещения: не задан (после атаки бег)

************************************************************************************/


func void ZS_RansackBody()
{
	Perception_Set_Normal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
};

func int ZS_RansackBody_Loop()
{
	//ничего не ждем
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var int x;
	B_TurnToNpc(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	//если не по квесту
	if (!B_OnRansackBody())	{
		//берем зелото
		if (other.guild < GIL_SEPERATOR_HUM)	{
			if(Npc_HasItems(other,ItMi_Gold) > 0)
			{
				x = Npc_HasItems(other,ItMi_Gold);
				CreateInvItems(self,ItMi_Gold,x);
				Npc_RemoveInvItems(other,ItMi_Gold,x);
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$ITOOKYOURGOLD");
				}
				else	{
					B_Say(self,other,"$ITOOKYOURGOLD_F");
				};
			}
			else
			{
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$SHITNOGOLD");
				}
				else	{
					B_Say(self,other,"$SHITNOGOLD_F");
				};
			};
			//и оружие
			Npc_PerceiveAll(self);
			if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
			{
				if(Hlp_IsValidItem(item))
				{
					if(Npc_GetDistToItem(self,item) < 500)
					{
						AI_TakeItem(self,item);
						B_Say(self,self,"$ITAKEYOURWEAPON");
						AI_EquipBestMeleeWeapon(self);
						AI_EquipBestRangedWeapon(self);
					};
				};
			};
		};
	};
	//если надо - лечимся
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

func void ZS_GetMeat()
{
	var int x;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	x = Npc_HasItems(other,ItFoMuttonRaw);
	CreateInvItems(self,ItFoMuttonRaw,x);
	Npc_RemoveInvItems(other,ItFoMuttonRaw,x);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

