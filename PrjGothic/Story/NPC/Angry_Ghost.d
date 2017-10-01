

instance Angry_Ghost(Npc_Default)
{
	name[0] = "Недовольный призрак";
	guild = GIL_DEMON;
	id = 96669;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	
	aivar[AIV_Behaviour] = BEHAV_NeverRansack;
	aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_MagicUser;
	aivar[AIV_IgnoreFlags] = IGNORE_All;
	
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",0,0,ITAR_Dementor);
	Mdl_SetModelFatness(self,-3);
	damagetype = DAM_MAGIC;
	
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	
	CreateInvItem(self,ItRu_PalHolyBolt);
	
	start_aistate = ZS_Follow_Player;
};

