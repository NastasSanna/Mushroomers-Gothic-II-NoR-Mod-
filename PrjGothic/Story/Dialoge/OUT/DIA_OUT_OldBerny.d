
instance DIA_OUT_OldBerny(C_INFO)
{
	npc = OUT_1214_OldBerny;	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_OUT_OldBerny_MR_Hello_info;
	important = TRUE;
};
func void DIA_OUT_OldBerny_MR_Hello_info()
{
	MIS_Sarah_OldFriends_BernyMet = TRUE;
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_01");	//Аах...
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_02");	//Берни? Берни, это ты!
	B_GivePlayerXP(XP_Sarah_MetBerny);
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_03");	//(еле слышно) Малышка Сара? Ты пришла проведать меня?
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_04");	//Да, я... Оох, Берни, прости меня! (всхлип)
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_05");	//Я так и не пришла повидаться с тобой. Я так виновата!
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_06");	//Тише, тише. Не плачь, деточка. Со мной все хорошо, просто мой срок вышел.
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_07");	//А твоя жизнь еще вся впереди. Не упускай ее.
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_08");	//Мне пора уходить. Прощай...
	B_StartOtherRoutine(self,"REMOVE");
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayBeliar2);
	AI_StopProcessInfos(self);
	B_GiveAchievement_Sarah_GhostWhisper();
};
