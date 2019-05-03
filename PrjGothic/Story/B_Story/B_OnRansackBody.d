
//возвращает TRUE, если не нужно подбирать обычные предметы
func int B_OnRansackBody()
{
	var int x;
	if(Npc_IsPlayer(other))	{
		//Руперт ==============================================
		if(C_HeroIs_Rupert())
		{
			var C_NPC Moe;	Moe = Hlp_GetNpc(VLK_432_Moe);
			//Мое забирает долг Кардифу
			if	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Moe))
				&& C_NpcHasGold(other,60) && (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE))
			{
				Npc_RemoveInvItems(other,ItMi_Gold,60);
				B_RupertPayDebt(Creditor_Kardif);
			}
			else if(Npc_HasItems(other,ItMi_Gold) > 0)
			{
				x = Npc_HasItems(other,ItMi_Gold);
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
			//Долг Лемару
			if (((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_484_Lehmar))
					|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_415_Meldor))
					|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4941_Thug)))
				&& (MIS_Rupert_Debts_Lehmar_Day < Wld_GetDay()) 
				&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])
			{
				B_StealAllFromNpcInventory(hero,20,ITEM_KAT_FF|ITEM_KAT_NF|ITEM_KAT_NONE);
				if(Npc_HasItems(other,ItMi_Gold) > 0)
				{
					x = Npc_HasItems(other,ItMi_Gold);
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
				B_StartOtherRoutine(VLK_4941_Thug,"TOT");
				return TRUE;
			};
		};
		//Елена ==============================================
		if (C_HeroIs_Elena())	{
			//Кубок Лемара
			if (C_NpcIs(self,VLK_484_Lehmar)
				&& (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Mad))
			{
				if(Npc_HasItems(other,ItMi_FaithfulnessCup_02) > 0)
				{
					Npc_RemoveInvItems(other,ItMi_FaithfulnessCup_02,1);
					MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_GotByForce;
					MIS_Elena_Present_ReadyCnt -= 1;
					if (MIS_Elena_Present_ReadyCnt == 0)	{
						MIS_Elena_Present = LOG_Running;
						B_LogEntry_Status(TOPIC_Elena_Present,LOG_Running,TOPIC_Elena_Present_LehmarCupForced);
					}
					else	{
						B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_LehmarCupForced);
					};
				};
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$THEFT_CRIME");
				}
				else	{
					B_Say(self,other,"$THEFT_CRIME_F");
				};
				VLK_484_Lehmar.aivar[AIV_LastFightComment] = TRUE;
				return TRUE;
			};
		};
		//Халвор - жадность это плохо! ====================================================
		if ((C_NpcIs(self,VLK_494_Attila) || C_NpcIs(self,VLK_469_Halvor)) && MIS_KhorinisPost_HalvorGimmePacket)	{
			MEM_Debug("MIS_KhorinisPost_HalvorFight");
			if(Npc_HasItems(other,ItMi_Packet_Halvor) > 0)
			{
				Npc_RemoveInvItems(other,ItMi_Packet_Halvor,1);
			}
			else	{
				Npc_PerceiveAll(self);
				if(Wld_DetectItem(self,ITEM_KAT_NONE))
				{
					if(Hlp_IsValidItem(item))
					{
						if(Hlp_IsItem(item,ItMi_Packet_Halvor))
						{
							AI_TakeItem(self,item);
						};
					};
				};
			};
			MIS_KhorinisPost_HalvorGimmePacket = FALSE;
			MIS_KhorinisPost_HalvorGotPacket = TRUE;
			return TRUE;
		};
	};
	// Трокар собирает трофеи со своего кабана
	if (C_NpcIs(self,OUT_1230_Trocar) && C_NpcIs(other,Keiler_Hog_Trocar))	{
		Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,1);
		Npc_RemoveInvItems(other,ItAt_KeilerHogJaw,1);
		return TRUE;
	};
};

