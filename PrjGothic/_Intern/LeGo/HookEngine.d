/***********************************\
             HOOKENGINE
\***********************************/


//-------------------
// OPCODES
//-------------------
// /* 1 Byte */
const int ASMINT_OP_CompareEAX  = 61;    //0x3D
const int ASMINT_OP_JZ_Byte     = 116;   //0x74
const int ASMINT_OP_popEAX      = 88;    //0x58
// /* 2 Byte */
const int ASMINT_OP_addMemToESP = 9475;  //0x2503
const int ASMINT_OP_movESItoEAX = 61577; //0xF089
const int ASMINT_OP_movEAXtoEDI = 51081; //0xC789

//-------------------
// Registervariablen
//-------------------
var int EAX;
var int ECX;
var int ESP;
var int EBX;
var int EBP;
var int EDI;
var int ESI;


//========================================
// Engine hooken
//========================================
func void HookEngineI(var int address, var int oldInstr, var int function) {

    var int SymbID;   // Symbolindex von 'function'
    var int ptr;      // Pointer auf den Zwischenspeicher der alten Anweisung
    var int relAdr;   // Relative Addresse zum neuen Assemblercode, ausgehend von 'address'

    // ----- Sicherheitsabfragen -----
    if(oldInstr < 5) {
        PrintDebug("HOOKENGINE: oldInstr ist zu kurz. Es werden mindestens 5 Bytes erwartet.");
        return;
    };

    SymbID = function;
    if(SymbID == -1) {
        PrintDebug("HOOKENGINE: Die gegebene Daedalusfunktion kann nicht gefunden werden.");
        return;
    };

    MemoryProtectionOverride (address, oldInstr+3);
    // ----- Eventuell geschьtzen Speicher behandeln -----

    if (MEM_ReadByte(address) == 233) { // Hook schon vorhanden
        HookEngineI(MEM_ReadInt(address+1)+address+5+96, oldInstr, function);
        return;
    };

    // ----- Die alte Anweisung sichern -----
    ptr = MEM_Alloc(oldInstr);
    MEM_CopyBytes(address, ptr, oldInstr);

    // ----- Einen neuen Stream fьr den Assemblercode anlegen -----
    ASM_Open(200 + oldInstr); // Play it safe.

    // ----- Jump aus der Enginefunktion in den neuen Code einfьgen -----
    relAdr = ASMINT_CurrRun-address-5;
    MEM_WriteInt(address + 0, 233);
    MEM_WriteInt(address + 1, relAdr);

    // ----- Neuen Assemblercode verfassen -----

    // Alle Register sichern

    // EAX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(EAX));
    ASM_1(ASMINT_OP_pusha);

    // ECX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movECXtoEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(ECX));

    // ESP in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movESPtoEAX);
    ASM_2(ASMINT_OP_addImToEAX);
    ASM_1(4*8);                  // Wegen pushad [Danke an Sektenspinner]
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(ESP));

    // EBX in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEBXtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EBX));

    // EBP in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEBPtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EBP));

    // EDI in Daedalus Variable sichern
    ASM_2(ASMINT_OP_movEDItoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EDI));
	
    // ESI in Daedalus Variable sichern	
	ASM_2(ASMINT_OP_movESItoEAX);
	ASM_2(ASMINT_OP_movEAXtoMem);
	ASM_4(_@(ESI));

    // --- Daedalusfunktion aufrufen ---

    ASM_1(ASMINT_OP_pushIm);
    ASM_4(SymbID);

    ASM_1(ASMINT_OP_pushIm);
    ASM_4(parser);

    ASM_1(ASMINT_OP_call);
    ASM_4(zParser__CallFunc-ASM_Here()-4);

    ASM_2(ASMINT_OP_addImToESP);
    ASM_1(8);

    ASM_1(ASMINT_OP_popa);

    ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(_@(ECX));
    ASM_2(ASMINT_OP_movEAXtoECX);
		
	ASM_1(ASMINT_OP_movMemToEax);
	ASM_4(_@(EDI));
	ASM_2(ASMINT_OP_movEAXtoEDI);

    ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(_@(EAX));



    // Alte Anweisung wieder einfьgen
    MEM_CopyBytes(ptr, ASMINT_Cursor, oldInstr);
    MEM_Free(ptr);

    ASMINT_Cursor += oldInstr;

    // Zur Enginefunktion zurьckkehren
    ASM_1(ASMINT_OP_pushIm);
    ASM_4(address + oldInstr);
    ASM_1(ASMINT_OP_retn);

    var int i; i = ASM_Close();
};

func void HookEngineF(var int address, var int oldInstr, var func function) {
    HookEngineI(address, oldInstr, MEM_GetFuncID(function));
};
func void HookEngine(var int address, var int oldInstr, var string function) {
    HookEngineI(address, oldInstr, MEM_FindParserSymbol(STR_Upper(function)));
};

