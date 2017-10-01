/**************************************************************************

                    ГЕРОЛЬД ЗАЧИТЫВАЕТ ОБЪЯВЛЕНИЕ
  
   Зачитывание объявлений - раз в 70 сек. Пока ГГ занят, герольд будет
молчать.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
  Когда герольд молчит, он обозревает окрестности.
  
  Связанные файлы:
 функции распорядка дня		AI\Human\TA.d
 сама читка объявления		Story\B_AssignAmbientInfos\B_Announce_Herold.d

  Смысл AIV_TAPOSITION:
   ISINPOS	- герольд молчит
   NOTINPOS	- зачитывает объявление

***************************************************************************/


// НАЧАЛО =================================================================

func void ZS_Announce_Herold()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

// ЦИКЛ ====================================================================

func int ZS_Announce_Herold_loop()
{
	
	if((Npc_GetStateTime(self) >= 70) && (hero.aivar[AIV_INVINCIBLE] == FALSE))
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		B_Announce_Herold();
		Npc_SetStateTime(self,0);
	};
	
	
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

// ЗАВЕРШЕНИЕ ================================================================

func void ZS_Announce_Herold_end()
{
};

