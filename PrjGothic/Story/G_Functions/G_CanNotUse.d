/**************************************************************************

						НЕЛЬЗЯ ИСПОЛЬЗОВАТЬ

  Выдача сообщения о невозможности использования чего-то из-за недостаточной
величины атрибута nAttribute (нужно nValue).

  Вызывается движком. Теоретически может быть и не ГГ. Тогда сообщение не
показывается, но эффекты могут быть.
  
  Сюжетные особенности: для Когтя Белиара.
  
***************************************************************************/

func void G_CanNotUse(var int bIsPlayer,var int nAttribute,var int nValue)
{
	var string strMessage;
	var string strAttributeMissing;
	var int nAttributeValue;
	var int nDifference;
	var string strDifference;
	if(bIsPlayer == TRUE) // если это ГГ
	{
		// если это Коготь Белиара
		if((nAttribute == ATR_MANA_MAX) && (nValue == 666666))
		{
			// сообщение
			strMessage = PRINT_ADDON_BELIARSCOURSE_MISSING;
			// урон за наглость
			B_BlitzInArsch();
			// отметить, что ГГ знает, что не может использовать Коготь
			SC_FailedToEquipBeliarsWeapon = TRUE;
		}
		// иначе
		else
		{
			// проверить, какой атрибут
			if(nAttribute == ATR_HITPOINTS)
			{
				strAttributeMissing = PRINT_HITPOINTS_MISSING;
				nAttributeValue = self.attribute[ATR_HITPOINTS];
			}
			else if(nAttribute == ATR_HITPOINTS_MAX)
			{
				strAttributeMissing = PRINT_HITPOINTS_MAX_MISSING;
				nAttributeValue = self.attribute[ATR_HITPOINTS_MAX];
			}
			else if(nAttribute == ATR_MANA)
			{
				strAttributeMissing = PRINT_MANA_MISSING;
				nAttributeValue = self.attribute[ATR_MANA];
			}
			else if(nAttribute == ATR_MANA_MAX)
			{
				strAttributeMissing = PRINT_MANA_MAX_MISSING;
				nAttributeValue = self.attribute[ATR_MANA_MAX];
			}
			else if(nAttribute == ATR_STRENGTH)
			{
				strAttributeMissing = PRINT_STRENGTH_MISSING;
				nAttributeValue = self.attribute[ATR_STRENGTH];
			}
			else if(nAttribute == ATR_DEXTERITY)
			{
				strAttributeMissing = PRINT_DEXTERITY_MISSING;
				nAttributeValue = self.attribute[ATR_DEXTERITY];
			}
			else // неверный атрибут
			{
				strAttributeMissing = "";
				nAttributeValue = 0;
			};
			// слепить текст сообщения
			nDifference = nValue - nAttributeValue;
			strDifference = IntToString(nDifference);
			strMessage = strDifference;
			strMessage = ConcatStrings(strMessage," ");
			strMessage = ConcatStrings(strMessage,strAttributeMissing);
		};
		// вывести сообщение
		Print(strMessage);
	};
};

