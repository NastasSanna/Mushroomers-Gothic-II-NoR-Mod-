/**************************************************************************

							ВОСПРИЯТИЕ УБИЙСТВА
 
  Персонаж self (я) увидел, как other (убийца) убил victim (жертва).

  B_AssessMurder() вызывается для только обрабтки восприятия 
PERC_ASSESSMURDER. Вызывает обработчик восприятия врага.

  Обычная реакция: напасть на убийцу.

  Сюжетные особенности: убийство "квестовых" овец обрабатывается как для
обычных персонажей.

***************************************************************************/



func void B_AssessMurder()
{
	
	// НЕ обращать внимания, если -------------------------------------------
	
	// я и есть убийца
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(other))
	{
		return;
	};
	
	// я слишком далеко по горизонтали
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	
	// я слишком далеко по вертикали 
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	
	// я не вижу по прямой ни нападавшего, ни жертву
	if(!Npc_CanSeeNpcFreeLOS(self,other) && !Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	
	// он не только убийца, но и враг
	if(B_AssessEnemy())
	{
		return;
	};
	
	// ОВЦЫ ------------------------------------------------------------------
	
	// если жертва - овца, но не  квестовая
	if((victim.guild == GIL_SHEEP) && !HasFlags(victim.aivar[AIV_StoryFlags], STORY_Sheep))
	{
		// и если я не потерплю нападения на овцу,
		if(C_WantToAttackSheepKiller(self,other))
		{
			// то напасть на убийцу
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		// а если потерплю, но я несу охрану ворот,
		else if(C_NpcIsGateGuard(self))
		{
			// то запомнить, что напавший совершил преступление
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
			// но сделать и другие проверки //NS: в B_AssessFightSound здесь return;
		};
	};
	
	
	// МОНСТРЫ ----------------------------------------------------------------
	
	// если монстр убил монстра
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return; // не вмешиваться
	};
	
	// если убийца - монстр, а убит, соответственно, человек
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		// то напасть на монстра
		B_Attack(self,other,AR_MonsterMurderedHuman,0);
		return;
	};
	
	// если убит монстр, а убийца, соответственно, человек
	if(victim.guild > GIL_SEPERATOR_HUM)
	{
		return; // не обращать внимания
	};
	
	// ------------------------------------------------------------------------
	
	// если мне запрещено нападать на врагов
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		// отменить запрет
		self.aivar[AIV_EnemyOverride] = FALSE;
		// сбросить остальные действия и восприятия
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		// если убийца еще в игре
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			// напасть на него, как на врага
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		return;
	};
	
	// еще НЕ реагировать, если-------------------------------------------------
	
	// жертва из враждебной гильдии, а убийца - из дружественной или нейтральной	
	if(((C_NpcGetAttitude(self,victim) == ATT_HOSTILE) || (C_NpcGetAttitude(self,victim) == ATT_ANGRY))
		&& ((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) || (C_NpcGetAttitude(self,other) == ATT_NEUTRAL)))
	{
		return;
	};
	
	// убийца - ГГ и я его друг
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return;
	};
	
	// я не хочу нападать на убийцу,
	if(!C_WantToAttackMurder(self,other))
	{
		// но если я стражник у ворот,
		if(C_NpcIsGateGuard(self))
		{
			// то запомнить преступление ГГ
			B_MemorizePlayerCrime(self,other,CRIME_MURDER);
		};
		return;
	};
	
	// для убийцы или жертвы установлен режим "сражение до смерти"
	if((other.aivar[AIV_DropDeadAndKill] == TRUE) || (victim.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return;
	};
	
	// если жертва - охотник на драконов или бандит, но не из лагеря бандитов
	if((victim.guild == GIL_DMT) || ((victim.guild == GIL_BDT) && !C_NpcBelongsToBL(victim)))
	{
		return;
	};
	
	// Во всех остальных случаях
	// напасть на убийцу
	B_Attack(self,other,AR_HumanMurderedHuman,0);
};



