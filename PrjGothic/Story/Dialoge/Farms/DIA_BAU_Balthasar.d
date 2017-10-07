

instance DIA_Balthasar_EXIT(DIA_Proto_End)
{
	npc = BAU_932_Balthasar;
};

///////////////////////////// ТИЛЛ ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_Till_HowOurSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 10;
	condition = DIA_Balthasar_Till_HowOurSheep_cond;
	information = DIA_Balthasar_Till_HowOurSheep_info;
	description = "Как наши овечки?";
	permanent = TRUE;
};
func int DIA_Balthasar_Till_HowOurSheep_cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Balthasar_Till_HowOurSheep_info()
{
		AI_Output(other,self,"DIA_Balthasar_Till_HowOurSheep_14_00");	//Как наши овечки?
	AI_Output(self,other,"DIA_Balthasar_Till_HowOurSheep_05_01");	//Сам посмотри - как они довольны. Хорошо тут наверху...
};

///////////////////////////// ЕЛЕНА ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_Elena_HowYourSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 20;
	condition = DIA_Balthasar_Elena_HowYourSheep_cond;
	information = DIA_Balthasar_Elena_HowYourSheep_info;
	description = "Как твои овцы, Бальтазар?";
	permanent = TRUE;
};
func int DIA_Balthasar_Elena_HowYourSheep_cond()
{
	if (C_HeroIs_Elena()
		 || (!C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Balthasar_IsItYourSheep)))	{
		return TRUE;
	};
};
func void DIA_Balthasar_Elena_HowYourSheep_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_03_00");	//Как твои овцы, Бальтазар?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_07_00");	//Как твои овцы, Бальтазар?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_10_00");	//Как твои овцы, Бальтазар?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Balthasar_Elena_HowYourSheep_16_00");	//Как твои овцы, Бальтазар?
	};
	AI_Output(self,other,"DIA_Balthasar_Elena_HowYourSheep_05_01");	//Довольны жизнью.
};

///////////////////////////// ВСЕ ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_IsItYourSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 1;
	condition = DIA_Balthasar_IsItYourSheep_cond;
	information = DIA_Balthasar_IsItYourSheep_info;
	description = "Это твои овцы?";
};
func int DIA_Balthasar_IsItYourSheep_cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Balthasar_IsItYourSheep_info()
{
	if (hero.voice == 3)	{			//Одо/Руперт
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_03_00");	//Это твои овцы?
	} else if (hero.voice == 7)	{		//Талбин
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_07_00");	//Это твои овцы?
	} else if (hero.voice == 10)	{	//Эрол
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_10_00");	//Это твои овцы?
	} else	{							//Сара
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_16_00");	//Это твои овцы?
	};
	AI_Output(self,other,"DIA_Balthasar_IsItYourSheep_05_01");	//Эти овцы принадлежат Секобу. А я их пасу и ухаживаю за ними.
	AI_Output(self,other,"DIA_Balthasar_IsItYourSheep_05_02");	//Мое имя Бальтазар.
};
