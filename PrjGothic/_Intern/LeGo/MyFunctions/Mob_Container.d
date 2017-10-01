
//НЕ ТЕСТИРОВАЛОСЬ!

func int MobContainer_Remove(var int ptr_mob, var int ptr_itm)
//virtual oCItem * __thiscall oCMobContainer::Remove(class oCItem * int)	0x00726080	0	10
//virtual void __thiscall oCMobContainer::Remove(oCItem *)  	0x00725FF0		0	6

{
	const int oCMobContainer__Remove = 7495664;
	CALL_PtrParam(ptr_itm);
	CALL__thiscall(ptr_mob, oCMobContainer__Remove);
};

func int MobContainer_CreateContents(var int ptr_mob, var string contents)
//virtual void __thiscall oCMobContainer::CreateContents(zSTRING const &) 	0x00726190	0	7
{
	const int oCMobContainer__CreateContents = 7496080;
	CALL_zStringPtrParam(contents);
	CALL__thiscall(ptr_mob, oCMobContainer__CreateContents);
};

func int MobContainer_DeleteContents(var int ptr_mob)
//virtual void __thiscall oCItemContainer::DeleteContents(void)     	0x00709590	7378320	0	7
{
	const int oCMobContainer__DeleteContents = 7378320;
	CALL__thiscall(ptr_mob, oCMobContainer__DeleteContents);
};

//удаление предмета по инстанции
//??? только в открытом?
func void MobContainer_RemoveItem(var string MobName, var int ItmInst)
{
	var int MopPtr;	MopPtr = MEM_SearchVobByName(MobName);
	if (MopPtr == 0)	{return;};
	var oCMobContainer mob;	mob = _^(MopPtr);
	var zCListSort lst;	lst = _^(mob.containList_next);
	var oCItem itm;	
	var int DelItm;	
	
	var int loop;
	loop = MEM_StackPos.position;
	
	if (lst.data)	{
		itm = _^(lst.data);
		if (Hlp_IsItem(itm, ItmInst))	{
			DelItm = lst.data;
		};
	};
	
	if (lst.next)	{
		lst = _^(lst.next);
		MEM_StackPos.position = loop;
	};
	
	MobContainer_Remove(MopPtr,DelItm);
};
//*/

