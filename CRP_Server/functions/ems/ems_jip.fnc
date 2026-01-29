

for "_i" from 0 to 100 step 1 do 
{
	if (str (getMarkerPos format["mrk_ems_%1",_i]) != '[0,0,0]')then {
		format["mrk_ems_%1_area",_i] setMarkerAlpha 1;
		format["mrk_ems_%1",_i] setMarkerAlpha 1;
	};
};