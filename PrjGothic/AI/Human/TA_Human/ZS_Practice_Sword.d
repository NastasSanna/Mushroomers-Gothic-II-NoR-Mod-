/**************************************************************************

						ПРАКТИКОВАТЬСЯ С МЕЧОМ
  
  Если нет оружия - будет выдано подходящее.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.

***************************************************************************/

func void ZS_Practice_Sword()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	AI_EquipBestMeleeWeapon(self);
	B_MM_DeSynchronize();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Practice_Sword_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_HasEquippedMeleeWeapon(self))
		{
			B_GiveProperWeapon(self);
			AI_EquipBestMeleeWeapon(self);
		};
		AI_ReadyMeleeWeapon(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	B_StopLookAt(self);
	AI_PlayAni(self,"T_1HSFREE");
	NS_GoAndAlignToMyWP(self);
	return LOOP_CONTINUE;
};

func void ZS_Practice_Sword_End()
{
	AI_Standup(self);
	AI_RemoveWeapon(self);
};


