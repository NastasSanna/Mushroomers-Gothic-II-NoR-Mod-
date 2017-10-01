/**************************************************************
					ТРЕНИРОВОЧНАЯ МИШЕНЬ
  Можно атаковать чем угодно.
NS - 08/07/13
**************************************************************/

prototype NonNpc_Default_Target(C_NPC)
{
	id = 0;
	name[0] = "Мишень";
	guild = GIL_MEATBUG;
	
	flags = NPC_FLAG_IMMORTAL;
	//noFocus = TRUE;
	start_aistate = ZS_BeingTarget;
	
	aivar[AIV_Temper] = TEMPER_NoFightParker;
	
	protection[PROT_BLUNT] = -1;
	protection[PROT_EDGE] = -1;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = -1;
	protection[PROT_FLY] = -1;
	protection[PROT_MAGIC] = -1;
	
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
};

instance TargetInvis(NonNpc_Default_Target)	//невидимая
{
	Mdl_SetVisual(self,"Target.mds");
//	Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance TargetFace(NonNpc_Default_Target)	//видимая, без подставки (только сам деревянный круг)
{
	Mdl_SetVisual(self,"Target.mds");
	Mdl_SetVisualBody(self,"Tgt_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance TargetFull(NonNpc_Default_Target)	//видимая, с тумбой (полная визуализация)
{
	Mdl_SetVisual(self,"Target.mds");
	Mdl_SetVisualBody(self,"Tgt_Body_Full",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
