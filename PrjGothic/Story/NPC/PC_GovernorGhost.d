

instance PC_GovernorGhost(Npc_Default)
{
	name[0] = "Призрак губернатора";
	guild = GIL_MEATBUG;
	id = 69996;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	
	aivar[AIV_Behaviour] = BEHAV_NeverRansack | BEHAV_Invisible;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_MR_GovernorHat);
	damagetype = DAM_MAGIC;
	
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	
	CreateInvItems(self,ItMr_Governor,28);
	
	start_aistate = ZS_GhostWusel;
};

