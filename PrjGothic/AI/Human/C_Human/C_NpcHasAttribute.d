	
// достаточная ли у npc величина атрибута nAttribute
func int C_NpcHasAttribute(var C_NPC npc, var int nAttribute, var int ValueNeeded)
{
	var string txt;
	var int dVal;
	// атрибут не указан
	if ((nAttribute < 0) || (ValueNeeded <= 0))
	{
		return TRUE;
	};
	// определить атрибут
	if(nAttribute == ATR_HITPOINTS)
	{
		txt = PRINT_HITPOINTS_MISSING;
		dVal = npc.attribute[ATR_HITPOINTS];
	}
	else if(nAttribute == ATR_HITPOINTS_MAX)
	{
		txt = PRINT_HITPOINTS_MAX_MISSING;
		dVal = npc.attribute[ATR_HITPOINTS_MAX];
	}
	else if(nAttribute == ATR_MANA)
	{
		txt = PRINT_MANA_MISSING;
		dVal = npc.attribute[ATR_MANA];
	}
	else if(nAttribute == ATR_MANA_MAX)
	{
		txt = PRINT_MANA_MAX_MISSING;
		dVal = npc.attribute[ATR_MANA_MAX];
	}
	else if(nAttribute == ATR_STRENGTH)
	{
		txt = PRINT_STRENGTH_MISSING;
		dVal = npc.attribute[ATR_STRENGTH];
	}
	else if(nAttribute == ATR_DEXTERITY)
	{
		txt = PRINT_DEXTERITY_MISSING;
		dVal = npc.attribute[ATR_DEXTERITY];
	}
	else // неверный атрибут
	{
		return TRUE;
	};	
	// хватает ли его
	dVal = ValueNeeded - dVal;
	if (dVal <= 0)
	{
		return TRUE;
	};
	// не хватает - вывести на экран сообщение
	txt = ConcatStrings(" ", txt);
	txt = ConcatStrings(IntToString(dVal), txt);
	PrintMissing(txt);
	return FALSE;
};
