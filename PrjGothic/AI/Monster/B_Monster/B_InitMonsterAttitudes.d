

func void B_InitMonsterAttitudes()
{
	// Àﬁƒ»
	B_SetHumansToGuildAttitude(ATT_NEUTRAL, GIL_MEATBUG);
	B_SetHumansToGuildAttitude(ATT_FRIENDLY, GIL_SHEEP);
	
	B_SetHumansToMonstersAttitudeRec(ATT_HOSTILE, GIL_SHEEP + 1);
	
	B_SetMonsterAttitude(GIL_SEPERATOR_HUM,ATT_NEUTRAL,GIL_FRIENDLY_ORC);

	B_SetAttitudeToGuildRec(GIL_DMT,ATT_NEUTRAL, GIL_SEPERATOR_HUM + 1, GIL_MAX);
	
	// Ãﬂ—ÕŒ… ∆” 
	B_SetAttitudeToGuildRec(GIL_MEATBUG,ATT_NEUTRAL, 0, GIL_MAX);

	// Œ¬÷¿
	B_SetAttitudeToGuildRec(GIL_SHEEP,ATT_NEUTRAL,0, GIL_MAX);
	B_SetMonsterAttitude(GIL_SHEEP,ATT_HOSTILE,GIL_WOLF);
	B_SetMonsterAttitude(GIL_SHEEP,ATT_HOSTILE,GIL_SNAPPER);
	B_SetMonsterAttitude(GIL_SHEEP,ATT_HOSTILE,GIL_SHADOWBEAST);
	
	// √Œ¡À»Õ
	B_SetGuildToHumansAttitude(GIL_GOBBO,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_GOBBO,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_GOBBO,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_GOBBO,ATT_FRIENDLY,GIL_GOBBO);
	B_SetGuildToSummonedAttitude(GIL_GOBBO,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_GOBBO,ATT_NEUTRAL);
	
	// — ≈À≈“ √Œ¡À»Õ¿
	B_SetGuildToHumansAttitude(GIL_GOBBO_SKELETON,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_GOBBO_SKELETON,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_FRIENDLY,GIL_GOBBO_SKELETON);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_MEATBUG);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_DRAGON);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_SKELETON);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_SKELETON_MAGE);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_ZOMBIE);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_SHADOWBEAST_SKELETON);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_STONEGOLEM);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_FIREGOLEM);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_ICEGOLEM);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL,GIL_DEMON);
	
	B_SetGuildToOrcsAttitude(GIL_GOBBO_SKELETON,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_GOBBO_SKELETON,ATT_HOSTILE,GIL_FRIENDLY_ORC);
	
	// œ–»«¬¿ÕÕ€… — ≈À≈“ √Œ¡À»Õ¿
	B_SetGuildToHumansAttitude(GIL_SUMMONED_GOBBO_SKELETON,ATT_HOSTILE);
	
	B_SetGuildToMonstersAttitude(GIL_SUMMONED_GOBBO_SKELETON,ATT_HOSTILE);
	B_SetGuildToSummonedAttitude(GIL_SUMMONED_GOBBO_SKELETON,ATT_NEUTRAL);

	B_SetGuildToOrcsAttitude(GIL_SUMMONED_GOBBO_SKELETON,ATT_HOSTILE);
	
	// œ¿ƒ¿À‹Ÿ»  /  ”—¿◊
	B_SetGuildToHumansAttitude(GIL_SCAVENGER,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SCAVENGER,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_SCAVENGER,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_SCAVENGER,ATT_FRIENDLY,GIL_SCAVENGER);
	
	B_SetGuildToOrcsAttitude(GIL_SCAVENGER,ATT_NEUTRAL);
	
	// √»√¿Õ“— ¿ﬂ  –€—¿
	B_SetGuildToHumansAttitude(GIL_Giant_Rat,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Giant_Rat,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_Giant_Rat,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_Giant_Rat,ATT_FRIENDLY,GIL_Giant_Rat);
	
	B_SetGuildToOrcsAttitude(GIL_Giant_Rat,ATT_NEUTRAL);
		
	// √»√¿Õ“— »… ∆” 
	B_SetGuildToHumansAttitude(GIL_GIANT_BUG,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_GIANT_BUG,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_GIANT_BUG,ATT_NEUTRAL);
	
	B_SetGuildToOrcsAttitude(GIL_GIANT_BUG,ATT_NEUTRAL);
	
	// ÿ≈–ÿ≈Õ‹
	B_SetGuildToHumansAttitude(GIL_BLOODFLY,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_BLOODFLY,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_BLOODFLY,ATT_NEUTRAL);
	
	B_SetGuildToOrcsAttitude(GIL_BLOODFLY,ATT_NEUTRAL);	
	
	// ¬¿–¿Õ
	B_SetGuildToHumansAttitude(GIL_WARAN,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_WARAN,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_WARAN,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_WARAN,ATT_FRIENDLY,GIL_WARAN);
	
	B_SetGuildToOrcsAttitude(GIL_WARAN,ATT_NEUTRAL);	

	// ¬ŒÀ 
	B_SetGuildToHumansAttitude(GIL_WOLF,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_WOLF,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_WOLF,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_WOLF,ATT_FRIENDLY,GIL_WOLF);
	B_SetMonsterAttitude(GIL_WOLF,ATT_HOSTILE,GIL_SHEEP);
	B_SetMonsterAttitude(GIL_WOLF,ATT_HOSTILE,GIL_SCAVENGER);
	B_SetMonsterAttitude(GIL_WOLF,ATT_HOSTILE,GIL_Giant_Rat);
	B_SetMonsterAttitude(GIL_WOLF,ATT_HOSTILE,GIL_MOLERAT);
	
	B_SetGuildToOrcsAttitude(GIL_WOLF,ATT_NEUTRAL);
	
	// œ–»«¬¿ÕÕ€… ¬ŒÀ 
	B_SetGuildToHumansAttitude(GIL_SUMMONED_WOLF,ATT_HOSTILE);
	
	B_SetMonsterAttitude(GIL_SUMMONED_WOLF,ATT_NEUTRAL,GIL_MEATBUG);
	B_SetMonsterAttitude(GIL_SUMMONED_WOLF,ATT_NEUTRAL,GIL_SHEEP);
	B_SetAttitudeToGuildRec(GIL_SUMMONED_WOLF, ATT_HOSTILE, GIL_SHEEP + 1, GIL_MAX);
	B_SetGuildToSummonedAttitude(GIL_SUMMONED_WOLF, ATT_NEUTRAL); 
	B_SetMonsterAttitude(GIL_SUMMONED_WOLF,ATT_NEUTRAL,GIL_FRIENDLY_ORC);

	//  ¿¡¿Õ
	B_SetGuildToHumansAttitude(GIL_Keiler,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Keiler,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_Keiler,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_Keiler,ATT_HOSTILE,GIL_WOLF);
	B_SetMonsterAttitude(GIL_Keiler,ATT_HOSTILE,GIL_SUMMONED_WOLF);
	B_SetMonsterAttitude(GIL_Keiler,ATT_HOSTILE,GIL_SHADOWBEAST);
	B_SetMonsterAttitude(GIL_Keiler,ATT_HOSTILE,GIL_MOLERAT);
	
	B_SetGuildToOrcsAttitude(GIL_Keiler,ATT_NEUTRAL);

	// œŒÀ«”Õ€
	B_SetAttitudeToGuildRec(GIL_MINECRAWLER, ATT_HOSTILE, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_FRIENDLY,GIL_MINECRAWLER);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_NEUTRAL,GIL_MEATBUG);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_NEUTRAL,GIL_STONEGOLEM);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_NEUTRAL,GIL_FIREGOLEM);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_NEUTRAL,GIL_ICEGOLEM);
	B_SetMonsterAttitude(GIL_MINECRAWLER,ATT_NEUTRAL,GIL_SUMMONED_GOLEM);

	// ÿÕ€√
	B_SetGuildToHumansAttitude(GIL_LURKER,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_LURKER,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_LURKER,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_LURKER,ATT_HOSTILE,GIL_GOBBO);
	
	B_SetGuildToOrcsAttitude(GIL_LURKER,ATT_NEUTRAL);	

	// — ≈À≈“
	B_SetUndeadAttitude(GIL_SKELETON);
	
	// œ–»«¬¿ÕÕ€… — ≈À≈“
	B_SetAttitudeToGuildRec(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 0, GIL_MAX);
	B_SetGuildToSummonedAttitude(GIL_SUMMONED_SKELETON,ATT_NEUTRAL);
	B_SetGuildToHumansAttitude(GIL_SUMMONED_SKELETON,ATT_NEUTRAL);
	B_SetHumansToGuildAttitude(ATT_ANGRY,GIL_SUMMONED_SKELETON);
	B_SetMonsterAttitude(GIL_SUMMONED_SKELETON,ATT_NEUTRAL,GIL_MEATBUG);
	B_SetMonsterAttitude(GIL_SUMMONED_SKELETON,ATT_NEUTRAL,GIL_SHEEP);
	B_SetMonsterAttitude(GIL_SUMMONED_SKELETON,ATT_NEUTRAL,GIL_FRIENDLY_ORC);

	// — ≈À≈“_Ã¿√
	B_SetUndeadAttitude(GIL_SKELETON_MAGE);

	// «ŒÃ¡»
	B_SetUndeadAttitude(GIL_ZOMBIE);

	// √ÀŒ–’
	B_SetGuildToHumansAttitude(GIL_SNAPPER,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_SNAPPER,ATT_NEUTRAL);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_FRIENDLY,GIL_SNAPPER);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_SHEEP);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_MOLERAT);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_SCAVENGER);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_Giant_Rat);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_GOBBO);
	B_SetMonsterAttitude(GIL_SNAPPER,ATT_HOSTILE,GIL_ZOMBIE);
	
	B_SetGuildToOrcsAttitude(GIL_SNAPPER,ATT_NEUTRAL);	

	// Ã–¿ Œ–»—
	B_SetGuildToHumansAttitude(GIL_SHADOWBEAST,ATT_HOSTILE);
	
	B_SetGuildToMonstersAttitude(GIL_SHADOWBEAST,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_SHADOWBEAST,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SHADOWBEAST,ATT_HOSTILE,GIL_SHEEP);
	B_SetMonsterAttitude(GIL_SHADOWBEAST,ATT_HOSTILE,GIL_MOLERAT);
	B_SetMonsterAttitude(GIL_SHADOWBEAST,ATT_HOSTILE,GIL_SCAVENGER);
	B_SetMonsterAttitude(GIL_SHADOWBEAST,ATT_HOSTILE,GIL_Giant_Rat);
	B_SetMonsterAttitude(GIL_SHADOWBEAST,ATT_HOSTILE,GIL_SHADOWBEAST_SKELETON);
	
	B_SetGuildToOrcsAttitude(GIL_SHADOWBEAST,ATT_HOSTILE);	

	// — ≈À≈“ Ã–¿ Œ–»—¿
	B_SetUndeadAttitude(GIL_SHADOWBEAST_SKELETON);

	// √¿–œ»ﬂ
	B_SetGuildToHumansAttitude(GIL_HARPY,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_HARPY,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_HARPY,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_HARPY,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_HARPY,ATT_FRIENDLY,GIL_HARPY);
	B_SetMonsterAttitude(GIL_HARPY,ATT_HOSTILE,GIL_SHEEP);
	
	B_SetGuildToOrcsAttitude(GIL_HARPY,ATT_NEUTRAL);	
	
	//  ¿Ã≈ÕÕ€… √ŒÀ≈Ã
	B_SetGuildToHumansAttitude(GIL_STONEGOLEM,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_STONEGOLEM,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_STONEGOLEM,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_STONEGOLEM,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_STONEGOLEM,ATT_NEUTRAL);	
	
	// Œ√Õ≈ÕÕ€… √ŒÀ≈Ã
	B_SetGuildToHumansAttitude(GIL_FIREGOLEM,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_FIREGOLEM,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_FIREGOLEM,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_FIREGOLEM,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_FIREGOLEM,ATT_NEUTRAL);	

	// À≈ƒﬂÕŒ… √ŒÀ≈Ã
	B_SetGuildToHumansAttitude(GIL_ICEGOLEM,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_ICEGOLEM,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_ICEGOLEM,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_ICEGOLEM,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_ICEGOLEM,ATT_NEUTRAL);	

	// œ–»«¬¿ÕÕ€… √ŒÀ≈Ã
	B_SetAttitudeToGuildRec(GIL_SUMMONED_GOLEM, ATT_HOSTILE, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_SUMMONED_GOLEM,ATT_NEUTRAL,GIL_MEATBUG);
	B_SetMonsterAttitude(GIL_SUMMONED_GOLEM,ATT_NEUTRAL,GIL_FRIENDLY_ORC);

	// ƒ≈ÃŒÕ
	B_SetGuildToHumansAttitude(GIL_DEMON,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_DEMON,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_DEMON,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_DEMON,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_DEMON,ATT_FRIENDLY,GIL_DEMON);
	B_SetMonsterAttitude(GIL_DEMON,ATT_FRIENDLY,GIL_DRAGON);
	
	B_SetGuildToOrcsAttitude(GIL_DEMON,ATT_NEUTRAL);	

	// œ–»«¬¿ÕÕ€… ƒ≈ÃŒÕ
	B_SetAttitudeToGuildRec(GIL_SUMMONED_DEMON, ATT_HOSTILE, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_SUMMONED_DEMON,ATT_NEUTRAL,GIL_MEATBUG);

	// “–ŒÀÀ‹
	B_SetGuildToHumansAttitude(GIL_TROLL,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_TROLL,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_TROLL,ATT_NEUTRAL);
	
	B_SetGuildToOrcsAttitude(GIL_TROLL,ATT_NEUTRAL);	
	
	// ¡ŒÀŒ“Œ∆Œ–
	B_SetGuildToHumansAttitude(GIL_SWAMPSHARK,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SWAMPSHARK,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_SWAMPSHARK,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_SWAMPSHARK,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SWAMPSHARK,ATT_FRIENDLY,GIL_SWAMPSHARK);
	
	B_SetGuildToOrcsAttitude(GIL_SWAMPSHARK,ATT_NEUTRAL);	
	
	// ƒ–¿ ŒÕ
	B_SetGuildToHumansAttitude(GIL_DRAGON,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_DRAGON,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_DRAGON,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_DRAGON,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_DRAGON,ATT_NEUTRAL);	

	//  –Œ“Œ –€—
	B_SetGuildToHumansAttitude(GIL_MOLERAT,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_MOLERAT,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_MOLERAT,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_MOLERAT,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_MOLERAT,ATT_FRIENDLY,GIL_MOLERAT);
	
	B_SetGuildToOrcsAttitude(GIL_MOLERAT,ATT_NEUTRAL);	
	
	// Œ– 
	B_SetGuildToHumansAttitude(GIL_ORC,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_ORC,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_ORC,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_ORC,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_ORC,ATT_FRIENDLY,GIL_DRAGON);
	B_SetMonsterAttitude(GIL_ORC,ATT_HOSTILE,GIL_SHADOWBEAST);
	
	B_SetGuildToOrcsAttitude(GIL_ORC,ATT_FRIENDLY);	
	B_SetMonsterAttitude(GIL_ORC,ATT_NEUTRAL,GIL_UNDEADORC);
	
	// ƒ–”∆≈—“¬≈ÕÕ€… Œ– 
	B_SetAttitudeToGuildRec(GIL_FRIENDLY_ORC, ATT_NEUTRAL, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_FRIENDLY_ORC,ATT_FRIENDLY,GIL_FRIENDLY_ORC);

	// Œ– -Õ≈∆»“‹
	B_SetUndeadAttitude(GIL_UNDEADORC);

	// ◊≈ÀŒ¬≈ -ﬂŸ≈–
	B_SetGuildToHumansAttitude(GIL_DRACONIAN,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_DRACONIAN,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_DRACONIAN,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_DRACONIAN,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_DRACONIAN,ATT_FRIENDLY,GIL_DRAGON);
	B_SetMonsterAttitude(GIL_DRACONIAN,ATT_HOSTILE,GIL_Alligator);
	
	B_SetGuildToOrcsAttitude(GIL_DRACONIAN,ATT_FRIENDLY);	
	B_SetMonsterAttitude(GIL_DRACONIAN,ATT_NEUTRAL,GIL_UNDEADORC);

	// ¿ÀÀ»√¿“Œ–
	B_SetGuildToHumansAttitude(GIL_Alligator,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Alligator,ATT_NEUTRAL,GIL_DMT);

	B_SetGuildToMonstersAttitude(GIL_Alligator,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_Alligator,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Alligator,ATT_HOSTILE,GIL_SHEEP);
	B_SetMonsterAttitude(GIL_Alligator,ATT_HOSTILE,GIL_MOLERAT);
	B_SetMonsterAttitude(GIL_Alligator,ATT_FRIENDLY,GIL_Alligator);
	
	B_SetGuildToOrcsAttitude(GIL_Alligator,ATT_HOSTILE);
	
	// ¡ŒÀŒ“Õ€… √ŒÀ≈Ã
	B_SetGuildToHumansAttitude(GIL_SWAMPGOLEM,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SWAMPGOLEM,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_SWAMPGOLEM,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_SWAMPGOLEM,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_SWAMPGOLEM,ATT_FRIENDLY,GIL_SWAMPGOLEM);
	
	B_SetGuildToOrcsAttitude(GIL_SWAMPGOLEM,ATT_NEUTRAL);	

	//  ¿Ã≈ÕÕ€… —“–¿∆
	B_SetGuildToHumansAttitude(GIL_Stoneguardian,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Stoneguardian,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_Stoneguardian,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_Stoneguardian,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_Stoneguardian,ATT_NEUTRAL);	

	// Œ√Õ≈ÕÕ€… ƒ”’ Ã–¿ Œ–»—¿
	B_SetGuildToHumansAttitude(GIL_Gargoyle,ATT_HOSTILE);
	B_SetMonsterAttitude(GIL_Stoneguardian,ATT_NEUTRAL,GIL_DMT);
	
	B_SetGuildToMonstersAttitude(GIL_Gargoyle,ATT_NEUTRAL);
	B_SetGuildToSummonedAttitude(GIL_Gargoyle,ATT_HOSTILE);
	
	B_SetGuildToOrcsAttitude(GIL_Gargoyle,ATT_NEUTRAL);	
	
	// œ–»«¬¿ÕÕ€… √ŒÀ≈Ã
	B_SetAttitudeToGuildRec(GIL_SummonedGuardian, ATT_HOSTILE, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_SummonedGuardian,ATT_NEUTRAL,GIL_SummonedGuardian);
	B_SetMonsterAttitude(GIL_SummonedGuardian,ATT_NEUTRAL,GIL_MEATBUG);

	// œ–»«¬¿ÕÕ€… «ŒÃ¡»
	B_SetAttitudeToGuildRec(GIL_SummonedZombie, ATT_HOSTILE, 0, GIL_MAX);
	B_SetMonsterAttitude(GIL_SummonedZombie,ATT_NEUTRAL,GIL_SummonedZombie);
	B_SetMonsterAttitude(GIL_SummonedZombie,ATT_NEUTRAL,GIL_MEATBUG);
};

//*/
