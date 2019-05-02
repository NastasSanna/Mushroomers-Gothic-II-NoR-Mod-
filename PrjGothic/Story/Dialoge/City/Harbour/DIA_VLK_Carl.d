
//AMBIENT
instance DIA_Carl_EXIT(DIA_Proto_End)
{
	npc = VLK_461_Carl;
};

func int DIA_Carl_IsProperTime()
{
	if (Wld_IsTime(20,0,5,0))	{
		AI_Output(self,other,"DIA_Carl_IsProperTime_05_00");	//Конечно. Но только днем.
		AI_Output(self,other,"DIA_Carl_IsProperTime_05_01");	//Тебе бы понравилось, если бы твой сосед-кузнец работал по ночам?
		return FALSE;
	};
	return TRUE;
};

///////////////////////////////////////// ЭРОЛ /////////////////////////////////////////////

//===================================================
instance DIA_Carl_Erol_Pickaxe(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_Erol_Pickaxe_Cond;
	information = DIA_Carl_Erol_Pickaxe_Info;
	description = "Ты можешь выковать кирку?";
	permanent = TRUE;
};
func int DIA_Carl_Erol_Pickaxe_Cond()
{
	if (C_HeroIs_Erol()
		&& MIS_Erol_Plates_GoldGiven
		&& !MIS_Erol_Plates_SilverFound && !Npc_HasItems(other,ItMw_2H_Axe_L_01))	{
		return TRUE;
	};
};
func void DIA_Carl_Erol_Pickaxe_Info()
{
		AI_Output(other,self,"DIA_Carl_Erol_Pickaxe_10_00");	//Ты можешь выковать кирку?
	if (DIA_Carl_IsProperTime())	{
		AI_Output(self,other,"DIA_Carl_Erol_Pickaxe_05_01");	//Могу, за 300 золотых.
		Info_ClearChoices(DIA_Carl_Erol_Pickaxe);
		Info_AddChoice(DIA_Carl_Erol_Pickaxe,"В другой раз.",DIA_Carl_Erol_Pickaxe_Later);
		if (Npc_HasItems(other,ItMi_Gold) >= 300)	{
			Info_AddChoice(DIA_Carl_Erol_Pickaxe,"По рукам (300 зол.)",DIA_Carl_Erol_Pickaxe_DoIt);
		};
	};
};
func void DIA_Carl_Erol_Pickaxe_Later()
{
		AI_Output(other,self,"DIA_Carl_Erol_Pickaxe_Later_10_00");	//В другой раз.
	Info_ClearChoices(DIA_Carl_Erol_Pickaxe);
};
func void DIA_Carl_Erol_Pickaxe_DoIt()
{
		AI_Output(other,self,"DIA_Carl_Erol_Pickaxe_DoIt_10_00");	//По рукам.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Carl_Erol_Pickaxe_DoIt_05_01");	//Через пару часов будет готово.
	Info_ClearChoices(DIA_Carl_Erol_Pickaxe);
	Info_AddChoice(DIA_Carl_Erol_Pickaxe,"(уйти)",DIA_Carl_Erol_Pickaxe_Go);
	Info_AddChoice(DIA_Carl_Erol_Pickaxe,"(ждать)",DIA_Carl_Erol_Pickaxe_Wait);
	Carl_PickAxeReady_Time = Wld_GetFullTime() + 2*60;
};
func void DIA_Carl_Erol_Pickaxe_Go()
{
	AI_StopProcessInfos(self);
};
func void DIA_Carl_Erol_Pickaxe_Wait()
{
	AI_StopProcessInfos(self);
	Wait_AfterDia_H = 2;
	Wait_AfterDia_M = 5;
};
//===================================================
instance DIA_Carl_Erol_PickaxeReady(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Erol_PickaxeReady_Cond;
	information = DIA_Carl_Erol_PickaxeReady_Info;
	important = TRUE;
};
func int DIA_Carl_Erol_PickaxeReady_Cond()
{
	if (C_HeroIs_Erol()
		&& (Carl_PickAxeReady_Time > 0) && (Carl_PickAxeReady_Time < Wld_GetFullTime()))	{
		return TRUE;
	};
};
func void DIA_Carl_Erol_PickaxeReady_Info()
{
	AI_Output(self,other,"DIA_Carl_Erol_PickaxeReady_05_01");	//Готово! Держи свою кирку.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
};

///////////////////////////////////////// ВСЕ /////////////////////////////////////////////


