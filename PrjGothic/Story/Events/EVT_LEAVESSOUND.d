
func void EVT_LEAVESSOUND()
{
	MEM_Debug("EVT_LEAVESSOUND");
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		Snd_Play3D(hero,"OW_WOOD_CRACKLE");
	}
	else if (rnd == 1)	{
		Snd_Play3D(hero,"OW_WOOD_CRACKLE_A1");
	}
	else	{
		Snd_Play3D(hero,"OW_WOOD_CRACKLE_A2");
	};
};