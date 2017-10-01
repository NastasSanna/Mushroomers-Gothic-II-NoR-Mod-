instance DIA_Cross_EXIT(DIA_Proto_End)
{
	npc = Molerat_Cross;
};

// ==================================================================
instance DIA_Cross_Hello(C_Info)
{
	npc = Molerat_Cross;
	nr = 0;
	condition = DIA_NoCond_cond;
	information = DIA_Cross_Hello_info;
	important = TRUE;
};
func void DIA_Cross_Hello_info()
{
	AI_Output(self,other,"MOL_WARN02");	//(радостно приветствует)
	AI_Output(other,self,"DIA_Cross_Hello_14_00");	//Привет, дружище! А ты опять потолстел!
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Hello);
};

// ==================================================================
instance DIA_Cross_FollowMe(C_Info)
{
	npc = Molerat_Cross;
	nr = 1;
	condition = DIA_Cross_FollowMe_cond;
	information = DIA_Cross_FollowMe_info;
	description = "Идем со мной!";
	permanent = TRUE;
};
func int DIA_Cross_FollowMe_cond()
{
	if ((!MIS_Till_Pet_Follow || MIS_Till_Pet_Search) && !MIS_Till_Pet_RunAway)	{
		return TRUE;
	};
};
func void DIA_Cross_FollowMe_info()
{
	AI_Output(other,self,"DIA_Cross_FollowMe_14_00");	//Идем со мной!
	AI_Output(self,other,"MOL_WARN01");	//(согласно похрюкивает)
	B_StartOtherRoutine(self,"FOLLOW");
	MIS_Till_Pet_Follow = TRUE;
	MIS_Till_Pet_Search = FALSE;
};

// ==================================================================
instance DIA_Cross_Search(C_Info)
{
	npc = Molerat_Cross;
	nr = 2;
	condition = DIA_Cross_Search_cond;
	information = DIA_Cross_Search_info;
	description = "Ищи!";
	permanent = TRUE;
};
func int DIA_Cross_Search_cond()
{
	if (!MIS_Till_Pet_Search && !MIS_Till_Pet_RunAway)	{
		return TRUE;
	};
};
func void DIA_Cross_Search_info()
{
	AI_Output(other,self,"DIA_Cross_Search_14_00");	//Ищи!
	AI_Output(self,other,"MOL_WARN04");	//(довольно урчит)
	B_StartOtherRoutine(self,"FOLLOW");
	MIS_Till_Pet_Follow = TRUE;
	MIS_Till_Pet_Search = TRUE;
};

// ==================================================================
instance DIA_Cross_GoHome(C_Info)
{
	npc = Molerat_Cross;
	nr = 3;
	condition = DIA_Cross_GoHome_cond;
	information = DIA_Cross_GoHome_info;
	description = "Иди домой.";
	permanent = TRUE;
};
func int DIA_Cross_GoHome_cond()
{
	if (MIS_Till_Pet_Follow && !MIS_Till_Pet_RunAway)	{
		return TRUE;
	};
};
func void DIA_Cross_GoHome_info()
{
	AI_Output(other,self,"DIA_Cross_GoHome_14_00");	//Иди домой.
	AI_Output(self,other,"MOL_AMBIENT02");	//(вздыхает)
	B_StartOtherRoutine(self,"START");
	MIS_Till_Pet_Follow = FALSE;
	MIS_Till_Pet_Search = FALSE;
};

