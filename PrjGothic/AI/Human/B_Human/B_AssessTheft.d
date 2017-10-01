/**************************************************************************

							ВОСПРИЯТИЕ КРАЖИ
 
  Персонаж self (я) заметил, что other (вор) украл item (вещь).
  
  B_AssessTheft() вызывается только для обработки восприятия
PERC_ASSESSTHEFT.

  Обычная реакция: напасть на вора.

  Можно брать вещи своей или дружественнйо гильдии, если они не принадлежат
конкретному персонажу.
  Персонажи следят только за собственными вещами - своими, своей или
дружественной гильдии.
  Персонаж нападет на ГГ, даже когда не видит его в момент кражи, если до
этого он следил за ним или велел выметаться.

  Нет сброса восприятий и действий перед атакой.

***************************************************************************/


func void B_AssessTheft()
{
	// НЕ обращать внимания, если -----------------------------------------
	
	// предполагаемый вор - не ГГ
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	// вор = ГГ -----v
	
	// ГГ в чьем-то  помещении, но он на другом этаже (проверка расстояния по вертикали)
	if((C_GetPlayerPortalGuild() != GIL_OUTDOOR) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	
	// мы в дружественных гильдих
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		// кроме случаев, когда взята моя личная вещь
		if (!(Hlp_IsValidItem(item) && Npc_OwnedByNpc(item,self)))
		{
			return;
		};
	};
	
	// украденная вещь не в моей собственности (личной, моей гильдии или дружественной гильдии)
	if(!C_IsTakenItemMyPossession(self,other,item))
	{
		return;
	};
	
	// я не могу видеть вора
	if(!Npc_CanSeeNpc(self,other))
	{
		// кроме случаев, когда мы в одном помещении, а я слежу за ним или велел выметаться
		if(!(Npc_IsInPlayersRoom(self) && (Npc_IsInState(self,ZS_ObservePlayer) || Npc_IsInState(self,ZS_ClearRoom))))
		{
			return;
		};
	};
	
	// если я не хочу наказывать вора,
	if(!C_WantToAttackThief(self,other))
	{ 
		// но если это потому, что я несу охрану входа,
		if(C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Behaviour],BEHAV_Hidden))
		{
			// то просто запомнить преступление ГГ
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		return;
	};
	
	// В других случаях ----------------------------------------------------------
	
	// немедленно напасть на ГГ как на вора
	B_Attack(self,other,AR_Theft,0);
};

