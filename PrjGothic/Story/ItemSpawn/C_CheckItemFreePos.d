
func int _IsBetween(var int a, var int b, var int c)	//zReal, zReal, zReal
{
	if ((lf(a, c) && lf(c, b)) || (lf(b, c) && lf(c, a)))	// (a < c) и (c < b) или (b < c) & (c < a)
	{	return TRUE;	};
	return FALSE;
};
func int _IsNear(var int a, var int b)	//zReal, zReal
{
	if (lf(subf(a, b), mkf(50)) && gf(subf(a, b), mkf(-50)))	//(a - b < 50) && (a - b > -50)
	{	return TRUE;	};
	return FALSE;
};

// занята ли уже эта позиция итемом
// проверка по bbox3D
func int C_CheckItemFreePos(var int x, var int y, var int z)	//zReal, zReal, zReal
{
	var zCListSort ItmList;	ItmList = _^(MEM_World.voblist_items);	//zCListSort
	var int loop;	loop = MEM_StackPos.position;
	if (ItmList.data)	{
		var zCVob itm;	itm = _^(ItmList.data);
		if (_IsNear(itm.trafoObjToWorld[3], x) &&
			_IsNear(itm.trafoObjToWorld[7], y) &&
			_IsNear(itm.trafoObjToWorld[11], z))	{
//			MEM_Debug(ConcatStrings("SP isnt free ", itm._zCObject_objectName));
//			MEM_Debug(CS5(toStringf(itm.trafoObjToWorld[3]),",",toStringf(itm.trafoObjToWorld[7]),",",toStringf(itm.trafoObjToWorld[11])));
//			MEM_Debug(CS5(toStringf(x),",",toStringf(y),",",toStringf(z)));
			return FALSE;
		};
	};
	if (ItmList.next)	{
		ItmList = _^(ItmList.next);
		MEM_StackPos.position = loop;
	};
	return TRUE;
};



