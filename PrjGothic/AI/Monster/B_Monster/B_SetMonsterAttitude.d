
// –≈ ”–—»я

// установить отношение Attitude гильдии FromGuild ко всем гильди€м от ToGuild до Seperator (не включа€)
func void B_SetAttitudeToGuildRec(var int FromGuild, var int Attitude, var int ToGuild, var int Seperator)
{
	if (FromGuild >= 0) && (FromGuild < GIL_MAX) &&
		(ToGuild >= 0) && (ToGuild < Seperator) && (ToGuild < GIL_MAX)
	{
		Wld_SetGuildAttitude(fromGuild, attitude, ToGuild);
		B_SetAttitudeToGuildRec(fromGuild, attitude, ToGuild + 1, Seperator);
	};
};

// установить отношение Attitude всех гильдий от FromGuild до Seperator (не включа€) к гильдии ToGuild
func void B_SetAttitudeFromGuildRec(var int FromGuild, var int Attitude, var int ToGuild, var int Seperator)
{
	if (FromGuild >= 0) && (FromGuild < Seperator) && (FromGuild < GIL_MAX) &&
		(ToGuild >= 0) && (ToGuild < GIL_MAX)
	{
		Wld_SetGuildAttitude(fromGuild, attitude, ToGuild);
		B_SetAttitudeFromGuildRec(fromGuild + 1, attitude, ToGuild, Seperator);
	};
};


// ќ“ЌќЎ≈Ќ»я ѕќ √–”ѕѕјћ

// гильдии Guild ко всем люд€м
func void B_SetGuildToHumansAttitude(var int Guild, var int Attitude)
{
	B_SetAttitudeToGuildRec(Guild, attitude, GIL_NONE, GIL_SEPERATOR_HUM);
};

// всех людей к гильдии Guild
func void B_SetHumansToGuildAttitude(var int Attitude, var int Guild)
{
	B_SetAttitudeFromGuildRec(GIL_NONE, attitude, Guild, GIL_SEPERATOR_HUM);
	/*
	Wld_SetGuildAttitude(0, attitude, Guild);
	Wld_SetGuildAttitude(1, attitude, Guild);
	Wld_SetGuildAttitude(2, attitude, Guild);
	Wld_SetGuildAttitude(3, attitude, Guild);
	Wld_SetGuildAttitude(4, attitude, Guild);
	Wld_SetGuildAttitude(5, attitude, Guild);
	Wld_SetGuildAttitude(6, attitude, Guild);
	Wld_SetGuildAttitude(7, attitude, Guild);
	Wld_SetGuildAttitude(8, attitude, Guild);
	Wld_SetGuildAttitude(9, attitude, Guild);
	Wld_SetGuildAttitude(10, attitude, Guild);
	Wld_SetGuildAttitude(11, attitude, Guild);
	Wld_SetGuildAttitude(12, attitude, Guild);
	Wld_SetGuildAttitude(13, attitude, Guild);
	Wld_SetGuildAttitude(14, attitude, Guild);
	Wld_SetGuildAttitude(15, attitude, Guild);
	//*/
};

// гильдии Guild ко всем монстрам
func void B_SetGuildToMonstersAttitude(var int Guild, var int Attitude)
{
	B_SetAttitudeToGuildRec(Guild, attitude, GIL_SEPERATOR_HUM + 1, GIL_SEPERATOR_ORC);
};

// всех монстров к гильдии Guild
func void B_SetMonstersToGuildAttitude(var int Attitude, var int Guild)
{
	B_SetAttitudeFromGuildRec(GIL_SEPERATOR_HUM + 1, attitude, Guild, GIL_SEPERATOR_ORC);
};

// гильдии Guild ко всем оркам
func void B_SetGuildToOrcsAttitude(var int Guild, var int Attitude)
{
	B_SetAttitudeToGuildRec(Guild, attitude, GIL_SEPERATOR_ORC + 1, GIL_MAX);
};

// всех орков к гильдии Guild
func void B_SetOrcsToGuildAttitude(var int Attitude, var int Guild)
{
	B_SetAttitudeFromGuildRec(GIL_SEPERATOR_ORC + 1, attitude, Guild, GIL_MAX);
};

// гильдии Guild ко всем призванным создани€м
func void B_SetGuildToSummonedAttitude(var int Guild, var int Attitude)
{
	Wld_SetGuildAttitude(Guild, attitude, GIL_SUMMONED_WOLF);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SUMMONED_GOBBO_SKELETON);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SUMMONED_SKELETON);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SummonedZombie);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SUMMONED_GOLEM);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SummonedGuardian);
	Wld_SetGuildAttitude(Guild, attitude, GIL_SUMMONED_DEMON);
};

// гильдии Guild как дл€ нежити
func void B_SetUndeadAttitude(var int Guild)
{
	// враждебно ко всем
	B_SetAttitudeToGuildRec(Guild, ATT_HOSTILE, 0, GIL_MAX);
	// кроме ищущих, драконов, демонов и нежити
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_DMT);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_GOBBO_SKELETON);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_SKELETON);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_SKELETON_MAGE);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_ZOMBIE);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_SHADOWBEAST_SKELETON);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_DEMON);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_DRAGON);
	Wld_SetGuildAttitude(Guild,ATT_FRIENDLY,GIL_UNDEADORC);
	// нейтрально к м€сным жукам, големам и т.п.
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_MEATBUG);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_STONEGOLEM);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_FIREGOLEM);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_ICEGOLEM);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_SWAMPGOLEM);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_Stoneguardian);
	Wld_SetGuildAttitude(Guild,ATT_NEUTRAL,GIL_Gargoyle);
};


// люди ко всем агрессивным монстрам и оркам
func void B_SetHumansToMonstersAttitudeRec(var int Attitude, var int GuildMon)
{
	if (GuildMon < GIL_MAX)
	{
		B_SetHumansToGuildAttitude(Attitude, GuildMon);
		B_SetHumansToMonstersAttitudeRec(Attitude, GuildMon + 1);
	};
};

func void B_SetMonsterAttitude(var int fromGuild,var int attitude,var int toGuild)
{
	if(toGuild == GIL_SEPERATOR_HUM)
	{
		B_SetGuildToHumansAttitude(fromGuild, Attitude);
		/*Wld_SetGuildAttitude(fromGuild,attitude,GIL_NONE);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_PAL);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_MIL);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_VLK);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_KDF);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_NOV);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_DJG);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_SLD);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_BAU);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_BDT);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_STRF);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_OUT);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_PIR);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_KDW);*/
	}
	else if(fromGuild == GIL_SEPERATOR_HUM)
	{
		B_SetHumansToGuildAttitude(toGuild, Attitude);
		/*Wld_SetGuildAttitude(GIL_NONE,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_PAL,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_MIL,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_VLK,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_KDF,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_NOV,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_DJG,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_SLD,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_BAU,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_BDT,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_STRF,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_OUT,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_PIR,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_KDW,attitude,toGuild);*/
	}
	else
	{
		Wld_SetGuildAttitude(fromGuild,attitude,toGuild);
	};
};
