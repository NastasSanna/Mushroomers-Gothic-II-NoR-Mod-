/**************************************************************************

					ВОСПРИЯТИЕ ИСПОЛЬЗОВАНИЯ ОБЪЕКТА
 
  Персонаж self (я) заметил, что other (он) воспользовался каким-то
объектом Mob. Работает только для ГГ.
  
  B_AssessUseMob() вызывается только для обработки восприятия
PERC_ASSESSUSEMOB.

  Обычная реакция: напасть на него, за то, что влез, куда не надо.

  Только для сундуков.

  Очень похоже на обработчик B_AssessTheft.

***************************************************************************/


func void B_AssessUseMob()
{
	// внутренняя переменная
	var string detMob;  //тип объекта
	
	// НЕ обращать внимания, если -----------------------------------------
	
	// это не ГГ
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	// он = ГГ -----v
	
	
	// ГГ в чьем-то  помещении, но он на другом этаже (проверка расстояния по вертикали)
	if(C_GetPlayerPortalGuild() != GIL_OUTDOOR)
	{
		if(Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};
	
	// мы в дружественных гильдиях
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		// кроме случаев, когда это мой личный объект
		if(!(Npc_IsDetectedMobOwnedByNpc(other,self)))
		{
			return;
		};
	};
	
	// объект не в моей собственности (личной, моей гильдии или дружественной гильдии)
	if(!C_IsUsedMobMyPossession(self,other))
	{
		return;
	};
	
	// я не могу видеть ГГ
	if(!Npc_CanSeeNpc(self,other))
	{
		// кроме случаев, когда мы в одном помещении, а я слежу за ним или велел выметаться
		if (!(Npc_IsInPlayersRoom(self) && (Npc_IsInState(self,ZS_ObservePlayer) || Npc_IsInState(self,ZS_ClearRoom))))
		{
			return;
		};
	};
	
	// использованный объект - не сундук
	detMob = Npc_GetDetectedMob(other);
	if((Hlp_StrCmp(detMob,"CHESTBIG") == FALSE) && (Hlp_StrCmp(detMob,"CHESTSMALL") == FALSE))
	{
		return;
	};
	
	// я не хочу наказывать вора,
	if(!C_WantToAttackThief(self,other))
	{
		// но если это потому, что я несу охрану входа,
		if(C_NpcIsGateGuard(self))
		{
			// то запомнить, что ГГ что-то украл
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		return;
	};
	
	// В других случаях ----------------------------------------------------------
	
	// немедленно напасть на ГГ за то, что влез в чужие вещи	
	B_Attack(self,other,AR_UseMob,0);
};

