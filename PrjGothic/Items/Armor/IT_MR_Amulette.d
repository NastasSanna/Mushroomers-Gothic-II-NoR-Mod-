
const int Value_Am_SharkTooth = 20;

// ===================== Ищущий огонек ========================

prototype Proto_ItAm_MR_WispDetector(C_Item)
{
	name = "Рудный амулет";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Рудный амулет блуждающего огонька";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

//со дна озера
instance ItAm_MR_WispDetector_Lake(Proto_ItAm_MR_WispDetector)
{
	text[2] = "Я нашел этот амулет на дне озера в горах.";
	on_equip = Equip_WispDetector_Uncharged;
};
var int Equip_WispDetector_Uncharged_Once;
func void Equip_WispDetector_Uncharged()
{
	PrintInInventory(PRINT_NothingHappens);
	//в журнал - не работает
	if (!Equip_WispDetector_Uncharged_Once)	{
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWearSelf);
		Equip_WispDetector_Uncharged_Once = TRUE;
	};
};


//дает Ватрас (не заряжен)
instance ItAm_MR_WispDetector_Uncharged(Proto_ItAm_MR_WispDetector)
{
	text[2] = "Руду в амулете нужно зарядить.";
	on_equip = Equip_WispDetector_Uncharged;
};

//заряжен
instance ItAm_MR_WispDetector_Charged(Proto_ItAm_MR_WispDetector)
{
	text[2] = "Руда заряжена, но огонек еще не вернулся.";
	on_equip = Equip_WispDetector_Uncharged;
};

//полностью восстановлен!
instance ItAm_MR_WispDetector_Ready(Proto_ItAm_MR_WispDetector)
{
	text[2] = "Амулет полностью восстановлен.";
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
};
func void Equip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	AI_Teleport(DetWsp,"TOT");
	Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
	MIS_Erol_Plates_AmulWorks = TRUE;
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(DetWsp,"TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp,"TOT");
};

// ===================== Акулий зуб ========================

prototype Proto_ItAm_MR_SharkTooth(C_Item)
{
	name = "Амулет из акульего зуба";
	value = Value_Am_SharkTooth;
	visual = "ItAm_SharkTooth.3ds";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[1] = "Акулий зуб и аквамариновая бусина на кожаном ремешке.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
//сломан
instance ItAm_MR_SharkTooth_Broken(Proto_ItAm_MR_SharkTooth)
{
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	text[3] = "Ремешок порван.";
	count[5] = value;
};

//целый
instance ItAm_MR_SharkTooth(Proto_ItAm_MR_SharkTooth)
{
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	text[3] = "Амулет на удачу. +10% опыта";
	on_equip = Equip_SharkTooth;
	on_unequip = UnEquip_SharkTooth;
};
func void Equip_SharkTooth()
{
	if (Npc_IsPlayer(self))	{
		XP_Bonus_10 = TRUE;
	};
};
func void UnEquip_SharkTooth()
{
	if (Npc_IsPlayer(self))	{
		XP_Bonus_10 = FALSE;
	};
};
	
	

