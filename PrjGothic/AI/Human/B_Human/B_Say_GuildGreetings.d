/**************************************************************************

						ПРИВЕТСТВИЕ ГИЛЬДИИ

  B_Say_GuildGreetings		(slf,	oth)
  Персонаж slf (я) приветствует oth (он) в соответствии с гильдией.
Вызывается только для oth = ГГ.
   
  Содержит проверку гильдий для обоих.
  С небольшой вероятностью может выдать замечание о погоде.
  
  Связаные файлы:
 стандартные фразы					 		Story\SVM.d
 функция B_Say_Overlay						AI\Human\B_Human\B_Say_Overlay.d

***************************************************************************/

func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	// если я ополченец, а он - ополченец или паладин
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL)))
	{
		B_Say_Overlay(slf,oth,"$MILGREETINGS");	// приветствие ополченцев
		return;
	};
	
	// если я паладиг, а он - ополченец, паладин или маг огня
	if((slf.guild == GIL_PAL) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");	// приветствие паладинов
		return;
	};
	
	// если я маг огня, а он - паладин, послушник или маг огня
	if((slf.guild == GIL_KDF) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");	// приветствие магов огня
		return;
	};

	// Во всех остальных случаях
	
	// если идет дождь, с вероятностью 10% 
	var int zufall;
	zufall = Hlp_Random(100);
	if(Wld_IsRaining() && (zufall < 10))
	{
		B_Say_Overlay(slf,oth,"$WEATHER");	//сказать, что погода мерзкая
		return;
	};
};

