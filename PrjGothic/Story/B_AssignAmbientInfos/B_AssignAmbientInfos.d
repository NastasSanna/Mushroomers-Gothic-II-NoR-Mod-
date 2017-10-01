
func void B_AssignAmbientInfos(var C_Npc slf)
{
	if(slf.guild == GIL_VLK)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_VLK_1(slf);
			};
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_VLK_6(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_VLK_8(slf);
			};
			if(slf.voice == 16)
			{
				B_AssignAmbientInfos_VLK_16(slf);
			};
			if(slf.voice == 17)
			{
				B_AssignAmbientInfos_VLK_17(slf);
			};
		};
	};
	if(slf.guild == GIL_MIL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_MIL_6(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_MIL_7(slf);
			};
		};
	};
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_BAU2))
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if (slf.voice == 1)	{
				B_AssignAmbientInfos_BAU_1(slf);
			}
			else if(slf.voice == 11)	{
				B_AssignAmbientInfos_BAU_11(slf);
			}
			else if(slf.voice == 13)	{
				B_AssignAmbientInfos_BAU_13(slf);
			}
			else	{
				B_AssignAmbientInfos_BAU_16(slf);
			};
		};
	};
	if(slf.guild == GIL_NOV)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) && (B_GetGreatestPetzCrime(slf) == 0))
		{
			if(slf.voice == 11)
			{
				B_AssignAmbientInfos_NOV_11(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_NOV_8(slf);
			};
		};
	};
	if(slf.guild == GIL_KDF)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) && (B_GetGreatestPetzCrime(slf) == 0) && !HasFlags(slf.aivar[AIV_StoryFlags], STORY_OutOfCamp))
		{
			B_AssignAmbientInfos_KDF(slf);
		};
	};
	if(slf.guild == GIL_OUT)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_OUT_1(slf);
			};
			if(slf.voice == 8)
			{
				B_AssignAmbientInfos_OUT_7(slf);
			};
			if(slf.voice == 13)
			{
				B_AssignAmbientInfos_OUT_13(slf);
			};
		};
	};
	
};