// ==================================================================
func void DIA_Cross_Feed_Menu()
{
	Info_ClearChoices(DIA_Cross_Feed);
	Info_AddChoice(DIA_Cross_Feed,Dialog_Back,DIA_Cross_Feed_Menu_Back);
	Info_AddChoice(DIA_Cross_Feed,"(дать обычную еду)",DIA_Cross_Feed_Menu_Food);
	Info_AddChoice(DIA_Cross_Feed,"(дать растение)",DIA_Cross_Feed_Menu_Plant);
	Info_AddChoice(DIA_Cross_Feed,"(дать гриб)",DIA_Cross_Feed_Menu_MR);
};
instance DIA_Cross_Feed(C_Info)
{
	npc = Molerat_Cross;
	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Cross_Feed_info;
	description = "(покормить)";
	permanent = TRUE;
};
func void DIA_Cross_Feed_info()
{
	AI_Output(other,self,"DIA_Cross_Feed_14_00");	//Вот, скушай...
	DIA_Cross_Feed_Menu();
};
func void DIA_Cross_Feed_Yes(var int ItemInst)
{
	B_GiveInvItems(other,self,ItemInst,1);
	AI_Output(self,other,"MOL_AMBIENT_SHORT03");	//(жует)
	if (Hlp_Random(100) < 20)	{
		AI_PlayAni(self,"R_ROAM1");
	};
	B_GivePlayerXP(XP_Till_PetFeed);
	DIA_Cross_Feed_Menu();
};
func void DIA_Cross_Feed_Like(var int ItemInst)
{
	B_GiveInvItems(other,self,ItemInst,1);
	AI_PlayAni(self,"T_SNIFF");
	AI_Output(other,self,"DIA_Cross_Feed_Like_14_00");	//Нравится? Ну лопай, лопай.
	AI_Output(self,other,"MOL_AMBIENT_SHORT03");	//(жует)
	B_GivePlayerXP(XP_Till_PetFeed_Like);
	DIA_Cross_Feed_Menu();
};
func void DIA_Cross_Feed_No()
{
	AI_Output(self,other,"MOL_HURT04");	//(недовольно визжит)
		AI_Output(other,self,"DIA_Cross_Feed_No_14_01");	//Крестик отказывается это есть.
	DIA_Cross_Feed_Menu();
};
func void DIA_Cross_Feed_Menu_Back()
{
	Info_ClearChoices(DIA_Cross_Feed);
};
func void DIA_Cross_Feed_Menu_MR()
{
	Info_ClearChoices(DIA_Cross_Feed);
	Info_AddChoice(DIA_Cross_Feed,Dialog_Back,DIA_Cross_Feed_Menu_Back);
	if (Npc_HasItems(other,ItMr_GoldPlate))	{
		Info_AddChoice(DIA_Cross_Feed,"(золотую чашу)",DIA_Cross_Feed_MR_GoldPlate);
	};
	if (Npc_HasItems(other,ItMr_Heart))	{
		Info_AddChoice(DIA_Cross_Feed,"(гриб-сердце)",DIA_Cross_Feed_MR_Heart);
	};
	if (Npc_HasItems(other,ItMr_Violet))	{
		Info_AddChoice(DIA_Cross_Feed,"(фиолетовую поганку)",DIA_Cross_Feed_MR_Violet);
	};
	if (Npc_HasItems(other,ItMr_Trident))	{
		Info_AddChoice(DIA_Cross_Feed,"(трезубец)",DIA_Cross_Feed_MR_Trident);
	};
	if (Npc_HasItems(other,ItMr_Sunrise))	{
		Info_AddChoice(DIA_Cross_Feed,"(зорьник)",DIA_Cross_Feed_MR_Sunrise);
	};
	if (Npc_HasItems(other,ItMr_Stone))	{
		Info_AddChoice(DIA_Cross_Feed,"(каменку)",DIA_Cross_Feed_MR_Stone);
	};
	if (Npc_HasItems(other,ItMr_Red))	{
		Info_AddChoice(DIA_Cross_Feed,"(болтун)",DIA_Cross_Feed_MR_Red);
	};
	if (Npc_HasItems(other,ItMr_Piny))	{
		Info_AddChoice(DIA_Cross_Feed,"(сосновик)",DIA_Cross_Feed_MR_Piny);
	};
	if (Npc_HasItems(other,ItMr_Oyster))	{
		Info_AddChoice(DIA_Cross_Feed,"(ракушечник)",DIA_Cross_Feed_MR_Oyster);
	};
	if (Npc_HasItems(other,ItMr_NightSparkles))	{
		Info_AddChoice(DIA_Cross_Feed,"(ночные искры)",DIA_Cross_Feed_MR_NightSparkles);
	};
	if (Npc_HasItems(other,ItMr_LadysEar))	{
		Info_AddChoice(DIA_Cross_Feed,"(дамское ушко)",DIA_Cross_Feed_MR_LadysEar);
	};
	if (Npc_HasItems(other,ItMr_KeilBig))	{
		Info_AddChoice(DIA_Cross_Feed,"(большой кабанчик)",DIA_Cross_Feed_MR_KeilBig);
	};
	if (Npc_HasItems(other,ItMr_KeilSmall))	{
		Info_AddChoice(DIA_Cross_Feed,"(маленький кабанчик)",DIA_Cross_Feed_MR_KeilSmall);
	};
	if (Npc_HasItems(other,ItMr_Ivy))	{
		Info_AddChoice(DIA_Cross_Feed,"(плющевик)",DIA_Cross_Feed_MR_Ivy);
	};
	if (Npc_HasItems(other,ItMr_Governor))	{
		Info_AddChoice(DIA_Cross_Feed,"(губернатор)",DIA_Cross_Feed_MR_Governor);
	};
	if (Npc_HasItems(other,ItMr_Foggy))	{
		Info_AddChoice(DIA_Cross_Feed,"(туманник)",DIA_Cross_Feed_MR_Foggy);
	};
	if (Npc_HasItems(other,ItMr_DragonTears))	{
		Info_AddChoice(DIA_Cross_Feed,"(драконовы слезы)",DIA_Cross_Feed_MR_DragonTears);
	};
	if (Npc_HasItems(other,ItMr_BrownOiler))	{
		Info_AddChoice(DIA_Cross_Feed,"(масляк)",DIA_Cross_Feed_MR_BrownOiler);
	};
	if (Npc_HasItems(other,ItMr_Branch))	{
		Info_AddChoice(DIA_Cross_Feed,"(веточник)",DIA_Cross_Feed_MR_Branch);
	};
	if (Npc_HasItems(other,ItMr_Bottle))	{
		Info_AddChoice(DIA_Cross_Feed,"(бутылочник)",DIA_Cross_Feed_MR_Bottle);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_02))	{
		Info_AddChoice(DIA_Cross_Feed,"(пищу рудокопа)",DIA_Cross_Feed_MR_02);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_01))	{
		Info_AddChoice(DIA_Cross_Feed,"(темный гриб)",DIA_Cross_Feed_MR_01);
	};
};

