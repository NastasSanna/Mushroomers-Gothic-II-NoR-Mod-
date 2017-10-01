/**************************************************************************

						ВОСПРИЯТИЕ ТИХОГО ЗВУКА
 
  Персонаж self (я) услышал шаги other (он). Реакция только на ГГ.

  B_AssessQuietSound() вызывается для только обработки восприятия 
PERC_ASSESSQUIETSOUND. Вызывает обработку восприятия входа в помещение.

  Обычная реакция: начать следить за ГГ.

  Сюжетные особенности: если ГГ переодет в бандита, то бандиты не обращают
на него внимания.

***************************************************************************/


func void B_AssessQuietSound()
{
	// НЕ обращать внимания, если ------------------------------------------
	
	// его вообще нет
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};
	
	// он слишком высоко (или низко)
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// мы в помещении, но он на другом этаже (проверка расстояния по вертикали)
	if((C_GetPlayerPortalGuild() != GIL_OUTDOOR) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	
	// я среагировал на вход в помещение
	if(B_AssessEnterRoom())
	{
		return;
	};
	
	//NS - я в помещении, а он (ГГ) - нет
	if((C_GetPlayerPortalGuild() == GIL_OUTDOOR) && (C_GetNpcPortalGuild(self) != GIL_OUTDOOR))
	{
		return;
	};
	
	// я охраняю проход или прячусь
	if(C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Behaviour], BEHAV_Hidden))
	{
		return;
	};
	
	//если я целюсь, но не вижу его
	//if (Npc_IsInState(self,ZS_AimTo))	{
	//	return;
	//};
	if (C_NpcIs(self,OUT_1210_Grimbald) && !self.aivar[AIV_TalkedToPlayer])	{
		AI_StartState(self,ZS_AimTo,1,"");
		return;
	};

	// мы не враги и у меня нет важных сообщений для ГГ
	if((C_NpcGetAttitude(self,other) != ATT_HOSTILE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		return;
	};
	
	// я не вижу источник звука
	if(Npc_CanSeeSource(self))
	{
		return;
	};
	
	// Во всех остальных случаях --------------------------------------------------
	
	// прекратить другие действия
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// начать следить за ГГ
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

