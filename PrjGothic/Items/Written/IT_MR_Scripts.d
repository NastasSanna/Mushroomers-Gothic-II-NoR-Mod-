
// — –»ѕ“џ ---- доп. квест от Ќастась—анны

prototype ItWr_Proto_Script(C_Item)
{
    name = "—крипт";
    mainflag = ITEM_KAT_DOCS;    flags = ITEM_MISSION;
    value = 0;
    visual = "ItWr_Scroll_01.3DS";    material = MAT_LEATHER;
    scemeName = "MAP";
    description = "—крипт";
};

//---------------------------------------------
instance ItWr_Script1(ItWr_Proto_Script)
{
    on_state[0] = Use_Script1;
};
func void Use_Script1()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 instance ItMr_Sunrise(Proto_Mushroom)");
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,"03     description = У«орьникУ;    //name = description;");
    Doc_PrintLines(nDocID,0,"04     if (!OPT_HideMrNames)    {    name = description;};");
    Doc_PrintLines(nDocID,0,"05 ");
    Doc_PrintLines(nDocID,0,"06     visual = УItMr_Sunrise.3DSУ;");
    Doc_PrintLines(nDocID,0,"07 ");
    Doc_PrintLines(nDocID,0,"08     value = Value_Mr_Sunrise;");
    Doc_PrintLines(nDocID,0,"09     text[5] = NAME_Value;    count[5] = value;");
    Doc_PrintLines(nDocID,0,"10 ");
    Doc_PrintLines(nDocID,0,"11     on_state[0] = Use_Mushroom_Sunrise;");
    Doc_PrintLines(nDocID,0,"12 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script2(ItWr_Proto_Script)
{
    on_state[0] = Use_Script2;
};
func void Use_Script2()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 //точка дл€ спауна");
    Doc_PrintLines(nDocID,0,"02 class zCSpawnPoint    {");
    Doc_PrintLines(nDocID,0,"03     var string name;    //им€ FP");
    Doc_PrintLines(nDocID,0,"04     var int trafoObjToWorld[16];    //центр");
    Doc_PrintLines(nDocID,0,"05     var int MainFlag;    //тип SP");
    Doc_PrintLines(nDocID,0,"06     var int flags;    //что угодно справочное");
    Doc_PrintLines(nDocID,0,"07     var int Rmax;    //max радиус рассеивани€, см");
    Doc_PrintLines(nDocID,0,"08     var int Rmin;    //min радиус рассеивани€, см");
    Doc_PrintLines(nDocID,0,"09     var int cnt;    //сколько, если <=0, то автоопре-е по площади");
    Doc_PrintLines(nDocID,0,"10     var int NoPhys;    //не примен€ть физику после спауна, =TRUE/FALSE");
    Doc_PrintLines(nDocID,0,"11 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script3(ItWr_Proto_Script)
{
    on_state[0] = Use_Script3;
};
func void Use_Script3()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 func void SP_SearchItemsList_Cycle(var int Minutes)");
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,"03     VAR zCVob curVob;");
    Doc_PrintLines(nDocID,0,"04     VAR zCListSort curItem;    curItem = _^(MEM_World.voblist_items);");
    Doc_PrintLines(nDocID,0,"05     // repeat");
    Doc_PrintLines(nDocID,0,"06     var int label;    label = MEM_StackPos.position;");
    Doc_PrintLines(nDocID,0,"07         if (curItem.data)    {");
    Doc_PrintLines(nDocID,0,"08             curVob = _^(curItem.data);");
    Doc_PrintLines(nDocID,0,"09             SP_CheckDeleteItem_DespawnMR(curItem.data, Minutes);");
    Doc_PrintLines(nDocID,0,"10        };");
    Doc_PrintLines(nDocID,0,"11     //until (!curItem.next);");
    Doc_PrintLines(nDocID,0,"12     if (curItem.next)    {");
    Doc_PrintLines(nDocID,0,"13         curItem = _^(curItem.next);");
    Doc_PrintLines(nDocID,0,"14         MEM_StackPos.position = label;");
    Doc_PrintLines(nDocID,0,"15     };");
    Doc_PrintLines(nDocID,0,"16 ");
    Doc_PrintLines(nDocID,0,"17     SP_DeleteVobsFromList();");
    Doc_PrintLines(nDocID,0,"18 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script4(ItWr_Proto_Script)
{
    on_state[0] = Use_Script4;
};
func void Use_Script4()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 prototype DIA_Proto_End(C_INFO)");
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,"03     nr = 999;");
    Doc_PrintLines(nDocID,0,"04     condition = DIA_NoCond_cond;");
    Doc_PrintLines(nDocID,0,"05     information = DIA_Proto_End_info;");
    Doc_PrintLines(nDocID,0,"06     description = Dialog_Ende;");
    Doc_PrintLines(nDocID,0,"07     permanent = true;");
    Doc_PrintLines(nDocID,0,"08 };");
    Doc_PrintLines(nDocID,0,"09 func void DIA_Proto_End_info()");
    Doc_PrintLines(nDocID,0,"10 {");
    Doc_PrintLines(nDocID,0,"11     AI_StopProcessInfos(self);");
    Doc_PrintLines(nDocID,0,"12 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script5(ItWr_Proto_Script)
{
    on_state[0] = Use_Script5;
};
func void Use_Script5()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 func int _C_Random_Next(var int Value)");
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,"03     var int New_Value;");
    Doc_PrintLines(nDocID,0,"04     if (Value <= 0)");
    Doc_PrintLines(nDocID,0,"05     {");
    Doc_PrintLines(nDocID,0,"06         Value = Hlp_Random(1 << 15) + 1;");
    Doc_PrintLines(nDocID,0,"07     };");
    Doc_PrintLines(nDocID,0,"08     New_Value = ((Value * 16807 + 5) & 16776960) >> 8;");
    Doc_PrintLines(nDocID,0,"09     return New_Value;");
    Doc_PrintLines(nDocID,0,"10 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script6(ItWr_Proto_Script)
{
    on_state[0] = Use_Script6;
};
func void Use_Script6()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 if (C_HeroIsInNpcsRoom(VLK_414_Hanna))    {");
    Doc_PrintLines(nDocID,0,"02     dh = 1;    dm = Hlp_Random(20);");
    Doc_PrintLines(nDocID,0,"03     Hanna_Paid = -1;");
    Doc_PrintLines(nDocID,0,"04     B_StartOtherRoutine(VLK_494_Attila,'PUNISHMENT');");
    Doc_PrintLines(nDocID,0,"05     AI_Teleport(VLK_494_Attila,Npc_GetNearestWP(hero));");
    Doc_PrintLines(nDocID,0,"06     AI_Snd_Play(hero,'CS_MAM_FI_FL');");
    Doc_PrintLines(nDocID,0,"07     B_Say(hero,hero,'$AARGH_1');");
    Doc_PrintLines(nDocID,0,"08     PrintSleep(PRINT_SleepPain)");
    Doc_PrintLines(nDocID,0,"09     AI_UseMob(self,'BEDHIGH',-1);");
    Doc_PrintLines(nDocID,0,"10 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script7(ItWr_Proto_Script)
{
    on_state[0] = Use_Script7;
};
func void Use_Script7()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,"01 instance PC_NastasSanna(Npc_Default)");
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,"03    name[0] = 'Ќастась—анна';");
    Doc_PrintLines(nDocID,0,"04     guild = GIL_NONE;");
    Doc_PrintLines(nDocID,0,"05     id = 1616;");
    Doc_PrintLines(nDocID,0,"06     voice = 17;");
    Doc_PrintLines(nDocID,0,"07     npcType = npctype_main;");
    Doc_PrintLines(nDocID,0,"08     B_SetAttributesToChapter(self, 4);");
    Doc_PrintLines(nDocID,0,"09     B_SetFightSkills(self,50);");
    Doc_PrintLines(nDocID,0,"10     B_SetNpcVisual(self,FEMALE,'Hum_Head_SM_BABE9',Face_N_NastasSanna,BodyTexBabe_L,ITAR_Leather_Baby);");
    Doc_PrintLines(nDocID,0,"11     Mdl_SetModelFatness(self, 0.8);");
    Doc_PrintLines(nDocID,0,"12     CreateInvItem(self,ItMw_Schwert1);");
    Doc_PrintLines(nDocID,0,"13     CreateInvItem(self,ItRw_Bow_M_04);");
    Doc_PrintLines(nDocID,0,"14     aivar[AIV_IgnoreFlags] = -1;");
    Doc_PrintLines(nDocID,0,"15     aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;");
    Doc_PrintLines(nDocID,0,"16     aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;");
    Doc_PrintLines(nDocID,0,"17     daily_routine = Rtn_Hide1_1616;");
    Doc_PrintLines(nDocID,0,"18 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script_Teleport(ItWr_Proto_Script)
{
    description = "—крипт-телепорт";
    on_state[0] = Use_Script_Teleport;
    text[1] = "Ќа листе ровными буквами выведено";
    text[2] = "    AI_Teleport(self,УPC_NASTASSANNAУ);";
    text[4] = "„то бы это значило?";
};
func void Use_Script_Teleport()
{
    AI_Teleport(self,"PC_NASTASSANNA");
};


