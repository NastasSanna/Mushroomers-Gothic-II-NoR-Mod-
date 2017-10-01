/**************************************************************************

							ВАТРАС ПРОПОВЕДУЕТ
  
  Читать проповедь. Привязка к конкретному оратору в B_Preach_Vatras.
  Набор восприятий - обычный.
  Режим перемещения - ходьба.
   
  Вызывает B_Preach_Vatras для чтения самого текста.
 
***************************************************************************/

func void ZS_Preach_Vatras()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
	AI_AlignToWP(self);
};

func int ZS_Preach_Vatras_loop()
{
	if(Npc_GetStateTime(self) >= 14)
	{
		B_Preach_Vatras(self.aivar[AIV_TAPOSITION]);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Preach_Vatras_end()
{
};

