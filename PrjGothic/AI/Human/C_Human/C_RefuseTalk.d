/**************************************************************************

							ОТКАЗ ОТ ДИАЛОГА

  Откажется ли slf разговаривать с oth (ГГ): TRUE - откажется, FALSE - нет.
  
  Для отказов из-за ложной гильдии, охраны прохода и Лотара.

//NS: Бессмертные говорят с переодетым ГГ! Они его не боятся!
(Все остальные проверки в C_PlayerHasFakeGuild).
 
***************************************************************************/


func int C_RefuseTalk(var C_Npc slf,var C_Npc oth)
{
	// установлен счетчик отказа от диалога по времени, и я стою на охране входа, и еще не давал предупреждений ГГ
	if((Npc_RefuseTalk(slf) == TRUE) && C_NpcIsGateGuard(slf) && (slf.aivar[AIV_Guardpassage_Status] == GP_NONE))
	{
		return TRUE;	// не разговаривать
	};
	
	// есть отказ от диалога и я иду спать
	if((Npc_RefuseTalk(slf) == TRUE)
		&& (Npc_IsInState(slf,ZS_GotoBed) || Npc_IsInState(slf,ZS_GotoBed_Deep)
			|| Npc_IsInState(slf,ZS_Sleep) || Npc_IsInState(slf,ZS_Sleep_Deep)))
	{
		return TRUE;	// не разговаривать
	};	
	
	// ГГ в кого-то переодет, а я не бессмертен
	if(C_PlayerHasFakeGuild(slf,oth) && (!HasFlags(slf.flags, NPC_FLAG_IMMORTAL)))
	{
		return TRUE;	// не разговаривать
	};	
	
	// В остальных случаях - НЕ ОТКАЗЫВАТЬСЯ
	return FALSE;
};