//===================================================
instance DIA_Carl_SharpKnife(C_Info)
{
	npc = VLK_461_Carl;			nr = 3;
	condition = DIA_Carl_SharpKnife_Cond;
	information = DIA_Carl_SharpKnife_Info;
	description = "Ты можешь заточить нож?";
	permanent = TRUE;
};
func int DIA_Carl_SharpKnife_Cond()
{
	if (Npc_HasItems(other,ItMW_MR_1h_KitchenKnife_Unsharpen))	{
		return TRUE;
	};
};
func void DIA_Carl_SharpKnife_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_SharpKnife_03_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_SharpKnife_07_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_SharpKnife_10_00");	//Ты можешь заточить нож?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_SharpKnife_14_00");	//Ты можешь заточить нож?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_SharpKnife_16_00");	//Ты можешь заточить нож?
	};
	if (DIA_Carl_IsProperTime())	{
		AI_Output(self,other,"DIA_Carl_SharpKnife_05_01");	//Конечно. 10 золотых.
		Info_ClearChoices(DIA_Carl_SharpKnife);
		Info_AddChoice(DIA_Carl_SharpKnife,"В другой раз.",DIA_Carl_SharpKnife_Back);
		if (C_NpcHasGold(other,10))	{
			Info_AddChoice(DIA_Carl_SharpKnife,"Держи деньги. (10 зол.)",DIA_Carl_SharpKnife_DoIt);
		};
	};
};
func void DIA_Carl_SharpKnife_Back()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_SharpKnife_Back_03_00");	//В другой раз.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_SharpKnife_Back_07_00");	//В другой раз.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_SharpKnife_Back_10_00");	//В другой раз.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_SharpKnife_Back_14_00");	//В другой раз.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_SharpKnife_Back_16_00");	//В другой раз.
	};
	Info_ClearChoices(DIA_Carl_SharpKnife);
};
func void DIA_Carl_SharpKnife_DoIt()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_SharpKnife_DoIt_03_00");	//Держи деньги.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_SharpKnife_DoIt_07_00");	//Держи деньги.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_SharpKnife_DoIt_10_00");	//Держи деньги.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_SharpKnife_DoIt_14_00");	//Держи деньги.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_SharpKnife_DoIt_16_00");	//Держи деньги.
	};
	//B_GiveGold(other,self,10);
	//B_GiveInvItems(other,self,ItMW_MR_1h_KitchenKnife_Unsharpen,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 10;
	ItemTrans_items[1] = ItMW_MR_1h_KitchenKnife_Unsharpen;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(other,self);
	AI_Output(self,other,"DIA_Carl_SharpKnife_DoIt_05_01");	//Сейчас.
	if (!C_NpcIsDown(VLK_453_Buerger))	{
		AI_TurnToNpc(self,VLK_453_Buerger);
		AI_Output(self,other,"DIA_Carl_SharpKnife_DoIt_05_02");	//Мориц, пошевеливайся.
		AI_UseMob(VLK_453_Buerger,"BSSHARP",1);
		AI_Wait(self,2.5);
		AI_UseMob(VLK_453_Buerger,"BSSHARP",-1);
		AI_TurnToNpc(self,other);
	}
	else	{
		AI_GotoWP(self,"NW_CITY_POOR_SMITH_SHARP");
		AI_UseMob(self,"BSSHARP",1);
		AI_Wait(self,2.5);
		AI_UseMob(self,"BSSHARP",-1);
		AI_GotoNpc(self,other);
	};
	AI_Output(self,other,"DIA_Carl_SharpKnife_DoIt_05_03");	//Готово.	
	B_GiveInvItems(self,other,ItMW_MR_1h_KitchenKnife,1);
	Info_ClearChoices(DIA_Carl_SharpKnife);
};

//===================================================
instance DIA_Carl_CanRepairHummer(C_Info)
{
	npc = VLK_461_Carl;			nr = 4;
	condition = DIA_Carl_CanRepairHummer_Cond;
	information = DIA_Carl_CanRepairHummer_Info;
	description = "Ты можешь починить этот молоток?";
};
func int DIA_Carl_CanRepairHummer_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken))	{
		return TRUE;
	};
};
func void DIA_Carl_CanRepairHummer_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_03_00");	//Ты можешь починить этот молоток?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_07_00");	//Ты можешь починить этот молоток?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_10_00");	//Ты можешь починить этот молоток?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_14_00");	//Ты можешь починить этот молоток?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_16_00");	//Ты можешь починить этот молоток?
	};
	AI_Output(self,other,"DIA_Carl_CanRepairHummer_05_01");	//Конечно. Здесь всего лишь нужно заменить рукоять.
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_03_02");	//Только мне нужно, чтобы он стал точно таким, как раньше.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_07_02");	//Только мне нужно, чтобы он стал точно таким, как раньше.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_10_02");	//Только мне нужно, чтобы он стал точно таким, как раньше.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_14_02");	//Только мне нужно, чтобы он стал точно таким, как раньше.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_CanRepairHummer_16_02");	//Только мне нужно, чтобы он стал точно таким, как раньше.
	};
	AI_Output(self,other,"DIA_Carl_CanRepairHummer_05_03");	//Хмм... Тогда тебе придется найти подходящую древесину.
	AI_Output(self,other,"DIA_Carl_CanRepairHummer_05_04");	//У меня есть ясень и дуб, но это определенно не они.
	AI_Output(self,other,"DIA_Carl_CanRepairHummer_05_05");	//Если хочешь узнать наверняка, спроси у плотника Торбена.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerСarl);
	if (Npc_IsDead(VLK_462_Thorben))	{
		B_CloseLogOnDeath(VLK_462_Thorben);
	};
};