func void DIA_Cross_Feed_Menu_Plant()
{
	Info_ClearChoices(DIA_Cross_Feed);
	Info_AddChoice(DIA_Cross_Feed,Dialog_Back,DIA_Cross_Feed_Menu_Back);
	if (Npc_HasItems(other,ItPl_Mana_Herb_03))	{
		Info_AddChoice(DIA_Cross_Feed,"(огненный корень)",DIA_Cross_Feed_Mana_Herb_03);
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_02))	{
		Info_AddChoice(DIA_Cross_Feed,"(огненную траву)",DIA_Cross_Feed_Mana_Herb_02);
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_01))	{
		Info_AddChoice(DIA_Cross_Feed,"(огненную крапиву)",DIA_Cross_Feed_Mana_Herb_01);
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_03))	{
		Info_AddChoice(DIA_Cross_Feed,"(лечебный корень)",DIA_Cross_Feed_Health_Herb_03);
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_02))	{
		Info_AddChoice(DIA_Cross_Feed,"(лечебное растение)",DIA_Cross_Feed_Health_Herb_02);
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_01))	{
		Info_AddChoice(DIA_Cross_Feed,"(лечебную траву)",DIA_Cross_Feed_Health_Herb_01);
	};
	if (Npc_HasItems(other,ItPl_Planeberry))	{
		Info_AddChoice(DIA_Cross_Feed,"(луговую ягоду)",DIA_Cross_Feed_Planeberry);
	};
	if (Npc_HasItems(other,ItPl_Forestberry))	{
		Info_AddChoice(DIA_Cross_Feed,"(лесную ягоду)",DIA_Cross_Feed_Forestberry);
	};
	if (Npc_HasItems(other,ItPl_Blueplant))	{
		Info_AddChoice(DIA_Cross_Feed,"(серафис)",DIA_Cross_Feed_Blueplant);
	};
	if (Npc_HasItems(other,ItPl_Beet))	{
		Info_AddChoice(DIA_Cross_Feed,"(репу)",DIA_Cross_Feed_Beet);
	};
};