//++++++++++++++++++++++++++++++ HOOK ENGINE EXT +++++++++++++++++++++++++++++++++++++
// двойной хук - до и после вызова движковой функции
// позволяет изменять возвращаемое значение (через HookedFunc_Result)
// предполагается, что взломанная функция - thiscall/stdcall, возвращает int/ptr через EAX
// для других использовать можно, но осторожно
// в HookEngineI_Ext можно передавать -1 вместо любой из функций, тогда она просто не вызовется
// в HookEngineF_Ext и HookEngineS_Ext нельзя

// Double hook (before and after call of engine function).
// Assumptions: hooked function is thiscall/stdcall and returns int/ptr value in EAX.
// HookedFunc_Result allows to modify returning value (from EAX)
// In HookEngineI_Ext you could miss one of the functions with -1, 
// but not in HookEngineF_Ext and HookEngineS_Ext.
//NS (12/2013)

var int HookedFunc_Result;
var int RetAddr;


// =================== MY STACK BEGIN ====================
// здесь можно сохранять что-нибудь в пределах сессии
// например, значения переменных, которые кто-то может испортить
// Stack for reg vars.
const int MyStack_ptr = 0;

func void MyStack_PushRegVars()
{
	var int vals_ptr;	vals_ptr = MEM_Alloc(4*9);	//array[9]
	MEM_WriteInt(vals_ptr,		EAX);
	MEM_WriteInt(vals_ptr + 4,	ECX);
	MEM_WriteInt(vals_ptr + 8,	ESP);
	MEM_WriteInt(vals_ptr + 12,	EBX);
	MEM_WriteInt(vals_ptr + 16,	EBP);
	MEM_WriteInt(vals_ptr + 20,	EDI);
	MEM_WriteInt(vals_ptr + 24,	ESI);	
	MEM_WriteInt(vals_ptr + 28,	HookedFunc_Result);	
	MEM_WriteInt(vals_ptr + 32,	RetAddr);	
	var int list_ptr;	list_ptr = MEM_Alloc(4*2);	//zCList
	MEM_WriteInt(list_ptr,		vals_ptr);		//data
	MEM_WriteInt(list_ptr + 4,	MyStack_ptr);	//next
	MyStack_ptr = list_ptr;
};

func void MyStack_PopRegVars()
{
	if (!MyStack_ptr)	{return;};	//MyStack is empty
	var int list_ptr;	list_ptr = MyStack_ptr;		//zCList
	MyStack_ptr = MEM_ReadInt(list_ptr+4);		//next
	var int vals_ptr;	vals_ptr = MEM_ReadInt(list_ptr);	//array[9]	//data
	EAX = MEM_ReadInt(vals_ptr);
	ECX = MEM_ReadInt(vals_ptr + 4);
	ESP = MEM_ReadInt(vals_ptr + 8);
	EBX = MEM_ReadInt(vals_ptr + 12);
	EBP = MEM_ReadInt(vals_ptr + 16);
	EDI = MEM_ReadInt(vals_ptr + 20);
	ESI = MEM_ReadInt(vals_ptr + 24);
	HookedFunc_Result = MEM_ReadInt(vals_ptr + 28);
	RetAddr = MEM_ReadInt(vals_ptr + 32);
	MEM_Free(list_ptr);
	MEM_Free(vals_ptr);
};
// ==================== MY STACK END ====================

// write registers' values to LeGo variables
func void WriteASM_CopyReg()
// code len = 59 bytes
{
    // EAX
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(EAX));
    // ECX
    ASM_2(ASMINT_OP_movECXtoEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(ECX));
    // ESP
    ASM_2(ASMINT_OP_movESPtoEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(ESP));
    // EBX
    ASM_2(ASMINT_OP_movEBXtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EBX));
    // EBP
    ASM_2(ASMINT_OP_movEBPtoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EBP));
    // EDI
    ASM_2(ASMINT_OP_movEDItoEAX);
    ASM_2(ASMINT_OP_movEAXtoMem);
    ASM_4(_@(EDI));
    // ESI
	ASM_2(ASMINT_OP_movESItoEAX);
	ASM_2(ASMINT_OP_movEAXtoMem);
	ASM_4(_@(ESI));
	
	ASM_1(ASMINT_OP_movMemToEAX);
	ASM_4(_@(EAX));
};

// call func by its ID, save registers via pushad-popad
func void WriteASM_ParserCallByID(var int SymbID)
// code len 20 bytes
{
	if (SymbID == -1)	{return;};
	ASM_1(ASMINT_OP_pusha);
	
    ASM_1(ASMINT_OP_pushIm);
    ASM_4(SymbID);

    ASM_1(ASMINT_OP_pushIm);
    ASM_4(parser);

    ASM_1(ASMINT_OP_call);
    ASM_4(zParser__CallFunc - (ASM_Here()+4));

    ASM_2(ASMINT_OP_addImToESP);
    ASM_1(8);

    ASM_1(ASMINT_OP_popa);
};

