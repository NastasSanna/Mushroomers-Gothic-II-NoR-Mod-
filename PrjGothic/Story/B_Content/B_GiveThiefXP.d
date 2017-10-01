
var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
const int ThiefXP = 50;

// дать √√ опыт за кражу
func void B_GiveThiefXP()
{
	// сколько людей подр€д √√ обобрал и не попалс€
	VictimCount = VictimCount + 1;
	// максимальный показатель √√ по числу жертв и воровской опытности (начинаем с 2)
	if(VictimLevel == 0)
	{
		VictimLevel = 2;
	};
	// если √√ сумел побить рекорд
	if(VictimCount >= VictimLevel)
	{
		// повысить воровской уровень
		ThiefLevel = ThiefLevel + 1;
		// запомнить новый рекорд
		VictimLevel = VictimCount + ThiefLevel;
	};
	// дать опыт
	// с учетом того, сколько раз обобрали конкретного персонажа
	var int TheftCnt;
	TheftCnt = self.aivar[AIV_PlayerHasPickedMyPocket] & ~PICKPOCKET_Once;
	if (TheftCnt > 0)
	{
		B_GivePlayerXP((ThiefXP + (ThiefLevel * 10)) / TheftCnt);
	}
	else
	{
		B_GivePlayerXP(ThiefXP + (ThiefLevel * 10));
	};
};

// снизить воровской уровень √√
func void B_ResetThiefLevel()
{
	// если число жертв выше воровского уровн€
	if(VictimCount > ThiefLevel)
	{
		// снизить число жертв
		VictimCount = VictimCount - 1;
	};
};

