/**************************************************************************

						ВОСПРИЯТИЕ ПРЕДУПРЕЖДЕНИЯ
 
  Персонаж self (я) заметил предупреждение other (его) перед атакой на
victim (жертву). Предположительно, жертва - ГГ.
  
  B_AssessWarn() вызывается только для обработки восприятия PERC_ASSESSWARN.

  Обычная реакция: начать следить за ГГ.
  
***************************************************************************/


func void B_AssessWarn()
{
	// НЕ реагировать на предупреждение, если ------------------------------
	
	// я сам - жертва
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	{
		return;
	};
	
	// я уже среагировал на обнаженное оружие или начал следить за ГГ
	if(Npc_IsInState(self,ZS_ReactToWeapon) || Npc_IsInState(self,ZS_ObservePlayer))
	{
		return;
	};
	
	// напавший не человек
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// я стою на посту
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	
	// В других случаях ----------------------------------------------------------
	
	// отменить все другие действия и восприятия
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// начать следить за ГГ
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

