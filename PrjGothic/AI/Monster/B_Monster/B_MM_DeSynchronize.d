
// рассинхронизация, для неодновременности действий ???
func void B_MM_DeSynchronize() //испр. - int на void
{
	// задержка не более, чем на 1 секунду
	var int msec;
	msec = Hlp_Random(1500); 
	AI_Waitms(self,msec);//??? не работает
	var float sec;	sec = castFromIntf(fracf(msec,1500));
	AI_Wait(self,sec);
};

