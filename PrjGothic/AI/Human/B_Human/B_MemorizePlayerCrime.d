/**************************************************************************

						ЗАПОМНИТЬ ПРЕСТУПЛЕНИЕ ГГ
  
  B_MemorizePlayerCrime	(slf,	taeter,	crime)
  Персонаж slf (я) запоминает преступление crime нарушителя taeter.
  
  Ищущие не запоминают преступлений ГГ.
   
***************************************************************************/


func void B_MemorizePlayerCrime(var C_Npc slf,var C_Npc taeter,var int crime)
{
	// НЕ запоминать преступление, если ----------------------------------
	
	// нарушитель - не ГГ
	if(!Npc_IsPlayer(taeter))
	{
		return;
	};
	// нарушитель = ГГ -----v
	
	// я ищущий
	if(slf.guild == GIL_DMT)
	{
		return;
	};
	
	// Mushroomers ---------------------
	//туманник вызывает провалы памяти (если npc его съест)
	if (self.aivar[AIV_Timelapse_EndTime] >= Wld_GetFullTime())	{
		return;
	};
	
	// --------------------------------------------------------------------
	
	// если это более тяжкое преступление, чем то, которое я видел раньше
	/* или я еще не видел преступлений ГГ: B_GetPlayerCrime = CRIME_NONE */
	if(crime > B_GetPlayerCrime(slf))
	{
		// уменьшить счетчик для предыдущего преступления 
		/* если преступления не было, то просто ничего не сделает */
		B_DeletePetzCrime(slf);
		// увеличить счетчик для нового преступления
		B_AddPetzCrime(slf,crime);
		// запомнить тип преступления, дату его совершения и текущую репутацию ГГ
		slf.aivar[AIV_NpcSawPlayerCommit] = crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] = Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] = B_GetCurrentAbsolutionLevel(slf);
	};
};

