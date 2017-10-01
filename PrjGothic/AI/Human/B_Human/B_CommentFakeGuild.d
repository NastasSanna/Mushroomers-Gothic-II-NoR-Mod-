/**************************************************************************

					ПРОКОММЕНТИРОВАТЬ ЛОЖНУЮ ГИЛЬДИЮ

  ZS_CommentFakeGuild	()
  Персонаж self (я) отчитывает other (ГГ) за неподобающий наряд.

  Проверку ложной гильдии нужно делать до вызова данной функции 
(исп. C_PlayerHasFakeGuild). Также предполагается, что ГГ в соответствующей
гильдии.

***************************************************************************/


func void ZS_CommentFakeGuild()
{
	// установить минимальный набор восприятий
	Perception_Set_Minimal();
	// остановиться
	AI_Standup(self);
	
	// если я не сижу
	if(!C_BodyStateContains(self,BS_SIT))
	{
		// повернуться к ГГ
		B_TurnToNpc(self,other);
	};
	// если он не сидит
	if(!C_BodyStateContains(other,BS_SIT))
	{
		// ГГ поворачивается ко мне
		B_TurnToNpc(other,self);
		// и если мы слишком близко
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			// он делает шаг назад
			AI_Dodge(other);
		};
	};
	
	// Выдать нужный комментарий,
	
	// если ГГ вообще одет
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL))		// для паладинов и ополчения
		{
			B_Say(self,other,"$ADDON_WRONGARMOR_MIL");
		}
		else if((self.guild == GIL_NOV) || (self.guild == GIL_KDF))	// для послушников и магов огня
		{
			B_Say(self,other,"$ADDON_WRONGARMOR_KDF");
		}
		else if(self.guild == GIL_SLD)	// для наемников и охотников на драконов
		{
			B_Say(self,other,"$ADDON_WRONGARMOR_SLD");
		}
		else // для всех остальных //PB: GIL_NONE
		{
			B_Say(self,other,"$ADDON_WRONGARMOR"); 
		};
	}
	// если ГГ не одет, а я бандит
	else if(self.guild == GIL_BDT)
	{
		B_Say(self,other,"$ADDON_NOARMOR_BDT"); // у тебя нет доспехов
	};
};

