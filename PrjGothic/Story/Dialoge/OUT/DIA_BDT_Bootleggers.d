
instance DIA_Bootlegger1_EXIT(DIA_Proto_End)
{
	npc = BDT_802_Bootlegger;
};

// ===================================================
instance DIA_Bootlegger1_Perm(C_INFO)
{
	npc = BDT_802_Bootlegger;
	nr = 0;
	condition = DIA_WhenAsked_cond;
	information = DIA_Bootlegger1_Perm_info;
	important = TRUE;
	permanent = TRUE;
};

func void DIA_Bootlegger1_Perm_info()
{
	AI_Output(self,other,"DIA_Bootlegger1_Perm_07_00");	//Отвали.
	AI_StopProcessInfos(self);
};

// ===================================================

instance DIA_Bootlegger2_EXIT(DIA_Proto_End)
{
	npc = BDT_803_Bootlegger;
};

// ===================================================
instance DIA_Bootlegger2_Perm(C_INFO)
{
	npc = BDT_803_Bootlegger;
	nr = 0;
	condition = DIA_WhenAsked_cond;
	information = DIA_Bootlegger2_Perm_info;
	important = TRUE;
	permanent = TRUE;
};

func void DIA_Bootlegger2_Perm_info()
{
	AI_Output(self,other,"DIA_Bootlegger2_Perm_07_00");	//Если охота почесать языком - поговори с боссом.
	AI_StopProcessInfos(self);
};

// ===================================================

// ===================================================

instance DIA_Bootlegger3_EXIT(DIA_Proto_End)
{
	npc = BDT_804_Bootlegger;
};

// ===================================================
instance DIA_Bootlegger3_Perm(C_INFO)
{
	npc = BDT_804_Bootlegger;
	nr = 0;
	condition = DIA_WhenAsked_cond;
	information = DIA_Bootlegger3_Perm_info;
	important = TRUE;
	permanent = TRUE;
};

func void DIA_Bootlegger3_Perm_info()
{
	AI_Output(self,other,"DIA_Bootlegger3_Perm_07_00");	//Все разговоры - с боссом. А ко мне не лезь.
	AI_StopProcessInfos(self);
};

// ===================================================