func void DIA_Cross_Feed_Menu_Food()
{
	Info_ClearChoices(DIA_Cross_Feed);
	Info_AddChoice(DIA_Cross_Feed,Dialog_Back,DIA_Cross_Feed_Menu_Back);
	if (Npc_HasItems(other,ItFo_Apple))	{
		Info_AddChoice(DIA_Cross_Feed,"(яблоко)",DIA_Cross_Feed_Apple);
	};
	if (Npc_HasItems(other,ItFo_Honey))	{
		Info_AddChoice(DIA_Cross_Feed,"(мед)",DIA_Cross_Feed_Honey);
	};
	if (Npc_HasItems(other,ItFo_Bread))	{
		Info_AddChoice(DIA_Cross_Feed,"(хлеб)",DIA_Cross_Feed_Bread);
	};
	if (Npc_HasItems(other,ItFo_Cheese_OldShepherd))	{
		Info_AddChoice(DIA_Cross_Feed,"(сыр старого пастуха)",DIA_Cross_Feed_Cheese_OldShepherd);
	};
	if (Npc_HasItems(other,ItFo_Cheese))	{
		Info_AddChoice(DIA_Cross_Feed,"(сыр)",DIA_Cross_Feed_Cheese);
	};
	if (Npc_HasItems(other,ItFo_SmellyFish))	{
		Info_AddChoice(DIA_Cross_Feed,"(селедку)",DIA_Cross_Feed_SmellyFish);
	};
	if (Npc_HasItems(other,ItFo_Fish))	{
		Info_AddChoice(DIA_Cross_Feed,"(рыбу)",DIA_Cross_Feed_Fish);
	};
	if (Npc_HasItems(other,ItFo_FishSoup))	{
		Info_AddChoice(DIA_Cross_Feed,"(уху)",DIA_Cross_Feed_FishSoup);
	};
	if (Npc_HasItems(other,ItFo_Sausage))	{
		Info_AddChoice(DIA_Cross_Feed,"(колбасу)",DIA_Cross_Feed_Sausage);
	};
	if (Npc_HasItems(other,ItFo_Stew))	{
		Info_AddChoice(DIA_Cross_Feed,"(похлебку)",DIA_Cross_Feed_Stew);
	};
	if (Npc_HasItems(other,ItFo_Bacon))	{
		Info_AddChoice(DIA_Cross_Feed,"(бекон)",DIA_Cross_Feed_Bacon);
	};
	if (Npc_HasItems(other,ItFoMuttonRaw))	{
		Info_AddChoice(DIA_Cross_Feed,"(сырое мясо)",DIA_Cross_Feed_MuttonRaw);
	};
	if (Npc_HasItems(other,ItFoMutton))	{
		Info_AddChoice(DIA_Cross_Feed,"(жареное мясо)",DIA_Cross_Feed_Mutton);
	};
};
//----------------------------------------------
func void DIA_Cross_Feed_MR_GoldPlate()			{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_Heart()				{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_Violet()			{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_Trident()			{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_Sunrise()	{DIA_Cross_Feed_Yes(ItMr_Sunrise);};
func void DIA_Cross_Feed_MR_Stone()		{DIA_Cross_Feed_Yes(ItMr_Stone);};
func void DIA_Cross_Feed_MR_Red()		{DIA_Cross_Feed_Yes(ItMr_Red);};
func void DIA_Cross_Feed_MR_Piny()		{DIA_Cross_Feed_Yes(ItMr_Piny);};
func void DIA_Cross_Feed_MR_Oyster()	{DIA_Cross_Feed_Yes(ItMr_Oyster);};
func void DIA_Cross_Feed_MR_NightSparkles()		{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_LadysEar()	{DIA_Cross_Feed_Yes(ItMr_LadysEar);};
func void DIA_Cross_Feed_MR_KeilBig()			{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_KeilSmall()	{DIA_Cross_Feed_Yes(ItMr_KeilSmall);};
func void DIA_Cross_Feed_MR_Ivy()				{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_Governor()	{DIA_Cross_Feed_Like(ItMr_Governor);};
func void DIA_Cross_Feed_MR_Foggy()				{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_DragonTears()		{DIA_Cross_Feed_No();};
func void DIA_Cross_Feed_MR_BrownOiler()	{DIA_Cross_Feed_Yes(ItMr_BrownOiler);};
func void DIA_Cross_Feed_MR_Branch()	{DIA_Cross_Feed_Yes(ItMr_Branch);};
func void DIA_Cross_Feed_MR_Bottle()	{
	DIA_Cross_Feed_Yes(ItMr_Bottle);
		AI_Output(other,self,"DIA_Cross_Feed_Bottle_14_01");	//Ножку гриба Крестик съел, а шляпку оставил.
	Hero_Knows_Bottle = TRUE;
};
func void DIA_Cross_Feed_MR_02()		{DIA_Cross_Feed_Yes(ItPl_Mushroom_01);};
func void DIA_Cross_Feed_MR_01()		{DIA_Cross_Feed_Yes(ItPl_Mushroom_01);};

func void DIA_Cross_Feed_Mana_Herb_03()	{DIA_Cross_Feed_Yes(ItPl_Mana_Herb_03);};
func void DIA_Cross_Feed_Mana_Herb_02()	{DIA_Cross_Feed_Yes(ItPl_Mana_Herb_02);};
func void DIA_Cross_Feed_Mana_Herb_01()	{DIA_Cross_Feed_Yes(ItPl_Mana_Herb_01);};
func void DIA_Cross_Feed_Health_Herb_03()	{DIA_Cross_Feed_Yes(ItPl_Health_Herb_03);};
func void DIA_Cross_Feed_Health_Herb_02()	{DIA_Cross_Feed_Yes(ItPl_Health_Herb_02);};
func void DIA_Cross_Feed_Health_Herb_01()	{DIA_Cross_Feed_Yes(ItPl_Health_Herb_01);};
func void DIA_Cross_Feed_Planeberry()	{DIA_Cross_Feed_Yes(ItPl_Planeberry);};
func void DIA_Cross_Feed_Forestberry()	{DIA_Cross_Feed_Yes(ItPl_Forestberry);};
func void DIA_Cross_Feed_Blueplant()	{DIA_Cross_Feed_Like(ItPl_Blueplant);};
func void DIA_Cross_Feed_Beet()			{DIA_Cross_Feed_Yes(ItPl_Beet);};

func void DIA_Cross_Feed_Apple()	{DIA_Cross_Feed_Yes(ItFo_Apple);};
func void DIA_Cross_Feed_Honey()	{DIA_Cross_Feed_Like(ItFo_Honey);};
func void DIA_Cross_Feed_Bread()	{DIA_Cross_Feed_Yes(ItFo_Bread);};
func void DIA_Cross_Feed_Cheese_OldShepherd()	{DIA_Cross_Feed_Yes(ItFo_Cheese_OldShepherd);};
func void DIA_Cross_Feed_Cheese()	{DIA_Cross_Feed_Yes(ItFo_Cheese);};
func void DIA_Cross_Feed_SmellyFish()	{DIA_Cross_Feed_Yes(ItFo_SmellyFish);};
func void DIA_Cross_Feed_Fish()		{DIA_Cross_Feed_Yes(ItFo_Fish);};
func void DIA_Cross_Feed_FishSoup()	{DIA_Cross_Feed_Yes(ItFo_FishSoup);};
func void DIA_Cross_Feed_Sausage()	{DIA_Cross_Feed_Yes(ItFo_Sausage);};
func void DIA_Cross_Feed_Stew()		{DIA_Cross_Feed_Yes(ItFo_Stew);};
func void DIA_Cross_Feed_Bacon()	{DIA_Cross_Feed_Yes(ItFo_Bacon);};
func void DIA_Cross_Feed_MuttonRaw()	{DIA_Cross_Feed_Yes(ItFoMuttonRaw);};
func void DIA_Cross_Feed_Mutton()	{DIA_Cross_Feed_Yes(ItFoMutton);};

// ==================================================================
instance DIA_Cross_FollowMeToCave(C_Info)
{
	npc = Molerat_Cross;	nr = 10;
	condition = DIA_Cross_FollowMeToCave_cond;
	information = DIA_Cross_FollowMeToCave_info;
	description = "Идем со мной! (отвести в пещеру)";
	permanent = TRUE;
};
func int DIA_Cross_FollowMeToCave_cond()
{
	if (!MIS_Till_Pet_Follow && (MIS_Till_Pet_CaveReady == 7)
		&& (MIS_Till_Pet_BirthPlace != MIS_Till_Pet_BirthPlace_Cave)
		&& !MIS_Till_Pet_ChildBorn)	{
		return TRUE;
	};
};
func void DIA_Cross_FollowMeToCave_info()
{
	AI_Output(other,self,"DIA_Cross_FollowMe_14_00");	//Идем со мной!
	if (Wld_GetFullTime() < 5 * 24 * 60)	{
		AI_Output(self,other,"MOL_WARN01");	//(согласно похрюкивает)
		B_StartOtherRoutine(self,"FOLLOW");
		MIS_Till_Pet_Follow = TRUE;
	}
	else	{
		AI_Output(self,other,"MOL_HURT04");	//(недовольно визжит)
			AI_Output(other,self,"DIA_Cross_FollowMeToCave_14_01");	//Она отказывается идти. Неужели уже скоро?
	};
};

// ==================================================================
instance DIA_Cross_Birth(C_Info)
{
	npc = Molerat_Cross;	nr = 11;
	condition = DIA_Cross_Birth_cond;
	information = DIA_Cross_Birth_info;
	description = "Поздравляю, малышка!";
};
func int DIA_Cross_Birth_cond()
{
	if (MIS_Till_Pet_ChildBorn)	{
		return TRUE;
	};
};
func void DIA_Cross_Birth_info()
{
	AI_Output(other,self,"DIA_Cross_Birth_14_00");	//Поздравляю, малышка!
	AI_Output(self,other,"MOL_WARN03");	//(сопит)
	B_LogEntry_Status(TOPIC_Till_Pet,LOG_SUCCESS,TOPIC_Till_Pet_Born);
	B_GivePlayerXP(XP_Till_ChildBorn);
	MIS_Till_Pet = LOG_SUCCESS;
	B_GiveAchievement_Till_Accoucheur();
};
