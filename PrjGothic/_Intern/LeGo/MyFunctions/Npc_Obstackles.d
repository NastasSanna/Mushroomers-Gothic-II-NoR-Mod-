
//int __thiscall oCNpc::RbtIsObjectObstacle(zCVob * class zVEC3 const & zVEC3 const & zVEC3 &)	0x00687080		0	6
const int oCNpc__RbtIsObjectObstacle = 6844544;

var int oCNpc__RbtIsObjectObstacle_Result;

func void _On_RbtIsObjectObstacle_Before()
{
	oCNpc__RbtIsObjectObstacle_Result = FALSE;
//	MEM_Debug("_On_RbtIsObjectObstacle_Before");
//MEM_Debug(ConcatStrings("retAddr = ", I2S(retAddr)));
	if(ECX > 0) { //npc
		var c_npc slf; slf = _^(ECX);
//MEM_Debug(slf.name);
	}
	else	{
//MEM_Debug("No NPC in ECX");
		return;
	};
	if(MEM_ReadInt(ESP + 4) > 0) { //item
		var zCClassDef clsdef;
		clsdef = _^(MEM_GetClassDef(MEM_ReadInt(ESP + 4)));
		//if (Hlp_StrCmp(clsdef.className, "oCTouchDamage"))	{	//опасная штука!
		var zCVob vob;	vob = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
		MEM_Debug(CS5(slf.name, " found ", vob._zCObject_objectName," of class ", clsdef.className));
		if (Hlp_StrCmp(vob._zCObject_objectName, "FIRE_DAMAGE"))	{	//опасная штука!
			MEM_Debug("oCTouchDamage detected!");
			oCNpc__RbtIsObjectObstacle_Result = TRUE;
		};
//MEM_Debug(itm.name);
	}
	else	{
//MEM_Debug("No item in [ESP + 4]");
		return;
	};
};
func void _On_RbtIsObjectObstacle_After()
{
//	MEM_Debug("_On_RbtIsObjectObstacle_After");
	HookedFunc_Result = HookedFunc_Result || oCNpc__RbtIsObjectObstacle_Result;
};

func void HOOK_RbtIsObjectObstacle()
{
	//UNFINISHED
	HookEngineF_Ext(oCNpc__RbtIsObjectObstacle, 6, _On_RbtIsObjectObstacle_Before, _On_RbtIsObjectObstacle_After);
};