//===================================================
instance DIA_Carl_RepairHummer(C_Info)
{
	npc = VLK_461_Carl;			nr = 5;
	condition = DIA_Carl_RepairHummer_Cond;
	information = DIA_Carl_RepairHummer_Info;
	description = "Теперь ты починишь молоток?";
	permanent = TRUE;
};
func int DIA_Carl_RepairHummer_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken) && Npc_HasItems(other,ItMi_YewPiece))	{
		return TRUE;
	};
};
func void DIA_Carl_RepairHummer_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_RepairHummer_03_00");	//Я достал древесину для рукояти. Теперь ты починишь молоток?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_RepairHummer_07_00");	//Я достал древесину для рукояти. Теперь ты починишь молоток?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_RepairHummer_10_00");	//Я достал древесину для рукояти. Теперь ты починишь молоток?
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_RepairHummer_14_00");	//Я достал древесину для рукояти. Теперь ты починишь молоток?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_RepairHummer_16_00");	//Я достала древесину для рукояти. Теперь ты починишь молоток?
	};
	if (DIA_Carl_IsProperTime())	{
		AI_Output(self,other,"DIA_Carl_RepairHummer_05_01");	//Да, конечно. За работу возьму 15 золотых.
		Info_ClearChoices(DIA_Carl_RepairHummer);
		Info_AddChoice(DIA_Carl_RepairHummer,"В другой раз.",DIA_Carl_RepairHummer_Back);
		if (C_NpcHasGold(other,15))	{
			Info_AddChoice(DIA_Carl_RepairHummer,"Держи. (15 зол.)",DIA_Carl_RepairHummer_DoIt);
		};
	};
};
func void DIA_Carl_RepairHummer_Back()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_RepairHummer_Back_03_00");	//В другой раз.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_RepairHummer_Back_07_00");	//В другой раз.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_RepairHummer_Back_10_00");	//В другой раз.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_RepairHummer_Back_14_00");	//В другой раз.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_RepairHummer_Back_16_00");	//В другой раз.
	};
	Info_ClearChoices(DIA_Carl_RepairHummer);
};
func void DIA_Carl_RepairHummer_DoIt()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Carl_RepairHummer_DoIt_03_00");	//Держи.
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Carl_RepairHummer_DoIt_07_00");	//Держи.
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Carl_RepairHummer_DoIt_10_00");	//Держи.
	} else if (hero.voice == 14)	{	//Тилл
		AI_Output(other,self,"DIA_Carl_RepairHummer_DoIt_14_00");	//Держи.
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Carl_RepairHummer_DoIt_16_00");	//Держи.
	};
	//B_GiveGold(other,self,15);
	//B_GiveInvItems(other,self,ItMi_FellanHammer_Broken,1);
	//B_GiveInvItems(other,self,ItMi_YewPiece,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 15;
	ItemTrans_items[1] = ItMi_FellanHammer_Broken;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItMi_YewPiece;
	ItemTrans_amount[2] = 1;
	B_ItemsTransaction(other,self);
	Npc_RemoveInvItems(self,ItMi_YewPiece,1);
	AI_Output(self,other,"DIA_Carl_RepairHummer_DoIt_05_01");	//Подожди минутку, я быстро.
	//кует
	AI_StopLookAt(self);
	AI_GotoWP(self,"NW_CITY_POOR_SMITH_01");
	AI_UseMob(self,"BSANVIL",1);
	AI_Wait(self,3.2);
	AI_UseMob(self,"BSANVIL",-1);
	AI_GotoNpc(self,other);
	AI_TurnToNpc(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Carl_RepairHummer_DoIt_05_02");	//Получи свой молоток. Как новенький.
	B_GiveInvItems(self,other,ItMi_FellanHammer,1);
	Info_ClearChoices(DIA_Carl_RepairHummer);
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerRepaired);
	B_GivePlayerXP(XP_Fellan_HammerRepaired);
};


//===================================================
instance DIA_Carl_MR_Perm(C_Info)
{
	npc = VLK_461_Carl;			nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Carl_MR_Perm_Info;
	description = "Какие новости?";
	permanent = TRUE;
};
func void DIA_Carl_MR_Perm_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_03_00");	//Какие новости?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_07_00");	//Какие новости?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_10_00");	//Какие новости?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_14_00");	//Какие новости?
	} else	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_16_00");	//Какие новости?
	};
	var int rnd;	rnd = Hlp_Random(100);
	if (rnd < 50)	{
		AI_Output(self,other,"DIA_Karl_News_23_01");	    //Говорят, на материке дела все хуже. Не приведи Аданос, война докатится и до нас.
	}
	else {
		AI_Output(self,other,"DIA_Karl_News_23_02");	    //В порту стало слишком тихо. Раньше тут был такой гвалт, что я собственного молота не слышал.
	};
};

