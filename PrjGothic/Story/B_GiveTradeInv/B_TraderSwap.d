
/**********************************************************

  Инвентарь торговли будет храниться отдельно, у фиктивного
npc. Такого фиктивного торговца нужно создать для каждого
B_GiveTraderInv_...(). У него хранится ТОЛЬКО инвентарь 
торговли, все AIVAR и т.п. - у обычного npc.
  В B_DS_Talk_End() добавлен вызов B_TradeSwapBack().
  Сокращен B_GiveTraderInv(). Вызов B_ClearJunkTradeInv(slf);
перенесен в B_GiveTraderInv_...().
  Требуется Ikarus.

  Решает проблемы:
  - экипировки итемов, которые должны продаваться
  - продажи рун
  - очистки/восстановления инвентаря при избиении торговца
  - вызов B_ClearDeadTrader больше не нужен, 
    дефолтный инвентарь можно создать прямо в инстанции npc


                        ШАБЛОН 
               B_GiveTraderInv_<name>.d

//фиктивный торговец - у него весь ассортимент
instance TRADER_<name>(TRADER_Proto); 

func void b_givetradeinv_<name>(var C_Npc slf)
{
	//если надо, создаем своего фиктивного торговца
	if (!Hlp_IsValidNpc(TRADER_<name>))	{
		B_InsertNpc(TRADER_<name>,MEM_FARFARAWAY);
	};
	//подмена инвентаря
	B_TradeSwap(slf, TRADER_<name>);
	//очистка инвентаря в начале главы
	B_ClearJunkTradeInv(slf);

	//здесь добавляем инвентарь как обычно
};
***********************************************************/

//прототип фиктивного торговца
prototype TRADER_Proto(C_NPC)
{
	name[0] = "Торговец";
	guild = GIL_MEATBUG;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	npcType = npctype_main;
	start_aistate = ZS_Stand_WP;
	noFocus = TRUE;
};

func void TRADER_SetVisuals()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	//Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


//указатель на фикт. торговца, с которым сейчас обменялись инвентарем
var int TRADER_Swapback_ptr;

//смещение и размер инвентаря в oCNpc
const int Inventory_Npc_offset = 1640;   // 0x0668
const int Inventory_words = 51;   // (0x0734 - 0x0668) / 4

//=======================================================
// поменять местами инвентари двух npc
func void B_NpcSwapInventory(var int slf_ptr, var int oth_ptr)
{
	if (!Hlp_Is_oCNpc(slf_ptr) || !Hlp_Is_oCNpc(oth_ptr))	{ return;};
	MEM_Swap(slf_ptr + Inventory_Npc_offset, oth_ptr + Inventory_Npc_offset, Inventory_words);
};

//=======================================================
// подмена инвентаря торговца
func void B_TradeSwap(var C_NPC slf, var C_NPC trader)
{
	if (TRADER_Swapback_ptr != _@(trader))	{	//NS - янв. 2014 контроль, что свопа еще не было
		TRADER_Swapback_ptr = _@(trader);
		B_NpcSwapInventory(_@(slf), TRADER_Swapback_ptr);
	};
};

// возврат обычного инвентаря
// работает только в рамках одной сессии!
func void B_TradeSwapBack(var C_NPC slf)
{
	if (TRADER_Swapback_ptr != 0)	{
		B_NpcSwapInventory(_@(slf), TRADER_Swapback_ptr);
		TRADER_Swapback_ptr = 0;
	};
};
