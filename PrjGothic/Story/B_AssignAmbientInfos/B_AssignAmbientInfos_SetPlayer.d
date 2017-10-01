

instance DIA_PC_SetPlayer(C_INFO)
{
	nr = 1;
	condition = DIA_PC_SetPlayer_cond;
	information = DIA_PC_SetPlayer_info;
	description = "Выбрать персонажа";
	permanent = TRUE;
};

func int DIA_PC_SetPlayer_cond()
{
	return TRUE;
};

func void DIA_PC_SetPlayer_info()
{
	AI_StopProcessInfos(self);
	NPC_SetAsPlayer(self);
	B_RemoveNpc(other);
	Print(hero.name);
};

func void B_AssignAmbientInfos_SetPlayer(var C_Npc slf)
{
	if (slf.npcType == NPCTYPE_HERO)	{
		DIA_PC_SetPlayer.npc = Hlp_GetInstanceID(slf);
	};
};
