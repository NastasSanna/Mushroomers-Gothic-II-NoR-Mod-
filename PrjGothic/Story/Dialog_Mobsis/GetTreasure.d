
var int GetTreasure_Erol_01_Once;
var int GetTreasure_Erol_02_Once;
var int GetTreasure_Erol_03_Once;

var int PC_Erol_GetRing_Run;

instance DIA_PC_Erol_GetRing(C_Info)
{
	npc = PC_Erol;
	condition = DIA_PC_Erol_GetRing_cond;
	information = DIA_PC_Erol_GetRing_info;
	description = "Снять кольцо со скелета.";
};
func int DIA_PC_Erol_GetRing_cond()	{
	if (PC_Erol_GetRing_Run == TRUE)	{
		return TRUE;
	};
};
func void DIA_PC_Erol_GetRing_info()
{
	CreateInvItem(self,ItRi_HP_Regen);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PC_Erol_GetRing_Run = FALSE;
	AI_StopProcessInfos(self);
};
//----------------------------
instance DIA_PC_Erol_DontGetRing(C_Info)
{
	npc = PC_Erol;
	condition = DIA_PC_Erol_DontGetRing_cond;
	information = DIA_PC_Erol_DontGetRing_info;
	description = "Оставить кольцо в могиле.";
};
func int DIA_PC_Erol_DontGetRing_cond()	{
	if (PC_Erol_GetRing_Run == TRUE)	{
		return TRUE;
	};
};
func void DIA_PC_Erol_DontGetRing_info()
{
	B_GivePlayerXP(XP_Erol_RingInGrave);
	//Аданос благословляет добрые дела!
	B_Adanos_Bless4Good();
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PC_Erol_GetRing_Run = FALSE;
	AI_StopProcessInfos(self);
};


// Эрол роется в могилах ====================================================

func int CanGetTreasure(var int once)
{
	if (!Npc_IsPlayer(self))	{
		return FALSE;
	};
	if (!C_HeroIs_Erol())	{
		PrintScreen("Здесь уже кто-то побывал...",-1,-1,FONT_ScreenSmall,3);
		return FALSE;
	};
	if (once) {
		PrintScreen("Я тут уже копал.",-1,-1,FONT_ScreenSmall,3);
		return FALSE;
	};
	if (!Npc_HasItems(self,ItMw_2H_Axe_L_01))	{
		PrintScreen("Мне нужна кирка.",-1,-1,FONT_ScreenSmall,3);
		return FALSE;
	};
	return TRUE;
};

func int CanGetTreasure_01()
{
	return CanGetTreasure(GetTreasure_Erol_01_Once);
};
func int CanGetTreasure_02()
{
	return CanGetTreasure(GetTreasure_Erol_02_Once);
};
func int CanGetTreasure_03()
{
	return CanGetTreasure(GetTreasure_Erol_03_Once);
};

func void GetTreasure_Erol_01_S1()
{
	PrintScreen("Ничего интересного.",-1,-1,FONT_Screen,2);
	GetTreasure_Erol_01_Once = TRUE;
};

func void GetTreasure_Erol_02_S1()
{
	PrintScreen("На пальце скелета поблескивает кольцо.",-1,-1,FONT_Screen,4);
	//взять или оставить
	PC_Erol_GetRing_Run = TRUE;
	self.aivar[AIV_INVINCIBLE] = TRUE;
	AI_ProcessInfos(self);
	GetTreasure_Erol_02_Once = TRUE;
};

func void GetTreasure_Erol_03_S1()
{
	PrintScreen("Здесь кое-что есть.",-1,-1,FONT_Screen,2);
	CreateInvItems(self,ItWr_OldStonePlate_Erol,2);
	CreateInvItems(self,ItWr_Stoneplate_Silver,1);
	Erol_Graves_GotPlates = TRUE;
	GetTreasure_Erol_03_Once = TRUE;
};
