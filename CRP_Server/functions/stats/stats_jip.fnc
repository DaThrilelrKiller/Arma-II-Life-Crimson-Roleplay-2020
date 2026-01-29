
_this call s_stats_load;

/* temp place for remote functions */
_owner = owner(_this select 0);
_functionsa = PG_SSF;

{
	_owner publicVariableClient _x;
}forEach _functionsa;