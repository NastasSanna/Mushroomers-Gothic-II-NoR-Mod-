
func void B_CloseLogOnDeath(var C_NPC slf)
{
	/*
	if ( == LOG_Running)	{
		if (C_NpcIs(slf, ))	{
			MIS_ = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_);
		};
	};
	if ( == LOG_Running)	{
		if (C_NpcIs(slf, ))	{
			MIS_ = LOG_FAILED;
			B_LogEntry_Status(TOPIC_, LOG_FAILED, );
		};
	};
	//*/
	// Охотник против орков
	if (MIS_GrimbaldOrcs == LOG_Running)	{
		if (C_NpcIs(slf, OUT_1210_Grimbald))	{	// Гримбальд
			MIS_GrimbaldOrcs = LOG_FAILED;
			B_LogEntry_Status(TOPIC_GrimbaldOrcs, LOG_FAILED, TOPIC_GrimbaldOrcs_Failed_GrimbaldDead);
		};
	};
	//Голодные волки
	if (MIS_MalethWolves == LOG_Running)	{
		if (C_NpcIs(slf, BAU_954_Maleth))	{	//Малет
			MIS_MalethWolves = LOG_OBSOLETE;
			B_LogEntry_Status(TOPIC_MalethWolves, LOG_FAILED, TOPIC_MalethWolves_Fail_Dead);
		};
	};
	//Пропавший работник
	if (MIS_LostBau == LOG_Running)	{
		if (C_NpcIs(slf, BAU_952_Vino))	{	//Вино
			MIS_LostBau = LOG_FAILED;
			B_LogEntry_Status(TOPIC_LostBau, LOG_FAILED, TOPIC_LostBau_Fail_DeadVino);
		};
		if (C_NpcIs(slf, BAU_950_Lobart))	{	//Лобарт
			MIS_LostBau = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_LostBau);
		};
	};
	//Возвращаем Феллана к Ирине
	if (MIS_FellanGoHome == LOG_Running)	{
		if (C_NpcIs(slf, VLK_480_Fellan))	{	//Феллан
			MIS_FellanGoHome = LOG_FAILED;
			B_LogEntry_Status(TOPIC_FellanGoHome, LOG_FAILED, TOPIC_FellanGoHome_Fail_DeadFellan);
		};
		if (C_NpcIs(slf, VLK_478_Irene))	{	//Ирина
			MIS_FellanGoHome = LOG_FAILED;
			B_LogEntry_Status(TOPIC_FellanGoHome, LOG_FAILED, TOPIC_FellanGoHome_Fail_DeadIrene);
		};
		//кто нужен для починки молотка
		if ((C_NpcIs(slf, VLK_461_Carl) || C_NpcIs(slf, VLK_462_Thorben) || C_NpcIs(slf, VLK_442_Arbeiter)) && MIS_FellanGoHome_BrokenHammerGot_Once)	{	//Карл, Фабио
			MIS_FellanGoHome = LOG_FAILED;
			B_LogEntry_Status(TOPIC_FellanGoHome, LOG_FAILED, TOPIC_FellanGoHome_Fail_Hummer);
		};
	};
	//Ищем Трокара
	if (MIS_FindTrocar == LOG_Running)	{
		if (C_NpcIs(slf, OUT_1230_Trocar))	{	//а он уже помер
			MIS_FindTrocar = LOG_FAILED;
			B_LogEntry_Status(TOPIC_FindTrocar, LOG_FAILED, TOPIC_FindTrocar_FailDead);
		};
	};
	//Собираем рецепты для Грома
	if (MIS_Cookery == LOG_Running)	{
		if (C_NpcIs(slf, OUT_1204_Grom))	{	//сам Гром
			MIS_Cookery = LOG_FAILED;
			B_LogEntry_Status(TOPIC_Cookery, LOG_FAILED, TOPIC_Cookery_Fail_GromDead);
		};
		//у кого есть рецепты
		if (C_NpcIs(slf, BAU_913_Thekla) && !MIS_Cookery_TheklaTold)	{
			MIS_Cookery_TheklaTold = True;
			B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_TheklaDead);
		};
		if (C_NpcIs(slf, OUT_1203_Sagitta) && !MIS_Cookery_SagittaTold)	{
			MIS_Cookery_SagittaTold = True;
			B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_SagittaDead);
		};
		if (C_NpcIs(slf, BAU_951_Hilda) && !MIS_Cookery_HildaTold)	{
			MIS_Cookery_HildaTold = True;
			B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_HildaDead);
		};
		//Константино бессмертный
	};
	//Доставка почты. Все сложно
	if (MIS_KhorinisPost == LOG_Running)	{
		if (C_NpcIs(slf, BAU_952_Vino))	{	//Вино
			if (MIS_KhorinisPost_VinoDelivered)	{
				
			}
			else	{
				
			};
		};
		if (C_NpcIs(slf, BDT_801_Chief) && !MIS_KhorinisPost_VinoDelivered)	{	//контрабандисты
			MIS_KhorinisPost_FailChief = TRUE;
			B_LogEntry_KhorinisPost_FailChief();
		};
		if (C_NpcIs(slf, VLK_469_Halvor))	{
		};
		if (C_NpcIs(slf, VLK_421_Valentino))	{
		};
		if (C_NpcIs(slf, VLK_405_Fernando))	{
		};
		if (C_NpcIs(slf, VLK_407_Hakon))	{
		};
		if (C_NpcIs(slf, VLK_412_Harad))	{
		};
	};
	
	
	//=============================================
	//Царский щавель для Одо
	if (MIS_Odo_Wine == LOG_Running)	{
		if (C_NpcIs(slf, OUT_1203_Sagitta))	{	//Сагитта
			MIS_Odo_Wine = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Odo_Wine);
		};
		if (C_NpcIs(slf, NOV_601_Igaraz))	{	//Игарац
			MIS_Odo_Wine = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Odo_Wine);
		};
	};
	//Травы для мастера
	if (MIS_Odo_Herbs == LOG_Running)	{
		if (C_NpcIs(slf, KDF_506_Neoras))	{	//Мастер Неорас
			MIS_Odo_Herbs = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Odo_Herbs);
		};
	};
	//Сено-солома
	if (MIS_Odo_Straw == LOG_Running)	{
		if (C_NpcIs(slf, KDF_508_Gorax))	{
			MIS_Odo_Straw = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Odo_Straw);
		};
		if (C_NpcIs(slf, BAU_960_Bengar))	{	//у него берем сено
			MIS_Odo_Straw = LOG_FAILED;
			B_LogEntry_Status(TOPIC_Odo_Straw, LOG_FAILED, TOPIC_Odo_Straw_Bengar_Dead);
		};
		//Онар бессмертен
		//остальных можно пропустить
		if (C_NpcIs(slf, BAU_940_Akil) && !MIS_Odo_Straw_Akil[Straw_Price])	{
			MIS_Odo_Straw_Cnt += 1;
			B_LogEntry(TOPIC_Odo_Straw, TOPIC_Odo_Straw_Akil_Dead);
		};
		if (C_NpcIs(slf, BAU_950_Lobart) && !MIS_Odo_Straw_Lobart[Straw_Price])	{
			MIS_Odo_Straw_Cnt += 1;
			B_LogEntry(TOPIC_Odo_Straw, TOPIC_Odo_Straw_Lobart_Dead);
		};
		if (C_NpcIs(slf, BAU_930_Sekob) && !MIS_Odo_Straw_Sekob[Straw_Price])	{
			MIS_Odo_Straw_Cnt += 1;
			B_LogEntry(TOPIC_Odo_Straw, TOPIC_Odo_Straw_Sekob_Dead);
		};
	};
	//Охота
	if (MIS_Talbin_Hunt == LOG_Running)	{
		if (C_NpcIs(slf, VLK_413_Bosper))	{ //некому продавать
			MIS_Talbin_Hunt = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Talbin_Hunt);
		};
		if (C_NpcIs(slf, VLK_404_Lutero) && MIS_Talbin_Hunt_KeilerGot && !MIS_Talbin_Hunt_KeilerSold)	{ //ценитель клыков кабана слился
			B_LogEntry(TOPIC_Talbin_Hunt, TOPIC_Talbin_Hunt_KeilsFailDead);
		};
	};
	//MIS_Talbin_WhiteWolf  проверяем при смерти волка
	//Крестик
	if (MIS_Till_Pet == LOG_Running)	{
		if (C_NpcIs(slf, Molerat_Cross))	{
			MIS_Till_Pet = LOG_FAILED;
			B_LogEntry_Status(TOPIC_Till_Pet,LOG_FAILED,TOPIC_Till_Pet_Fail);
		};
	};
	//MIS_Elena_Present многоходовка. В любом случае, она не знает, что больше не найдет подарка
	//Грибы для Теклы
	if (MIS_Elena_TheklaSoup == LOG_Running)	{
		if (C_NpcIs(slf, BAU_913_Thekla))	{
			MIS_Elena_TheklaSoup = LOG_FAILED;
			B_LogEntry_Status(TOPIC_Elena_TheklaSoup,LOG_FAILED,TOPIC_Elena_TheklaSoup_FailDead);
		};
	};
	//долги Руперта - альтернативный способ избавиться
	if (MIS_Rupert_Debts == LOG_Running) {
		if (C_NpcIs(slf, VLK_414_Hanna) && !MIS_Rupert_Debts_Paid[Creditor_Hanna])	{
			MIS_Rupert_Debts_Paid[Creditor_Hanna] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Hanna_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_416_Matteo) && !MIS_Rupert_Debts_Paid[Creditor_Matteo])	{
			MIS_Rupert_Debts_Paid[Creditor_Matteo] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Matteo_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_408_Jora) && !MIS_Rupert_Debts_Paid[Creditor_Jora])	{
			MIS_Rupert_Debts_Paid[Creditor_Jora] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Jora_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_410_Baltram) && !MIS_Rupert_Debts_Paid[Creditor_Baltram])	{
			MIS_Rupert_Debts_Paid[Creditor_Baltram] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Baltram_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_431_Kardif) && !MIS_Rupert_Debts_Paid[Creditor_Kardif])	{
			MIS_Rupert_Debts_Paid[Creditor_Kardif] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Kardif_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_468_Canthar) && !MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
			MIS_Rupert_Debts_Paid[Creditor_Canthar] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Canthar_Dead);
			B_RupertPayDebt_All(0);
		};
		if (C_NpcIs(slf, VLK_484_Lehmar) && !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
			MIS_Rupert_Debts_Paid[Creditor_Lehmar] = TRUE;
			B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Dead);
			B_RupertPayDebt_All(0);
		};
	};
	//Старые друзья Сары еще живы?
	if (MIS_Sarah_OldFriends == LOG_Running)	{
		if (C_NpcIs(slf, VLK_471_Edda))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_EddaDead);
		};
		if (C_NpcIs(slf, VLK_476_Fenia))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_FeniaDead);
		};
		if (C_NpcIs(slf, VLK_431_Kardif))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_KardifDead);
		};
		if (C_NpcIs(slf, VLK_432_Moe))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_MoeDead);
		};
		if (C_NpcIs(slf, VLK_435_Nadja))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_NadjaDead);
		};
		if (C_NpcIs(slf, VLK_480_Fellan))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_FellanDead);
		};
		if (C_NpcIs(slf, VLK_478_Irene))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_IreneDead);
		};
		if (C_NpcIs(slf, VLK_437_Brahim))	{
			MIS_Sarah_OldFriends_DeadCount += 1;
			B_LogEntry(TOPIC_Sarah_OldFriends, TOPIC_Sarah_OldFriends_BrahimDead);
		};
		//все умерли :((
		if (MIS_Sarah_OldFriends_DeadCount == MIS_Sarah_OldFriends_CountAll) {
			MIS_Sarah_OldFriends = LOG_FAILED;
			B_LogEntry_Status(TOPIC_Sarah_OldFriends, LOG_FAILED, TOPIC_Sarah_OldFriends_FailAllDead);
		};

	};
	//Вредная привычка Нади
	if (MIS_Sarah_BadHabit == LOG_Running)	{
		if (C_NpcIs(slf, VLK_435_Nadja))	{
			MIS_Sarah_BadHabit = LOG_OBSOLETE;
			B_LogEntry_Obsolete(TOPIC_Sarah_BadHabit);
		};
	};
	
	//Ватрас бессмертный MIS_Erol_Plates	
};