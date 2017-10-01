
func string B_GetPriceString(var string name, var int value)
{
	var string Result;
	Result = ConcatStrings(name, " (");
	Result = ConcatStrings(Result, IntToString(value));
	Result = ConcatStrings(Result, " зол.)");
	return Result;
};