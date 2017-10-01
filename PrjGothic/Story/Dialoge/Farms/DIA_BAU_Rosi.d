
instance DIA_Rosi_EXIT(DIA_Proto_End)
{
	npc = BAU_936_Rosi;
};

/////////////////////////////////////// ТИЛЛ /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Till(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 1;
	condition = DIA_Rosi_Start_Till_Cond;
	information = DIA_Rosi_Start_Till_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Till_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Till_Info()
{
	START_DIA_Finished = TRUE;
	var C_NPC Rosi;		Rosi = Hlp_GetNpc(BAU_936_Rosi);
	var C_NPC Sekob;	Sekob = Hlp_GetNpc(BAU_930_Sekob);
	Npc_ClearAIQueue(Sekob);
	AI_StandUpQuick(Sekob);
	AI_TurnToNpc(Sekob,other);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	Npc_SetTarget(Sekob,hero);
	AI_StartState(Sekob,ZS_Talk,0,"");
	
	TRIA_Invite(Sekob);
	TRIA_Start();
	
	TRIA_Next(Rosi);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_00");	//Тилл, поди сюда, оболтус. 
		AI_SetWalkmode(other, NPC_WALK);
		AI_TurnToNpc(other, self);
		AI_GotoNpc(other,self);
		AI_Output(other,self,"DIA_Rosi_Start_Till_14_01");	//Чего, мам?
			TRIA_Next(Sekob);
			AI_TurnToNpc(self,other);
			AI_Wait(hero,0.5);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_03");	//Сначала покажи покупки и верни оставшиеся деньги.
	TRIA_Next(Rosi);
	AI_TurnToNpc(self,Sekob);
		AI_Snd_Play3D(self,other,"Geldbeutel");
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_04");	//Вот, вот. Все до монетки.
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_05");	//Тилл, городской алхимик Константино объявил конкурс! По сбору грибов.
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_06");	//Каждый, кто в течение этой недели принесет ему грибы, будет щедро вознагражден. А победитель получит какой-то очень ценный приз...
			TRIA_Next(Sekob);
			AI_TurnToNpc(self,Sekob);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_07");	//Что, говоришь? Щедро вознагражден?.. Ценный приз?..
			AI_TurnToNpc(other,self);
			AI_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_08");	//Так, обормот. Бери ноги в руки и шагом марш в лес. Без грибов можешь не возвращаться.
		AI_Output(other,self,"DIA_Rosi_Start_Till_14_09");	//Но...
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_10");	//Никаких но! Но можешь взять что-нибудь из оружия и припасов. Но не смей прикасаться к деньгам! Ты их не заработал.
		B_GiveInvItems(self,other,ItKe_Chest_Till,1);
	
	TRIA_Finish();
	B_StartOtherRoutine(Rosi,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Rosi_MR_Perm_Till(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 2;
	condition = DIA_Rosi_MR_Perm_Till_Cond;
	information = DIA_Rosi_MR_Perm_Till_Info;
	description = "Мам, я есть хочу.";
	permanent = TRUE;
};
func int DIA_Rosi_MR_Perm_Till_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};

var int DIA_Rosi_MR_Perm_Till_Day;
var int DIA_Rosi_MR_Perm_Till_Night;
func void DIA_Rosi_MR_Perm_Till_Info()
{
	AI_Output(other,self,"DIA_Rosi_MR_Perm_Till_14_00");	//Мам, я есть хочу.
	if (Wld_IsTime(6,0,12,0))	{
		AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_01");	//О Иннос, ты всегда хочешь есть. Потерпи до обеда. 
	}
	else if (Wld_IsTime(12,0,22,0))	{
		if (DIA_Rosi_MR_Perm_Till_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_02");	//Имей совесть, Тилл. Ты сегодня уже обедал. Или ты думаешь, что похлебка с неба падает?
		}
		else 		{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_03");	//Вот, держи.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			DIA_Rosi_MR_Perm_Till_Day = Wld_GetDay() + 1;
		};
	}
	else	{
		if (DIA_Rosi_MR_Perm_Till_Night > Wld_GetDay_Shifted(6))	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_04");	//Иди спать, обжора!
		}
		else	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_05");	//Тилл, сейчас середина ночи! Вот, поешь хлеба с молоком и ложись спать! 
			//B_GiveInvItems(self,other,ItFo_Bread,1);
			//B_GiveInvItems(self,other,ItFo_Milk,1);
			ItemTrans_items[0] = ItFo_Bread;
			ItemTrans_amount[0] = 1;
			ItemTrans_items[1] = ItFo_Milk;
			ItemTrans_amount[1] = 1;
			B_ItemsTransaction(self,other);
			DIA_Rosi_MR_Perm_Till_Night = Wld_GetDay_Shifted(6) + 1;
		};
	};
};

/////////////////////////////////////// ЕЛЕНА /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Elena(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 10;
	condition = DIA_Rosi_Start_Elena_Cond;
	information = DIA_Rosi_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Elena_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Elena_Info()
{
	AI_Output(self,other,"DIA_Rosi_Start_Elena_17_00");	//Елена, рада тебя видеть. Ты так выросла, похорошела.
};

