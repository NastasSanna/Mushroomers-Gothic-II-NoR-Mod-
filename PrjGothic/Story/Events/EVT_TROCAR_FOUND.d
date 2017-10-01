
var int EVT_TROCAR_FOUND_Once;
func void EVT_TROCAR_FOUND()
{
	//MEM_Debug("EVT_TROCAR_FOUND");
	if (hero.guild < GIL_SEPERATOR_HUM)	{	//если ГГ превратился - не надо слезать
		if (!EVT_TROCAR_FOUND_Once)	{
			Wld_InsertNpc(OUT_1230_Trocar,"FP_TROCAR_INSERT");
			AI_Teleport(self,"FP_TROCAR_INSERT");	//иначе не появляется в нужной точке
			self.aivar[AIV_Behaviour] = BEHAV_Hidden;
			EVT_TROCAR_FOUND_Once = TRUE;
		};
	};
};
