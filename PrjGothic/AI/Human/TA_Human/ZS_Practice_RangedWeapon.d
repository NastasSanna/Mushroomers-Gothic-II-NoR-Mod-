/**************************************************************
				ТРЕНИРОВАТЬСЯ НА СТРЕЛЬБИЩЕ

  С луком или арбалетом, что есть. Если ничего нету, создается
обычный лук.
 
  НЕ СТОЙ ПОД СТРЕЛОЙ! Поражается не только мишень, но и все,
что попадется по пути.
  Есть только проверка, что ГГ не стоит прямо около мишени,
 но он может быть на линии огня и вдали от мишени!
 
  self.aivar[AIV_TAPOSITION] отсчитывает выстрелы.
  
NS - 08-09/07/13
**************************************************************/

func void ZS_Practice_RangedWeapon()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	// БАГ не экипируется
	if(!Npc_IsInFightMode(self,FMODE_FAR) && !Npc_HasEquippedRangedWeapon(self))
	{
		CreateInvItems(self,ItRw_Sld_Bow,1);
	};
	AI_EquipBestRangedWeapon(self);
	B_CreateAmmo(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
};

func int ZS_Practice_RangedWeapon_Loop()
{
	// где ближайшая мишень?
	Npc_PerceiveAll(self);
	if (!Wld_DetectNpc(self,-1,ZS_BeingTarget,-1))
	{
		/* DEBUG INFO
		Print(ConcatStrings(self.name, ": Target NOT found!"));
		//*/
		self.aivar[AIV_LASTTARGET] = 0;
		return ZS_Stand_WP_loop();		//нету - просто стоим, курим
	};
	//теперь other - наша мишень, запоминаем ее
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
	/* DEBUG INFO
	Print(ConcatStrings(self.name, ": Target found!"));
	//*/
	// ГГ на линии огня!
	if (self.aivar[AIV_TAPOSITION] != NOTINPOS_WALK)
	{
		//if (Npc_GetDistToPlayer(other) < 250) простая проверка
			//ближе min_dist *дм* к линии огня, через высоту треугольника я - ГГ - мишень
			const int min_dist = 20;
			var int R;  R = Npc_GetDistToNpc(self,other) / 10; //я - мишень
			var int r1; r1 = Npc_GetDistToNpc(hero,other) / 10; //ГГ - мишень
		if (r1 <= R) //ГГ не за моей спиной
		{
			var int r2; r2 = Npc_GetDistToNpc(hero,self) / 10; //ГГ - я
			var int p; p = (R + r1 + r2) / 2;	//полупериметр
			var int h2;	h2 = (4 * p * (p - R) * (p - r1) * (p - r2) / R / R);
			//квадрат высоты меньше min_dist^2
			if ((h2 <= (min_dist * min_dist))
				|| (r2 < min_dist)
				|| (r1 < min_dist))
			{
				AI_StopAim(self);
				AI_StopLookAt(self);
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
				return LOOP_CONTINUE;
			};
		};
	};
	// готовимся к стрельбе
	if(self.aivar[AIV_TAPOSITION] <= NOTINPOS_WALK)
	{
		AI_GotoWP(self,self.wp);
		AI_TurnToNpc(self, other);	//? иногда не до конца поворачивается
//		AI_WhirlAround(self, other);	//с этим вроде лучше?
		AI_ReadyRangedWeapon(self);
		AI_LookAtNpc(self,other);
		if (Npc_GetDistToWP(self,self.wp) < TA_DIST_SELFWP_MAX)	{
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK + 1;
		};
		return LOOP_CONTINUE;
	};
	// стреляем очередями по 10-20 выстрелов
	if ((self.aivar[AIV_TAPOSITION] > NOTINPOS_WALK) && (self.aivar[AIV_TAPOSITION] < NOTINPOS + 10 + Hlp_Random(10)))
	{
		AI_AimAt(self, other);
		B_CreateAmmo(self);
		B_MM_DeSynchronize();
		AI_ShootAt(self, other);
		self.aivar[AIV_TAPOSITION] += 1;
	}
	// перерыв
	else
	{
		// иногда гуляем до мишени
		if (Hlp_Random(10) < 7)
		{
			AI_StopAim(self);
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);	//? где-то сбрасывается
			AI_GotoNpc(self,other);
			AI_LookAtNpc(self, other);
			B_MM_DeSynchronize();
			AI_StopLookAt(self);
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
		}
		else	{
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK + 1;
		};
	};
	/* DEBUG INFO
	Print(ConcatStrings("AIV_TAPOSITION = ", IntToString(self.aivar[AIV_TAPOSITION])));
	//*/
	return LOOP_CONTINUE;
};

