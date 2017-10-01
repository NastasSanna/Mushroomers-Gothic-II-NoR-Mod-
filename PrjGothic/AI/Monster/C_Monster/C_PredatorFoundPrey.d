/**************************************************************************

					ХИЩНИК НАШЕЛ ДОБЫЧУ
 
  C_PredatorFoundPrey	(slf,	oth)
  Охотится ли монстр slf (я) на oth (он): TRUE - охотится,
FALSE - нет. Проверка гильдий.
  
***************************************************************************/

func int C_PredatorFoundPrey(var C_Npc slf,var C_Npc oth)
{
	// волки и варги охотятся на овец, крыс, кротокрысов и падальщиков
	if((slf.guild == GIL_WOLF) && (slf.aivar[AIV_MM_REAL_ID] != ID_Keiler))
	{
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_OrcBiter))
		{
			return TRUE;
		};
	};
	// шныги охотятся на гоблинов
	if(slf.guild == GIL_LURKER)
	{
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	// снепперы охотятся на людей, гоблинов, овец, крыс, кротокрысов и падальщиков
	if(slf.guild == GIL_SNAPPER)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_OrcBiter))
		{
			return TRUE;
		};
	};
	// мракорисы охотятся на людей, орков, овец, крыс, кротокрысов, падальщиков
	if(slf.guild == GIL_SHADOWBEAST)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if((oth.guild == GIL_SCAVENGER) && (oth.aivar[AIV_MM_REAL_ID] != ID_OrcBiter))
		{
			return TRUE;
		};
	};
	// все остальные не охотятся
	return FALSE;
};

