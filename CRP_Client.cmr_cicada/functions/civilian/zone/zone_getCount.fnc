private["_chkTeamcnt", "_count"];
_chkTeamcnt = _this select 0;
_count = 0;
    
{
     if([_x] call zone_owner == _chkTeamcnt) then {
	_count = _count + 1;
     }
}foreach zones;
_count