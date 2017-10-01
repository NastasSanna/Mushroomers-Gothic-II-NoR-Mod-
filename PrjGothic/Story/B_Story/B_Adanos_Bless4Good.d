

//если сделать что-то хорошее, то бог-покровитель Аданос вознаградит
func void B_Adanos_Bless4Good()
{
	if (PATRONGOD == PATRONGOD_Adanos)	{
		Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
		PrintScreen(PRINT_GOD_Adanos_Bless4Good,-1,-1,FONT_Screen,3);
		B_GivePlayerXP(XP_Adanos_4Good);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};