func void HookEngineI_Ext(var int address, var int oldInstr, var int funct_before, var int funct_after) {
	
    if(oldInstr < 5) {      return;  };	//short instr
	if((funct_before == -1) && (funct_after == -1)) {      return;  };	//no hooks
    if (MEM_ReadByte(address) == 233) {	return; };// only 1 hook allowed


	//saving rewritten instruction
	var int ptr;
    ptr = MEM_Alloc(oldInstr);
    MEM_CopyBytes(address, ptr, oldInstr);

	
	// SymbolIndexes
    var int SymbID_before;    SymbID_before = funct_before;
    var int SymbID_after;    SymbID_after = funct_after;
	var int SymbID_SaveRegVars;	SymbID_SaveRegVars = MEM_GetFuncID(MyStack_PushRegVars);
	var int SymbID_LoadRegVars;	SymbID_LoadRegVars = MEM_GetFuncID(MyStack_PopRegVars);
 
	MemoryProtectionOverride (address, oldInstr+3);

	//Allocating memory for ASM-Code
    ASM_Open(270+oldInstr);

	//overriding old instruction with jump to my ASM_Code
	var int relAdr;		// Relative Address
    relAdr = ASMINT_CurrRun-address-5;
    MEM_WriteInt(address + 0, 233);
    MEM_WriteInt(address + 1, relAdr);


//-------------- ASM-CODE BEGIN -------------------

	// save reg vars
	WriteASM_ParserCallByID(SymbID_SaveRegVars);
	
	// save reg values to vars
	WriteASM_CopyReg();
	
 	// get the caller address from the top of the stack: Stack -> EAX -> RetAddr
//pop EAX
//mov RetAddr, EAX
//push EAX
	ASM_1(ASMINT_OP_popEAX);
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(RetAddr));
	ASM_1(ASMINT_OP_PushEAX);
//mov EAX, EAX_
	ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(_@(EAX));
	
	// Call 'funct_before'
	if (symbID_before != -1)	{
		WriteASM_ParserCallByID(symbID_before);
	};
	
	// Call original function with rewritten instr
		MEM_CopyBytes(ptr, ASMINT_Cursor, oldInstr);
		MEM_Free(ptr);
		ASMINT_Cursor += oldInstr;
		
		ASM_2(ASMINT_OP_addImToESP);
		ASM_1(4);
		ASM_1(ASMINT_OP_call);
		ASM_4(address + oldInstr - (ASM_Here()+4));


	if (symbID_after != -1)	{
		// get the return value from EAX
//mov HookedFunc_Result, EAX
		ASM_2(ASMINT_OP_movEAXToMem);
		ASM_4(_@(HookedFunc_Result));

		// save regs to vars again
		WriteASM_CopyReg();

		// Call 'funct_after'
		WriteASM_ParserCallByID(SymbID_after);

		//write new return value to EAX
//mov EAX, HookedFunc_Result
		ASM_1(ASMINT_OP_movMemToEAX);
		ASM_4(_@(HookedFunc_Result));
	};


	// Return to the caller: RetAddr -> EAX -> Stack
//mov EAX_, EAX
    ASM_2(ASMINT_OP_movEAXToMem);
    ASM_4(_@(EAX));
//mov EAX, RetAddr
//push EAX
    ASM_1(ASMINT_OP_movMemToEAX);
    ASM_4(_@(RetAddr));
	ASM_1(ASMINT_OP_PushEAX);
//mov EAX, EAX_
	ASM_1(ASMINT_OP_movMemToEAX);
	ASM_4(_@(EAX));

	// load reg vars
	WriteASM_ParserCallByID(SymbID_LoadRegVars);
	
//retn
    ASM_1(ASMINT_OP_retn);

//-------------- ASM-CODE END -------------------

	ASM_Close();
//	MEM_Debug("HookEngine_Ext done");
};

func void HookEngineF_Ext(var int address, var int oldInstr, var func funct_before, var func funct_after) {
    var int SymbID_before;	SymbID_before = MEM_GetFuncID(funct_before);
	var int SymbID_after;	SymbID_after = MEM_GetFuncID(funct_after);
	HookEngineI_Ext(address, oldInstr, SymbID_before, SymbID_after);
};
func void HookEngineS_Ext(var int address, var int oldInstr, var string funct_before, var string funct_after) {
    HookEngineI_Ext(address, oldInstr, MEM_FindParserSymbol(STR_Upper(funct_before)), MEM_FindParserSymbol(STR_Upper(funct_after)));
};
