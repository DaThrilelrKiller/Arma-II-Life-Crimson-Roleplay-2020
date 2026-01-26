

private ["_building","_phase","_doors","_anim"];

waitUntil {
	if (count DTK_Locked != 0)then {
		{
			_building = nearestBuilding (getMarkerPos _x);
			_doors = [_building]call house_doors;
			
			_anim = if ((typeOf _building) in ["Land_HouseV_1I4","Land_A_GeneralStore_01a_dam","Land_dum_mesto2","Land_Ind_Workshop01_01"])then {0}else{1};
			
			{
				_phase = _building animationPhase _x;
				if (_phase != _anim)then {
					_building animate [_x, _anim];
				};
			}forEach _doors;
		}forEach DTK_Locked;
	};
	false
};