
// дать √√ опыт за прочтение книжки
// возвращает TRUE, если книга была успешно прочитана
func int B_GivePlayerXP_Bookstand(var int XPGiven)
{
	// если ужа давали
	if(XPGiven == TRUE)
	{
		return TRUE; 	// больше не надо
	};
	
	// иначе
	B_GivePlayerXP(XP_Bookstand);	// дать опыт
	B_GiveAchievement_Archivist();
	return TRUE; 	// прочитать
};