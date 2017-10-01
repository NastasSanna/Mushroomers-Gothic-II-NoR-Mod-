
//указатель на WP по имени
func int zCWayNet_GetWaypoint(var string WPname)
{
	//zCWaypoint * __fastcall zCWayNet::GetWaypoint(zSTRING const &)const       	0x007B0330	
	const int zCWayNet__GetWaypoint = 8061744;
	CALL__fastcall(MEM_World.wayNet, _@s(WPname), zCWayNet__GetWaypoint);
	return CALL_RetValAsPtr();
};
