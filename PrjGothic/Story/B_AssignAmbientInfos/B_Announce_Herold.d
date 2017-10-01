
func void B_Announce_Herold()
{
	var int randy;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	B_RemoveWeapon(self);
	CreateInvItem(self,Fakescroll);
	AI_UseItemToState(self,Fakescroll,1);

	AI_UseItemToState(self,Fakescroll,-1);
};

