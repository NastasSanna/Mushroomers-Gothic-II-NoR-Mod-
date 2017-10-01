
const int MOBSI_PrayStart_Innos = 501;
const int MOBSI_PrayStart_Adanos = 502;
const int MOBSI_PrayStart_Beliar = 503;
var int PrayStart_Count;


// =============================================

instance PC_PrayStart_End(C_INFO)
{
	nr = 999;
	condition = PC_PrayStart_All_cond;
	information = DIA_PrayStart_End_info;
	description = Dialog_Ende;
	permanent = true;
};
func void DIA_PrayStart_End_info()
{
	b_endproductiondialog();
};

// =============================================
	
instance PC_PrayStart_All(C_INFO)
{
	nr = 1;
	condition = PC_PrayStart_All_cond;
	information = PC_PrayStart_All_info;
	description = "Помолиться и попросить поддержки";
	permanent = true;
};

func int PC_PrayStart_All_cond()
{
	if ((player_mobsi_production == MOBSI_PrayStart_Adanos) || (player_mobsi_production == MOBSI_PrayStart_Beliar)
		  || (player_mobsi_production == MOBSI_PrayStart_Innos))
	{	return TRUE;	};
};

func void PC_PrayStart_All_info()
{
	if (PrayStart_Count == 0)	{
		B_LogNote(TOPIC_PatronGod,TOPIC_PatronGod_Start);
		B_LogNote(TOPIC_PatronGod,TOPIC_PatronGod_Mushrooms);
	};
	PrayStart_Count += 1;
	if (PrayStart_Count > 7)	{
		PrintScreen("Займись делом, назойливый смертный!", -1, 40, FONT_Screen, 2);
		PATRONGOD = 0;
		b_endproductiondialog();
		AI_Wait(self,2);
		AI_Teleport(self,"MW_2_NW_START");
		return;
	};
	if (PrayStart_Count > 5)	{
		PrintScreen("Богам наскучили твои просьбы.", -1, 50, FONT_Screen, 3);
		PrintScreen("Придется справляться своими силами.", -1, 55, FONT_Screen, 3);
		PATRONGOD = 0;
		b_endproductiondialog();
		return;
	};
	// БЕЛИАРУ
	if (player_mobsi_production == MOBSI_PrayStart_Beliar)	{
		if (PATRONGOD == PATRONGOD_Innos)	{
			PrintScreen(PRINT_GOD_Innos_Rage, -1, 55, FONT_Screen, 3);
			Wld_PlayEffect("SPELLFX_PYROKINESIS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_PYROKINESIS_SPREAD",self,self,0,0,0,FALSE);
			if (self.attribute[ATR_HITPOINTS] > 1)	{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
			};
		} 
		else if (PATRONGOD == PATRONGOD_Adanos)	{
			PrintScreen(PRINT_GOD_Adanos_Left, -1, 55, FONT_Screen, 3);
			PrintScreen(PRINT_GOD_Adanos_Left2, -1, 58, FONT_Screen, 3);
		};
		B_LogNote(TOPIC_PatronGod,TOPIC_PatronGod_Beliar);
		PrintScreen(PRINT_GOD_Beliar_Support, -1, 45, FONT_Screen, 3);
		PATRONGOD = PATRONGOD_Beliar;
	} else
	// ИННОСУ	
	if (player_mobsi_production == MOBSI_PrayStart_Innos)	{
		if (PATRONGOD == PATRONGOD_Beliar)	{
			PrintScreen(PRINT_GOD_Beliar_Rage, -1, 55, FONT_Screen, 3);
			Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
			if (self.attribute[ATR_HITPOINTS] > 1)	{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
			};
		}
		else if (PATRONGOD == PATRONGOD_Adanos)	{
			PrintScreen(PRINT_GOD_Adanos_Left, -1, 55, FONT_Screen, 3);
			PrintScreen(PRINT_GOD_Adanos_Left2, -1, 58, FONT_Screen, 3);
		};
		B_LogNote(TOPIC_PatronGod,TOPIC_PatronGod_Innos);
		PrintScreen(PRINT_GOD_Innos_Support, -1, 45, FONT_Screen, 3);
		PATRONGOD = PATRONGOD_Innos;
	} else
	// АДАНОСУ	
	if (player_mobsi_production == MOBSI_PrayStart_Adanos)	{
		if (PATRONGOD == PATRONGOD_Innos)	{
			PrintScreen(PRINT_GOD_Innos_Left, -1, 55, FONT_Screen, 3);
		}
		else if (PATRONGOD == PATRONGOD_Beliar)	{
			PrintScreen(PRINT_GOD_Beliar_Left, -1, 55, FONT_Screen, 3);
		};
		B_LogNote(TOPIC_PatronGod,TOPIC_PatronGod_Adanos);
		PrintScreen(PRINT_GOD_Adanos_Support, -1, 45, FONT_Screen, 3);
		PATRONGOD = PATRONGOD_Adanos;
	};
	Npc_SetTalentSkill(hero,NPC_TALENT_PATRONGOD,PATRONGOD);
	b_endproductiondialog();
};

// =============================================

func void PC_PrayAdanos_Start_S1()
{
	if (Npc_IsPlayer(self))	{
		PC_PrayStart_End.npc = Hlp_GetInstanceID(self);
		PC_PrayStart_All.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_PrayStart_Adanos;
		AI_ProcessInfos(self);
	};
};

func void PC_PrayInnos_Start_S1()
{
	if (Npc_IsPlayer(self))	{
		PC_PrayStart_End.npc = Hlp_GetInstanceID(self);
		PC_PrayStart_All.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_PrayStart_Innos;
		AI_ProcessInfos(self);
	};
};

func void PC_PrayBeliar_Start_S1()
{
	if (Npc_IsPlayer(self))	{
		PC_PrayStart_End.npc = Hlp_GetInstanceID(self);
		PC_PrayStart_All.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_PrayStart_Beliar;
		AI_ProcessInfos(self);
	};
};


// =============================================

var int PatronGod_Bless_Once;

//разовый подарок от выбранного бога
func void HERO_PatronGod_Bless()
{
	if (!PatronGod_Bless_Once && (PATRONGOD != 0))	{
		PatronGod_Bless_Once = TRUE;
		if (PATRONGOD == PATRONGOD_Beliar)	{
			PrintScreen("Белиар награждает своего слугу!", -1, 65, FONT_Screen, 3);
			CreateInvItems(hero,ItMi_Gold,100);
			CreateInvItems(hero,ItSc_SumSkel,2);
			CreateInvItems(hero,ItSc_SumGobSkel,3);
			CreateInvItems(hero,ItKe_ThiefGuildKey_MIS,1);
			Snd_Play("Geldbeutel");
		}
		else if (PATRONGOD == PATRONGOD_Innos)	{
			PrintScreen("Иннос дарует тебе свою силу!", -1, 65, FONT_Screen, 3);
			if (C_HeroIs_Odo())	{
				B_RaiseAttribute(hero,ATR_MANA_MAX,10);
			}
			else if (C_HeroIs_Talbin() || C_HeroIs_Elena())	{
				B_RaiseAttribute(hero,ATR_DEXTERITY,5);
			}
			else {
				B_RaiseAttribute(hero,ATR_STRENGTH,5);
			};
		}
		else if (PATRONGOD == PATRONGOD_Adanos)	{
			PrintScreen("Аданос благословляет тебя!", -1, 65, FONT_Screen, 3);
			B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,40);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};
};