//===================================================
instance DIA_Rosi_LookGood_Elena(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 11;
	condition = DIA_Rosi_LookGood_Elena_Cond;
	information = DIA_Rosi_LookGood_Elena_Info;
	description = "Ты тоже хорошо выглядишь.";
};
func int DIA_Rosi_LookGood_Elena_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_LookGood_Elena_Info()
{
		AI_Output(other,self,"DIA_Rosi_LookGood_Elena_16_00");	//Ты тоже хорошо выглядишь.
	AI_Output(self,other,"DIA_Rosi_LookGood_Elena_17_01");	//Ох, где уж там. Но все равно спасибо.
};

/////////////////////////////////////// ОСТАЛЬНЫЕ /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 20;
	condition = DIA_Rosi_Start_Others_Cond;
	information = DIA_Rosi_Start_Others_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Others_Info()
{
	AI_Output(self,other,"DIA_Rosi_Start_Others_17_00");	//Чего ты хочешь? Если у тебя какое-то дело, обратись к моему мужу.
};

//===================================================
instance DIA_Rosi_MR_Perm(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 21;
	condition = DIA_Rosi_MR_Perm_Cond;
	information = DIA_Rosi_MR_Perm_Info;
	description = "Как твои дела?";
	permanent = TRUE;
};
func int DIA_Rosi_MR_Perm_Cond()
{
	if (!C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Rosi_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_03_00");	//Как твои дела?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_07_00");	//Как твои дела?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_10_00");	//Как твои дела?
	} else	{							//Сара/Elena
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_16_00");	//Как твои дела?
	};
	AI_Output(self,other,"DIA_Rosi_MR_Perm_17_01");	//Живем потихоньку...
};

//===================================================
instance DIA_Rosi_MRTrade_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 22;
	condition = DIA_Rosi_MRTrade_Others_Cond;
	information = DIA_Rosi_MRTrade_Others_Info;
	description = "У тебя можно что-нибудь купить?";
};
func int DIA_Rosi_MRTrade_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_MRTrade_Others_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_03_00");	//У тебя можно что-нибудь купить?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_07_00");	//У тебя можно что-нибудь купить?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_10_00");	//У тебя можно что-нибудь купить?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_16_00");	//У тебя можно что-нибудь купить?
	};
	AI_Output(self,other,"DIA_Rosi_MRTrade_Others_17_01");	//Нет, муж рассердится, если я продам что-то без его ведома.
};

//===================================================
instance DIA_Rosi_Husband_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 23;
	condition = DIA_Rosi_Husband_Others_Cond;
	information = DIA_Rosi_Husband_Others_Info;
	description = "Твой муж всегда такой раздраженный?";
};
func int DIA_Rosi_Husband_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena() && DIA_Sekob_MR_Perm_Others_once)	{
		return TRUE;
	};
};
func void DIA_Rosi_Husband_Others_Info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Rosi_Husband_Others_03_00");	//Твой муж всегда такой раздраженный?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rosi_Husband_Others_07_00");	//Твой муж всегда такой раздраженный?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rosi_Husband_Others_10_00");	//Твой муж всегда такой раздраженный?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Rosi_Husband_Others_16_00");	//Твой муж всегда такой раздраженный?
	};
	AI_Output(self,other,"DIA_Rosi_Husband_Others_17_01");	//Почти всегда. Если только ты не платишь ему за вежливость.
	AI_Output(self,other,"DIA_Rosi_Husband_Others_17_02");	//Не могу сказать, что я счастлива с ним.
};


// Кулинарные изыски ===================================================
instance DIA_Rosi_AskRecipe(C_Info)
{
	npc = BAU_936_Rosi;				nr = 5;
	condition = DIA_Rosi_AskRecipe_cond;
	information = DIA_Rosi_AskRecipe_Info;
	description = "А ты умеешь готовить грибы, такие, похожие на розовые ушки?";
};
func int DIA_Rosi_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Rosi_AskRecipe_Info()
{
	if (C_HeroIs_Till())	{			//Тилл
		AI_Output(other,self,"DIA_Rosi_AskRecipe_Till_03_00");	//Мам, а ты умеешь готовить грибы, такие, похожие на розовые ушки?
	}	else if (hero.voice == 3)	{	//Одо/Руперт
		AI_Output(other,self,"DIA_Rosi_AskRecipe_03_00");	//А ты умеешь готовить грибы, такие, похожие на розовые ушки?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Rosi_AskRecipe_07_00");	//А ты умеешь готовить грибы, такие, похожие на розовые ушки?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Rosi_AskRecipe_10_00");	//А ты умеешь готовить грибы, такие, похожие на розовые ушки?
	} else	{							//Елена/Сара
		AI_Output(other,self,"DIA_Rosi_AskRecipe_16_00");	//А ты умеешь готовить грибы, такие, похожие на розовые ушки?
	};
	AI_Output(self,other,"DIA_Rosi_AskRecipe_17_01");	//Фу, какая гадость! Да я бы их в руки не взяла, не то что в рот.
};

