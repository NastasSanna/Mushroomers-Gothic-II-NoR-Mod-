//NS - июнь 2013

// БЛОК ПЕРЕМЕЩЕНИЯ
// Внтури блока можно обрабатывать перемещение статических объектов
// До конца блока перемещение объекта не отображается в игре

// начало БЛОКА ПЕРЕМЕЩЕНИЯ
const int zCVob__BeginMovement = 6412928;
func void Vob_BeginMovement(var int PtrVob)
{
	//void __thiscall zCVob::BeginMovement(void)  	0x0061DA80
	CALL__thiscall(PtrVob, zCVob__BeginMovement);
};

// конец БЛОКА ПЕРЕМЕЩЕНИЯ, x - ???
const int zCVob__EndMovement = 6414544;
func void Vob_EndMovement(var int PtrVob, var int x)
{
	//virtual void __thiscall zCVob::EndMovement(int)      	0x0061E0D0
	CALL_IntParam(x);
	CALL__thiscall(PtrVob, zCVob__EndMovement);
};
// ----------------------------------------------------------
// Следующие функции вызывать ТОЛЬКО внутри блока перемещения.
// Иначе - вылет
// vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

// вернуть прежнее положение объекта (до начала блока перемещения)
func void Vob_ResetToOldMovementState(var int PtrVob)
{
	//void __thiscall zCVob::ResetToOldMovementState(void)   	0x0061DC00
	const int zCVob__ResetToOldMovementState = 6413312;
	CALL__thiscall(PtrVob, zCVob__ResetToOldMovementState);
};

//рассчет физики
// перемещение объекта не выполняется
func void Vob_UpdatePhysics(var int PtrVob)
{
	//void __thiscall zCVob::UpdatePhysics(void)    	0x0061D2D0
	const int zCVob__UpdatePhysics = 6410960;
	CALL__thiscall(PtrVob, zCVob__UpdatePhysics);
};

//есть ли коллизии при текущем положении объекта
func int Vob_IsColliding(var int PtrVob)
{
	//int __thiscall zCVob::IsColliding(void)        	0x0061F4F0
	const int zCVob__IsColliding = 6419696;
	CALL__thiscall(PtrVob, zCVob__IsColliding);
	return CALL_RetValAsInt();
};

//выполнить проверку коллизий
// исправление (перемещение объекта) не выполняется
func void Vob_CheckAndResolveCollisions(var int PtrVob)
{
	//void __thiscall zCVob::CheckAndResolveCollisions(void)          	0x0061F060
	const int zCVob__CheckAndResolveCollisions = 6418528;
	CALL__thiscall(PtrVob, zCVob__CheckAndResolveCollisions);
};

//поворот в локальных координатах
func void Vob_RotateLocalY(var int Vobptr, var int angle)	//zCVob *, zReal
{
	//void __thiscall zCVob::RotateLocalY(float)   	0x0061B720
	CALL_FloatParam(angle);
	CALL__thiscall(Vobptr, 6403872);
};

// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// Следующие функции можно вызывать и вне блока перемещения
// ----------------------------------------------------------

//автонастройка обнаружения коллизий
func void Vob_SetCollTypeDefaultFromVisual(var int PtrVob)
{
	//void __thiscall zCVob::SetCollTypeDefaultFromVisual(void)   	0x0061AEF0
	const int zCVob__SetCollTypeDefaultFromVisual = 6401776;
	CALL__thiscall(PtrVob, zCVob__SetCollTypeDefaultFromVisual);
};

//вкл/откл обнаружение коллизий (стат. и дин.)
func void Vob_SetCollDet(var int PtrVob, var int value)
{
	//void __thiscall zCVob::SetCollDet(int)   	0x006D0000
	const int zCVob__SetCollDet = 7143424;
	CALL_IntParam(value);
	CALL__thiscall(PtrVob, zCVob__SetCollDet);
};

//вкл/откл обнаружение коллизий с дин. объектами
// = установить/снять флаг zCVob_bitfield0_collDetectionDynamic
func void Vob_SetCollDetDyn(var int PtrVob, var int value)
{
	//void __fastcall zCVob::SetCollDetDyn(int)   	0x0061CF40
	const int zCVob__SetCollDetDyn = 6410048;
	CALL__fastcall(PtrVob, value, zCVob__SetCollDetDyn);
};

//вкл/откл обнаружение коллизий со стат. объектами
// = установить/снять флаг zCVob_bitfield0_collDetectionStatic
func void Vob_SetCollDetStat(var int PtrVob, var int value)
{
	//void __fastcall zCVob::SetCollDetStat(int)   	0x0061CE50
	const int zCVob__SetCollDetStat = 6409808;
	CALL__fastcall(PtrVob, value, zCVob__SetCollDetStat);
};

// перемещение объекта в лок. координатах
func void Vob_MoveLocal(var int PtrVob, var int x, var int y, var int z)
{
	//void __thiscall zCVob::MoveLocal(float float float)      	0x0061B3C0
	const int zCVob__MoveLocal = 6403008;
	//а в стек пихаем в "спейсерном" порядке
	CALL_FloatParam(z);
	CALL_FloatParam(y);
	CALL_FloatParam(x);
	CALL__thiscall(PtrVob, zCVob__MoveLocal);
};

//=Vob_MoveLocal
func void Vob_Move(var int PtrVob, var int x, var int y, var int z)
{
	//void __thiscall zCVob::Move(float float float)      	0x0061B2E0
	const int zCVob__Move = 6402784;
	CALL_FloatParam(z);
	CALL_FloatParam(y);
	CALL_FloatParam(x);
	CALL__thiscall(PtrVob, zCVob__Move);
};

