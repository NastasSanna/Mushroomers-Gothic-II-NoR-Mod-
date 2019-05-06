
instance DIA_FireDragon_EXIT(DIA_Proto_End)
{
	npc = PC_FireDragon;
};

//=====================================================
instance DIA_FireDragon_Photo(C_INFO)
{
	npc = PC_FireDragon;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_FireDragon_Photo_info;
	important = TRUE;
};

func void DIA_FireDragon_Photo_info()
{
	AI_Output(self,other,"DIA_FireDragon_Photo_1");	 //Привет!
	AI_Output(self,other,"DIA_FireDragon_Photo_2");	 //Я наконец обработал твою фотографию, которую сделал недавно.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_FireDragon_Photo_3m");	 //Да-да, не удивляйся, что не видел, как я тебя снимал.
	}
	else	{
		AI_Output(self,other,"DIA_FireDragon_Photo_3f");	 //Да-да, не удивляйся, что не видела, как я тебя снимал.
	};
	AI_Output(self,other,"DIA_FireDragon_Photo_4");	 //У меня в арсенале много трюков, помогающих оставаться незаметным, хех-хе. 
	AI_Output(self,other,"DIA_FireDragon_Photo_5");	 //Вот, держи. Удачи!
	B_GiveInvItems(self,other,ItWr_HeroPortrait_FromFireDragon,1);
	AI_StopProcessInfos(self);
};