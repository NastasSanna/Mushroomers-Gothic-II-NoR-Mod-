
instance DIA_MushLord_EXIT(DIA_Proto_End)
{
	npc = PC_MushLord;
	information = DIA_MushLord_EXIT_info;
};
func void DIA_MushLord_EXIT_info()
{
	AI_StopProcessInfos(self);
	B_HideResult();
};

//=====================================================
instance DIA_MushLord_CountMr(C_INFO)
{
	npc = PC_MushLord;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_MushLord_CountMr_info;
	description = "Сколько грибов?";
	permanent = TRUE;
};
func void DIA_MushLord_CountMr_info()
{
	_SP_SearchItemsList_Count();
	_SP_Count_PrintInWorld();
};

//=====================================================
instance DIA_MushLord_GiveMr(C_INFO)
{
	npc = PC_MushLord;
	nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_MushLord_GiveMr_info;
	description = "Дай грибов!";
	permanent = TRUE;
};
func void DIA_MushLord_GiveMr_info()
{
	Info_ClearChoices(DIA_MushLord_GiveMr);
	Info_AddChoice(DIA_MushLord_GiveMr,Dialog_Back,DIA_MushLord_GiveMr_Back);
	Info_AddChoice(DIA_MushLord_GiveMr,"всех",DIA_MushLord_GiveMr_All);
};
func void DIA_MushLord_GiveMr_Back()
{
	Info_ClearChoices(DIA_MushLord_GiveMr);
};
func void DIA_MushLord_GiveMr_All()
{
	Info_ClearChoices(DIA_MushLord_GiveMr);
	CreateInvItems(other,ItPl_Mushroom_01,1);
	CreateInvItems(other,ItPl_Mushroom_02,1);
	CreateInvItems(other,ItMr_Bottle,1);
	CreateInvItems(other,ItMr_Branch,1);
	CreateInvItems(other,ItMr_BrownOiler,1);
	CreateInvItems(other,ItMr_DragonTears,1);
	CreateInvItems(other,ItMr_Foggy,1);
	CreateInvItems(other,ItMr_GoldPlate,1);
	CreateInvItems(other,ItMr_Governor,1);
	CreateInvItems(other,ItMr_Heart,1);
	CreateInvItems(other,ItMr_Ivy,1);
	CreateInvItems(other,ItMr_KeilBig,1);
	CreateInvItems(other,ItMr_KeilSmall,1);
	CreateInvItems(other,ItMr_LadysEar,1);
	CreateInvItems(other,ItMr_NightSparkles,1);
	CreateInvItems(other,ItMr_Oyster,1);
	CreateInvItems(other,ItMr_Piny,1);
	CreateInvItems(other,ItMr_Red,1);
	CreateInvItems(other,ItMr_Stone,1);
	CreateInvItems(other,ItMr_Sunrise,1);
	CreateInvItems(other,ItMr_Trident,1);
	CreateInvItems(other,ItMr_Violet,1);
};

//=====================================================
instance DIA_MushLord_SpawnMr(C_INFO)
{
	npc = PC_MushLord;
	nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_MushLord_SpawnMr_info;
	description = "Вырасти грибы!";
	permanent = TRUE;
};
func void DIA_MushLord_SpawnMr_info()
{
	Info_ClearChoices(DIA_MushLord_SpawnMr);
	Info_AddChoice(DIA_MushLord_SpawnMr,Dialog_Back,DIA_MushLord_SpawnMr_Back);
	Info_AddChoice(DIA_MushLord_SpawnMr,"как в начале",DIA_MushLord_SpawnMr_Start);
	Info_AddChoice(DIA_MushLord_SpawnMr,"все",DIA_MushLord_SpawnMr_All);
};
func void DIA_MushLord_SpawnMr_Back()
{
	Info_ClearChoices(DIA_MushLord_SpawnMr);
};
func void DIA_MushLord_SpawnMr_All()
{
	Spawn_MR_All();
	Info_ClearChoices(DIA_MushLord_SpawnMr);
};
func void DIA_MushLord_SpawnMr_Start()
{
	Spawn_MR_Normal(-1);
	Info_ClearChoices(DIA_MushLord_SpawnMr);
};
//=====================================================
instance DIA_MushLord_ShowResult(C_INFO)
{
	npc = PC_MushLord;
	nr = 4;
	condition = DIA_MushLord_ShowResult_cond;
	information = B_ShowResult;
	description = "Покажи мою статистику.";
	permanent = TRUE;
};
func int DIA_MushLord_ShowResult_cond()
{
	if (Result_View == 0)	{
		return TRUE;
	};
};
//=====================================================
instance DIA_MushLord_HideResult(C_INFO)
{
	npc = PC_MushLord;
	nr = 5;
	condition = DIA_MushLord_HideResult_cond;
	information = B_HideResult;
	description = "Спрячь мою статистику.";
	permanent = TRUE;
};
func int DIA_MushLord_HideResult_cond()
{
	if (Result_View != 0)	{
		return TRUE;
	};
};