func void ZS_Practice_RangedWeapon_End()
{
	/* DEBUG INFO
	Print(ConcatStrings(self.name, ": End practice."));
	//*/
	// конец тренировки
	AI_StopAim(self);
	AI_StopLookAt(self);
	AI_RemoveWeapon(self);
};

// ========================================================
// А что делает мишень? Да ничего, но если у нее нет ZS, будут баги.
// Здесь выпонляется точное размещение на WP.
// Можно еще прикрепить какие-то спец. восприятия
// Например, урон и диалог, чтобы можно было посчитать попадания ГГ

//попадание в мишень
func void B_TargetHit()
{
	if (Npc_IsPlayer(other))	{
		if (Npc_IsInFightMode(other,FMODE_FAR))	{
			B_HeroCountUsage();
			B_GivePlayerXP(XP_TargetHit);
			if (Hlp_Random(100) < 90)	{	//сохраняется 90% стрел
				var C_ITEm weapon;	weapon = Npc_GetReadiedWeapon(other);
				CreateInvItem(self,weapon.munition);
			};
		};
	};
};
//собрать расстрелянные стрелы
func void B_TargetTakeMunition()
{
	if (Npc_IsPlayer(other))	{
		ItemTrans_items[0] = ItRw_Arrow;
		ItemTrans_amount[0] = Npc_HasItems(self,ItRw_Arrow);
		ItemTrans_items[1] = ItRw_Bolt;
		ItemTrans_amount[1] = Npc_HasItems(self,ItRw_Bolt);
		B_ItemsTransaction(self,other);
	};
};

func void ZS_BeingTarget()
{
	B_ClearPerceptions(self);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_TargetHit);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_TargetTakeMunition);
	//откл. детекцию коллизий
	Vob_SetCollDetStat(_@(self), FALSE);
	//подровнялись, если есть WP
	if (!Hlp_StrCmp(self.wp, ""))
	{
		AI_AlignToWP(self);
		var int ptr_self_wp;	ptr_self_wp = zCWayNet_GetWaypoint(self.wp);
		if (ptr_self_wp > 0)
		{
			var zCWaypoint self_wp;	self_wp = _^(ptr_self_wp);
			var oCNPC self_vob;		self_vob = _^(_@(self));
			/*Vob_MoveWorld(_@(self), self_wp[0], self_wp[2], self_wp[1]); ставит криво
			MEM_Debug(self_wp.name);
			Vob_SetDrawBBox3D(_@(self),TRUE);*/
			self_vob._zCVob_trafoObjToWorld[3]=self_wp.pos[0];
			self_vob._zCVob_trafoObjToWorld[7]=addf(self_wp.pos[1], mkf(40));	//чуть приподнимаем над wp
			self_vob._zCVob_trafoObjToWorld[11]=self_wp.pos[2];
			/* Никакого эффекта не дает, bbox3D сам подгоняется
			self_vob._zCVob_bbox3D_maxs[0]=addf(self_wp.pos[0], mkf(5));
			self_vob._zCVob_bbox3D_maxs[1]=addf(self_wp.pos[1], mkf(5));
			self_vob._zCVob_bbox3D_maxs[2]=addf(self_wp.pos[2], mkf(5));
			self_vob._zCVob_bbox3D_mins[0]=subf(self_wp.pos[0], mkf(5));
			self_vob._zCVob_bbox3D_mins[1]=subf(self_wp.pos[1], mkf(5));
			self_vob._zCVob_bbox3D_mins[2]=subf(self_wp.pos[2], mkf(5));*/
			
		};
	};
};
func int ZS_BeingTarget_loop()	{return LOOP_CONTINUE;};
func void ZS_BeingTarget_end()	{};


