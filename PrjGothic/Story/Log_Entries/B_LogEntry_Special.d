
//====================================================

func void B_LogEntry_Elena_Present(var string entry)
{
	MIS_Elena_Present_FoundCnt = +1;
	if (MIS_Elena_Present_FoundCnt == 1)	{
		B_GivePlayerXP(XP_Elena_PresentFound1);
		B_LogEntry(TOPIC_Elena_Present,ConcatStrings(entry, TOPIC_Elena_Present_Add1));
	}
	else if (MIS_Elena_Present_FoundCnt == 2)	{
		B_GivePlayerXP(XP_Elena_PresentFound2);
		B_LogEntry(TOPIC_Elena_Present,ConcatStrings(entry, TOPIC_Elena_Present_Add2));
	}
	else if (MIS_Elena_Present_FoundCnt == 3)	{
		B_GivePlayerXP(XP_Elena_PresentFound3);
		B_LogEntry(TOPIC_Elena_Present,ConcatStrings(entry, TOPIC_Elena_Present_Add3));
	}
	else	{
		B_LogEntry(TOPIC_Elena_Present,entry);
	};
};

func void B_LogEntry_Elena_PresentGot(var string entry)
{
	MIS_Elena_Present_ReadyCnt += 1;
	B_LogEntry_Status(TOPIC_Elena_Present, LOG_SUCCESS, entry);
};

func void B_LogEntry_Elena_CupGot(var string entry)
{
	MIS_Elena_Present_CupsCnt += 1;
	B_LogEntry(TOPIC_Elena_Present,entry);
	//нашли оба кубка и Лемар не отобрал
	if ((MIS_Elena_Present_CupsCnt == 2)
		 && (MIS_Elena_Present_LehamarAskedCupBack != MIS_Elena_Present_Lehamar_GotByForce)
		 && (MIS_Elena_Present_LehamarAskedCupBack != MIS_Elena_Present_Lehamar_Returned))
	{
		//???
		MIS_Elena_Present = LOG_SUCCESS;
		B_GivePlayerXP(XP_Elena_CupsGot);
		B_LogEntry_Elena_PresentGot(TOPIC_Elena_Present_CupsBoth);
	};
};

//====================================================
//квест завершен?
func void B_LogEntry_Sarah_OldFriends(var string entry)
{
	MIS_Sarah_OldFriends_Count += 1;
	//со всеми поговорили?
	if (MIS_Sarah_OldFriends_Count == MIS_Sarah_OldFriends_CountAll) {
		B_GivePlayerXP(XP_Sarah_OldFriends_Success);
		MIS_Sarah_OldFriends = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_Sarah_OldFriends,LOG_SUCCESS,entry);
	}
	else	{
		B_GivePlayerXP(XP_Sarah_Talked);
		B_LogEntry(TOPIC_Sarah_OldFriends,entry);
	};
};

//====================================================
//доставка товаров Халвора
func void B_LogEntry_HalvorPost(var string entry)
{
	B_LogEntry(TOPIC_KhorinisPost,entry);
	//всем отнесли?
	if (MIS_KhorinisPost_ValentinoDelivered && MIS_KhorinisPost_FernandoDelivered && MIS_KhorinisPost_HakonDelivered)
	{
		B_GivePlayerXP(XP_KhorinisPost_HalvorToAll);
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_HalvorAll);
	};
};
//конец квеста может быть у Халвора или Гарада 
func void B_LogEntry_KhorinisPost_SuccessAll(var string entry)
{
	//всем все отнесли?
	if (MIS_KhorinisPost_HalvorShareGiven && (!MIS_KhorinisPost_Stage_FromHakon || MIS_KhorinisPost_HaradDelivered)) {
		B_GivePlayerXP(XP_KhorinisPost_Success);
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,entry);
	}
	else	{
		B_LogEntry(TOPIC_KhorinisPost,entry);
	};
};
//не повезло с бандитами
func void B_LogEntry_KhorinisPost_FailChief()
{
	if (MIS_KhorinisPost == LOG_Running)	{
		if (MIS_KhorinisPost_FailChief) {
			MIS_KhorinisPost = LOG_FAILED;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_VinoFailed);
		};
	};
};


//====================================================
//квест завершен
func void B_LogEntry_Cookery_SuccessAll(var string entry)
{
	//все рецепты нашли?
	B_LogEntry(TOPIC_Cookery,entry);
	if (MIS_Cookery_TheklaTold && MIS_Cookery_HildaTold && MIS_Cookery_SagittaTold && MIS_Cookery_ConstantinoTold
		// а специи?
		&& (MIS_Cookery_SpicesGiven || !MIS_Cookery_AskSpices)) {
		B_GivePlayerXP(XP_Cookery_Success);
		MIS_Cookery = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_Cookery,LOG_SUCCESS,TOPIC_Cookery_Success);
	};
};
//====================================================

func void B_LogEntry_Talbin_Hunt(var string entry)
{
	if (MIS_Talbin_Hunt_CrawlerMandibles && MIS_Talbin_Hunt_KeilerSold)	{
		B_LogEntry_Status(TOPIC_Talbin_Hunt,LOG_SUCCESS,entry);
		MIS_Talbin_Hunt = LOG_SUCCESS;
	}
	else	{
		B_LogEntry(TOPIC_Talbin_Hunt,entry);
	};
};

//====================================================
//отравление грибами
var int B_LogNote_Poison_Once;
func void B_LogNote_Poison()
{
	if (!B_LogNote_Poison_Once) {
		B_LogNote_Poison_Once = TRUE;
		B_LogNote(TOPIC_Poison,TOPIC_Poison_Healer);
		if (PATRONGOD == PATRONGOD_Innos)	{
			B_LogNote(TOPIC_Poison,TOPIC_Poison_Innos);
		};
	};
};

