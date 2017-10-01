
prototype PC_SnowStudioPortrait(C_NPC)
{
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	noFocus = TRUE;
};

var int EVT_SNOWGALLERY_ISTAR_Once;
func void EVT_SNOWGALLERY_ISTAR()
{
	MEM_Debug("EVT_SNOWGALLERY_ISTAR");
	//Wld_InsertNpc(PC_Zombi_Istar, "NW_MAGECAVE_NS_OUT");
	Snd_Play3D(hero,"SNOWSTUDIO_ISTAR");
	if (!EVT_SNOWGALLERY_ISTAR_Once) {
		EVT_SNOWGALLERY_ISTAR_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Istar);
	};
};

var int EVT_SNOWGALLERY_ADEPT_Once;
func void EVT_SNOWGALLERY_ADEPT()
{
	MEM_Debug("EVT_SNOWGALLERY_ADEPT");
	Snd_Play3D(hero,"SNOWSTUDIO_ADEPT");
	if (!EVT_SNOWGALLERY_ADEPT_Once) {
		EVT_SNOWGALLERY_ADEPT_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Adept);
	};
};

func void EVT_SNOWGALLERY_HELENDREAM()
{
	MEM_Debug("EVT_SNOWGALLERY_HelenDream");
	if (!Hlp_IsValidNpc(PC_HelenDream))	{
		Wld_InsertNpc(PC_HelenDream, "NW_MAGECAVE_HD_IN");
		AI_TurnToNpc(PC_HelenDream, hero);
	};
};

var int EVT_SNOWGALLERY_KERTAX_Once;
func void EVT_SNOWGALLERY_KERTAX()
{
	MEM_Debug("EVT_SNOWGALLERY_Kertax");
	Snd_Play3D(hero,"SNOWSTUDIO_KERTAX");
	if (!EVT_SNOWGALLERY_KERTAX_Once) {
		EVT_SNOWGALLERY_KERTAX_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Kertax);
	};
};

var int EVT_SNOWGALLERY_NAJA_Once;
func void EVT_SNOWGALLERY_NAJA()
{
	MEM_Debug("EVT_SNOWGALLERY_Naja");
	Snd_Play3D(hero,"SNOWSTUDIO_NAJA");
	if (!EVT_SNOWGALLERY_NAJA_Once) {
		EVT_SNOWGALLERY_NAJA_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Naja);
	};
};

var int EVT_SNOWGALLERY_TAJA_Once;
func void EVT_SNOWGALLERY_TAJA()
{
	MEM_Debug("EVT_SNOWGALLERY_Taja");
	Snd_Play3D(hero,"SNOWSTUDIO_TAJA");
	if (!EVT_SNOWGALLERY_TAJA_Once) {
		EVT_SNOWGALLERY_TAJA_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_Taja);
	};
};

var int EVT_SNOWGALLERY_GORNADRAK_Once;
func void EVT_SNOWGALLERY_GORNADRAK()
{
	MEM_Debug("EVT_SNOWGALLERY_GorNaDrak");
	Snd_Play3D(hero,"SNOWSTUDIO_GORNADRAK");
	if (!EVT_SNOWGALLERY_GORNADRAK_Once) {
		EVT_SNOWGALLERY_GORNADRAK_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_GorNaDrak);
	};
};

var int EVT_SNOWGALLERY_MAKSSUHOCHEV_Once;
func void EVT_SNOWGALLERY_MAKSSUHOCHEV()
{
	MEM_Debug("EVT_SNOWGALLERY_MaksimSuhochev");
	Snd_Play3D(hero,"SNOWSTUDIO_MAKSSUHOCHEV");
	if (!EVT_SNOWGALLERY_MAKSSUHOCHEV_Once) {
		EVT_SNOWGALLERY_MAKSSUHOCHEV_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_MaksimSuhochev);
	};
};

var int EVT_SNOWGALLERY_2KHAOS_Once;
func void EVT_SNOWGALLERY_2KHAOS()
{
	MEM_Debug("EVT_SNOWGALLERY_2KHAOS");
	Snd_Play3D(hero,"SNOWSTUDIO_2KHAOS");
	if (!EVT_SNOWGALLERY_2KHAOS_Once) {
		EVT_SNOWGALLERY_2KHAOS_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_2Khaos);
	};
};

var int EVT_SNOWGALLERY_NAEMNIK_Once;
func void EVT_SNOWGALLERY_NAEMNIK()
{
	MEM_Debug("EVT_SNOWGALLERY_NaemnikIzGotiki");
	Snd_Play3D(hero,"SNOWSTUDIO_NAEMNIK");
	if (!EVT_SNOWGALLERY_NAEMNIK_Once) {
		EVT_SNOWGALLERY_NAEMNIK_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_NaemnikIzGotiki);
	};
};

