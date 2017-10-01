
var int HERO_1hst2_OverlayOn;
const int HERO_DelayedFarOverlay = 0;

func void B_SetSkillOverlay(var c_NPC slf)
{
	if (slf.guild > GIL_SEPERATOR_HUM) { return; };
	if (Npc_IsInFightMode(slf,FMODE_FAR))	{
		HERO_DelayedFarOverlay = TRUE;
	}
	else	{
		var int sk;
		sk = Npc_GetTalentSkill(slf,NPC_TALENT_1H);
		if ((sk == 2) && HERO_1hst2_OverlayOn)	{
			sk = 1;
		};
		//MEM_Debug(ConcatStrings("NPC_TALENT_1H = ",IntToString(sk)));
		if (sk == 1)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_1HST1.MDS");
		}
		else if (sk == 2)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_1HST2.MDS");
		};
		sk = Npc_GetTalentSkill(slf,NPC_TALENT_2H);
		//MEM_Debug(ConcatStrings("NPC_TALENT_2H = ",IntToString(sk)));
		if (sk == 1)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_2HST1.MDS");
		}
		else if (sk == 2)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_2HST2.MDS");
		};
		sk = Npc_GetTalentSkill(slf,NPC_TALENT_BOW);
		//MEM_Debug(ConcatStrings("NPC_TALENT_BOW = ",IntToString(sk)));
		if (sk == 1)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_BOWT1.MDS");
		}
		else if (sk == 2)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_BOWT2.MDS");
		};
		sk = Npc_GetTalentSkill(slf,NPC_TALENT_CROSSBOW);
		//MEM_Debug(ConcatStrings("NPC_TALENT_CROSSBOW = ",IntToString(sk)));
		if (sk == 1)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_CBOWT1.MDS");
		}
		else if (sk == 2)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_CBOWT2.MDS");
		};
	};
};

var int LastPlayerInst;
var int Hero_Id;
//virtual void __thiscall oCNpc::SetAsPlayer(void)        	0x007426A0
const int oCNpc__SetAsPlayer = 7612064;

func void NPC_SetAsPlayer(var C_NPC slf)
{
	LastPlayerInst = Hlp_GetInstanceID(slf);
	Hero_Id = slf.id;
	CALL__thiscall(MEM_InstToPtr(slf), oCNpc__SetAsPlayer);
};
func void NPC_SetLastPlayer()
{
	if (LastPlayerInst != 0)	{
		var C_NPC LastPlayer;	LastPlayer = Hlp_GetNpc(LastPlayerInst);
		if (Hlp_IsValidNpc(LastPlayer))	{
			if (Hlp_GetInstanceID(hero) != LastPlayerInst)	{
				CALL__thiscall(MEM_InstToPtr(LastPlayer), oCNpc__SetAsPlayer);
				hero = Hlp_GetNpc(LastPlayer);
				B_SetSkillOverlay(hero);
			};
		};
	};
};

func int C_NpcIsHero(var C_Npc slf)
{
	// если ID ГГ и slf равны
	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Hero)) || (Hlp_GetInstanceID(slf) == LastPlayerInst))
	{
		return TRUE; // то это ГГ
	};
	// иначе
	return FALSE;	//это НЕ ГГ
};

// INVENTORY ===================================================

//распаковать инвентарь npc из текствой записи (в сейве)
func void NpcInv_UnpackAllItems(var C_NPC npc)
{
	//void __thiscall oCNpcInventory::UnpackAllItems(void)    	0x00710030		5	5
	const int oCNpcInventory__UnpackAllItems = 7405616;
	// 0x0668 - смещение oCNpcInventory от начала oCNpc
	const int oCNpcInventory__offset = 1640;
	CALL__thiscall(_@(npc) + oCNpcInventory__offset,oCNpcInventory__UnpackAllItems);
};

//вставить в инвентарь предмет по указателю
func int NpcInv_Insert(var int ptrInv, var int ptrItem)
{
	//virtual oCItem * __thiscall oCNpcInventory::Insert(class oCItem *)     	0x0070C730		0	7
	const int oCNpcInventory__Insert = 7391024;
	CALL_PtrParam(ptrItem);
	CALL__thiscall(ptrInv, oCNpcInventory__Insert);
	return CALL_RetValAsPtr();
};

//слить два инвентаря по указателям
//все предметы из ptrListFrom будут добавлены в ptrInvTo
func void NpcInv_Merge(var int ptrInvTo, var int ptrListFrom)
{
	var zCListSort list;	list = _^(ptrListFrom);
	var int loop;	loop = MEM_StackPos.position;
	if (list.data)	{
		NpcInv_Insert(ptrInvTo, list.data);
	};
	if (list.next)	{
		list = _^(list.next);
		MEM_StackPos.position = loop;
	};
};

//расщепить инвентарь
//возвращает список выдранных предметов по условию splitter
func int NpcInv_Split(var int ptrInvListHead, var func splitter)
{
	//trivia
	if (!ptrInvListHead)	{
		return 0;
	};
	var zCListSort head;	head = _^(ptrInvListHead);
	var zCListSort tail;	
	if (!head.next)	{
		return 0;
	};
	//result
	var int ptrSplitHead;	ptrSplitHead = 0;
	var zCListSort splitLast;
	var zCListSort tailNext;	
	//head split
	var int loop1;	loop1 = MEM_StackPos.position;
	MEM_Debug("NpcInv_Split 1");
	if (head.next)	{
		tail = _^(head.next);
		if (tail.data)	{
			MEM_PushIntParam(tail.data);
			MEM_Call(splitter);
			if (MEM_PopIntResult())	{
				if (ptrSplitHead == 0)	{
					ptrSplitHead = _@(tail);
					splitLast = _^(ptrSplitHead);
				}
				else	{
					splitLast.next = _@(tail);
					splitLast = _^(splitLast.next);
				};
				head.next = tail.next;
				MEM_StackPos.position = loop1;
			};
		};
	};
	//tail split
	if (head.next)	{
		tail = _^(head.next);
		var int loop2;	loop2 = MEM_StackPos.position;
		MEM_Debug("NpcInv_Split 2");
		if (tail.next)	{
			tailNext = _^(tail.next);
			if (tailNext.data)	{
				MEM_PushIntParam(tailNext.data);
				MEM_Call(splitter);
				if (MEM_PopIntResult())	{
					if (ptrSplitHead == 0)	{
						ptrSplitHead = _@(tailNext);
						splitLast = _^(ptrSplitHead);
					}
					else	{
						splitLast.next = _@(tailNext);
						splitLast = _^(splitLast.next);
					};
					if (tailNext.next)	{
						MEM_Debug("NpcInv_Split 3");
						tail.next = tailNext.next;
						MEM_StackPos.position = loop2;
					};
				};
				if (tail.next)	{
					MEM_Debug("NpcInv_Split 4");
					tail = _^(tail.next);
					MEM_StackPos.position = loop2;
				};
			};
		};
	};
	return ptrSplitHead;
};

func int NpcInv_SetPrices(var int ptrInvList, var func setPrice)
{
	var zCListSort list;	list = _^(ptrInvList);
	var int loop;	loop = MEM_StackPos.position;
	if (list.data)	{
		MEM_PushIntParam(list.data);
		MEM_Call(setPrice);
	};
	if (list.next)	{
		list = _^(list.next);
		MEM_StackPos.position = loop;
	};
};


