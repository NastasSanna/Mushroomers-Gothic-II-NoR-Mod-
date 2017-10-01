/**************************************************************************

					ВОСПРИЯТИЕ ПОВРЕЖДЕНИЯ МОНСТРОМ

  Монстр self (я) почувствовал урон от other (он).
  
  Функции:

  B_MM_AssessDamage() обрабатывает восприятие PERC_ASSESSDAMAGE и вызывается
в др. скриптах для монстров.

  Обычная реакция: напасть на атаковавшего. Монстру устанавливается
приоритет атаки (над едой).
  
  Сюжетные особенности: в случае использования Когтя Белиара и Священного 
молота против магического голема. Каменный страж очнется, получив урон.
  Спутники ГГ (призванные) не обращают внимания, если он их бьет. Скелеты 
не обрашают внимания на урон от скелетов-магов.

  Во время сражения монстр переключится на другую цель только после
второго попадания.
  
***************************************************************************/

func void B_MM_AssessDamage()
{
	B_OnDamage();

	// сообщить всем о драке
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);

	// установить приоритет атаки
	self.aivar[AIV_MM_Behaviour] = self.aivar[AIV_MM_Behaviour] | BEHAV_AttackPriority;
	
	// Особый урон ---------------------------------------------------------
	
	// для магического голема от Святого Молота
	var C_Npc MagGol;
	var C_Item OthWeap;
	// если у него есть Молот
	if(Npc_HasItems(other,Holy_Hammer_MIS) > 0)
	{
		// и если он им вооружен, а я магический голем
		MagGol = Hlp_GetNpc(MagicGolem);
		Npc_GetInvItem(other,Holy_Hammer_MIS);
		OthWeap = Npc_GetReadiedWeapon(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MagGol)) && (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)))
		{
			// убиться
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-1000);
			return;
		};
	};
	// если я каменный страж в ступоре - очнуться
	if((self.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	// ---------------------------------------------------------------------
	
	// если я предпочитаю сбежать
	if(C_MM_WantToFlee(self,other))
	{
		// так и сделать
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	
	// если он ГГ, а я с ним в команде
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		// не обращать внимания на его поведение
		return;
	};
	// если я скелет, а он - скелет-маг
	if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
	{
		// смириться с судьбой
		return;
	};	
	
	// если я не могу драться
	if HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_NoDamageReaction)
	{
		return;	// ничего не делать
	};
	
	// В боевом режиме ------------------------------------------------------
	
	// если я уже в режиме сражения
	if(Npc_IsInState(self,ZS_MM_Attack))
	{

		// если он не тот, кого я атаковал до этого
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			// но тот же, кто меня бил до этого
			if(self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other))
			{
				// переключиться на нового врага
				Npc_SetTarget(self,other);
			}
			// иначе - он ударил меня в первый раз
			else
			{
				// запомнить это
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};
		// больше ничего в боевом редиме не надо
		return;
	};
	
	// НЕ боевой режим -----------------------------------------------------
	
	// перейти в атаку
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_Attack,0,"");
};


