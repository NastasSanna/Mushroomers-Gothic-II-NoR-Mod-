
//последний вставленный в мир vob - в начале vobtree
func int Wld_GetInsertedVob()
{
	var zCTree newTreeNode;	newTreeNode = _^(MEM_World.globalVobTree_firstChild);
	return newTreeNode.data;
};

//последний вставленный в мир item
//!= последнему vob'у, если у item есть pfx-эффекты
func int Wld_GetInsertedItem()
{
	var zCTree newTreeNode;	newTreeNode = _^(MEM_World.globalVobTree_firstChild);
	if (Hlp_Is_oCItem(newTreeNode.data))	{
		return newTreeNode.data;
	};
	//repeat
	var int label;	label = MEM_StackPos.position;
	if (newTreeNode.data)	{
		if (Hlp_Is_oCItem(newTreeNode.data))	{
			return newTreeNode.data;
		};
	};
	// until not end vobtree (no more child, next or parent):
	if (newTreeNode.next)	{
		newTreeNode = _^(newTreeNode.next);
		MEM_StackPos.position = label;
	};
	return 0;
};

//удалить vob
func void Vob_RemoveFromWorld(var int Vobptr)	//zCVob *
{
	//void __thiscall zCVob::RemoveVobFromWorld(void)    	0x00601C40
	CALL__thiscall(Vobptr, 6298688);
};