var int EVT_SNOWGALLERY_FIREDRAGON_Once;
instance PC_FireDragon(C_ITEM)
{
	name = MOBNAME_FireDragon;
};
func void EVT_SNOWGALLERY_FIREDRAGON()
{
	MEM_Debug("EVT_SNOWGALLERY_FireDragon");
	if (!EVT_SNOWGALLERY_FIREDRAGON_Once || Hlp_Random(2) == 0) {
		Snd_Play3D(hero,"SNOWSTUDIO_FIREDRAGON");
		Wld_InsertItem(PC_FireDragon,"FP_ITEM_FIREDRAGON");
		Wld_PlayEffect("SPELLFX_RINGRITUAL1",PC_FireDragon,hero,1,10,DAM_FIRE,TRUE);
		Wld_RemoveItem(PC_FireDragon);
		Wld_PlayEffect("SPELLFX_CHARGEFIREBALL_COLLIDE",hero,hero,5,10,DAM_FIRE,TRUE);
		AI_PlayAni(hero,"T_GOTHIT");
	};
	if (!EVT_SNOWGALLERY_FIREDRAGON_Once) {
		EVT_SNOWGALLERY_FIREDRAGON_Once = TRUE;
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_FireDragon);
	};
};

var int EVT_SNOWGALLERY_NASTASSANNA_Once;
func void EVT_SNOWGALLERY_NASTASSANNA()
{
	MEM_Debug("EVT_SNOWGALLERY_NASTASSANNA");
	if (!EVT_SNOWGALLERY_NASTASSANNA_Once) {
		Wld_InsertNpc(PC_NastasSanna_Snow, "NW_MAGECAVE_NS_IN");
		AI_TurnToNpc(PC_NastasSanna_Snow, hero);
		B_GiveAchievement_SnowStudio();
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_NastasSanna);
		EVT_SNOWGALLERY_NASTASSANNA_Once = TRUE;
	};
};

func void EVT_SNOWGALLERY_BLOODWINSNOW()
{
	MEM_Debug("EVT_SNOWGALLERY_BloodwinSnow");
	Snd_Play3D(hero,"SNOWSTUDIO_BLOODWINSNOW");
};

// ----------------------------------------------
var int SnowStudio_Portrait_Timer;

func int EVT_SnowStudio_Portrait_Cond()
{
	if (SnowStudio_Portrait_Timer == 0)	{
		//только в обычных режимах
		if (!InfoManager_HasFinished())	{
			return FALSE;
		};
		if (C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_RUN)
			 || C_BodyStateContains(hero,BS_SNEAK) || C_BodyStateContains(hero,BS_WALK)) {
			return TRUE;
		};
	};
	return FALSE;
};

// ----------------------------------------------

var int HERO_LastFocusVob;

func void EVT_SnowStudio_Portrait()
{
	if (SnowStudio_Portrait_Timer > 0) {
		SnowStudio_Portrait_Timer -= 1;
	};
	if (EVT_SnowStudio_Portrait_Cond()) {
		var oCNpc h;	h = Hlp_GetNpc(hero);
		if (h.focus_vob && HERO_LastFocusVob != h.focus_vob)	{
			var zCVob fv;	fv = _^(h.focus_vob);
			if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_NASTASSANNA")) {
				SnowStudio_Portrait_Timer = 6;
				EVT_SNOWGALLERY_NASTASSANNA();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_ISTAR")) {
				SnowStudio_Portrait_Timer = 10;
				EVT_SNOWGALLERY_ISTAR();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_ADEPT")) {
				SnowStudio_Portrait_Timer = 7;
				EVT_SNOWGALLERY_ADEPT();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_HELENDREAM")) {
				SnowStudio_Portrait_Timer = 6;
				EVT_SNOWGALLERY_HELENDREAM();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_KERTAX")) {
				SnowStudio_Portrait_Timer = 8;
				EVT_SNOWGALLERY_KERTAX();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_NAJA")) {
				SnowStudio_Portrait_Timer = 6;
				EVT_SNOWGALLERY_NAJA();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_TAJA")) {
				SnowStudio_Portrait_Timer = 6;
				EVT_SNOWGALLERY_TAJA();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_GORNADRAK")) {
				SnowStudio_Portrait_Timer = 7;
				EVT_SNOWGALLERY_GORNADRAK();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_MAKSSUHOCHEV")) {
				SnowStudio_Portrait_Timer = 3;
				EVT_SNOWGALLERY_MAKSSUHOCHEV();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_NAEMNIK")) {
				SnowStudio_Portrait_Timer = 3;
				EVT_SNOWGALLERY_NAEMNIK();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_FIREDRAGON")) {
				SnowStudio_Portrait_Timer = 5;
				EVT_SNOWGALLERY_FIREDRAGON();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"SNOWSTUDIO_BLOODWINSNOW")) {
				SnowStudio_Portrait_Timer = 5;
				EVT_SNOWGALLERY_BLOODWINSNOW();
			}
			else if (Hlp_StrCmp(fv._zCObject_objectName,"ITMR_YELLOWFUN")) {
				SnowStudio_Portrait_Timer = 6;
				EVT_SNOWGALLERY_2KHAOS();
			};
			HERO_LastFocusVob = h.focus_vob;
		};
	};
};