//поместить объект в мировые координаты
func void Vob_MoveWorld(var int PtrVob, var int x, var int y, var int z)
{
	//void __thiscall zCVob::MoveWorld(float float float)      	0x0061B350
	const int zCVob__MoveWorld = 6402896;
	CALL_FloatParam(z);
	CALL_FloatParam(y);
	CALL_FloatParam(x);
	CALL__thiscall(PtrVob, zCVob__MoveWorld);
};

//поместить объект PtrVob_From в координаты PtrVob_To
func void Vob_MoveToVob(var int PtrVob_From, var int PtrVob_To)
{
	//void __thiscall zCVob::MoveWorld(float float float)      	0x0061B350
	const int zCVob__MoveWorld = 6402896;
	var zCVob Vob_To; Vob_To = _^(PtrVob_To);
	var int x;	x = Vob_To.trafoObjToWorld[3];
	var int y;	y = Vob_To.trafoObjToWorld[7];
	var int z;	z = Vob_To.trafoObjToWorld[11];
	
	CALL_FloatParam(z);
	CALL_FloatParam(y);
	CALL_FloatParam(x);
	CALL__thiscall(PtrVob_From, zCVob__MoveWorld);
};

//отобразить/скрыть BBox3D
func void Vob_SetDrawBBox3D(var int PtrVob, var int value)
{
	//void __thiscall zCVob::SetDrawBBox3D(int)   	0x006CFFE0
	const int zCVob__SetDrawBBox3D = 7143392;
	CALL_FloatParam(value);
	CALL__thiscall(PtrVob, zCVob__SetDrawBBox3D);
};

//////////////////////////////////////////////////////////////////

func void Vob_ApplyPhysics(var int Vobptr)
{
	if  (!VobPtr)	{return;};
	var zCVob Vob;	Vob = _^(VobPtr);
/*	var int h;	//zReal
	h = subf(Vob.bbox3D_maxs[1], Vob.bbox3D_mins[1]);	h = divf(h, mkf(2));
	if (lf(h, 0))	{h = negf(h);};
	Vob.trafoObjToWorld[7] = addf(Vob.trafoObjToWorld[7], h);*/
	Vob.bitfield[0] = Vob.bitfield[0] | zCVob_bitfield0_physicsEnabled;
	Vob.bitfield[2] = Vob.bitfield[2] | zCVob_bitfield2_sleepingMode;
	//MEM_ArrayInsert(MEM_World.activeVobList_array,VobPtr);
	if (MEM_World.activeVobList_numInArray >= MEM_World.activeVobList_numAlloc) {
        MEM_World.activeVobList_numAlloc = 10 + MEM_World.activeVobList_numAlloc;
        MEM_World.activeVobList_array = MEM_Realloc (MEM_World.activeVobList_array, MEM_World.activeVobList_numInArray * 4, MEM_World.activeVobList_numAlloc * 4);
    };
	MEM_WriteInt(MEM_World.activeVobList_array + 4*(MEM_World.activeVobList_numInArray),VobPtr);
	MEM_World.activeVobList_numInArray += 1;
};

func void Vob_TurnWorldRad(var int Vobptr, var int angle)	//zCVob *, zReal
{
	if  (!VobPtr)	{return;};
	var zCVob Vob;	Vob = _^(VobPtr);
	Vob.trafoObjToWorld[0] = cos(angle);
	Vob.trafoObjToWorld[5] = FLOATONE;
	Vob.trafoObjToWorld[8] = sin(angle);
	Vob.trafoObjToWorld[2] = negf(Vob.trafoObjToWorld[8]);
	Vob.trafoObjToWorld[1] = FLOATNULL;
	Vob.trafoObjToWorld[4] = FLOATNULL;
	Vob.trafoObjToWorld[6] = FLOATNULL;
	Vob.trafoObjToWorld[9] = FLOATNULL;
	Vob.trafoObjToWorld[10] = Vob.trafoObjToWorld[0];
};

func void Vob_TurnWorldDeg(var int Vobptr, var int angle)	//zCVob *, int
{
	Vob_TurnWorldRad(Vobptr, MATH_GradToRad(angle));
};

func void Vob_MovePolarLocal(var int Vobptr, var int r, var int a)	//zCVob *, zReal, zReal
{
	if  (!VobPtr)	{return;};
	var zCVob Vob;	Vob = _^(VobPtr);
	//переводим в лок. декартовы координаты
	var int loc[3];
	loc[0] = mulf(r, cos(a));	loc[2] = mulf(r, sin(a));
	//и в мировые координаты
	var int w[3];
	// (w[0], w[1], w[2], 1)^T = M * (loc[0], 0, loc[2], 1)^T
		w[0] = mulf(Vob.trafoObjToWorld[0], loc[0]);
		w[0] = addf(w[0], mulf(Vob.trafoObjToWorld[2], loc[2]));
	Vob.trafoObjToWorld[3] = addf(w[0], Vob.trafoObjToWorld[3]);	//w[0] = M[0,0]*loc[0] + M[0,2]*loc[2] + M[0,3]
		w[2] =  mulf(Vob.trafoObjToWorld[8], loc[0]);
		w[2] = addf(w[2], mulf(Vob.trafoObjToWorld[10], loc[2]));
	Vob.trafoObjToWorld[11] = addf(w[2], Vob.trafoObjToWorld[11]);	//zw = M[2,0]*x + M[2,2]*z + M[2,3]
};

