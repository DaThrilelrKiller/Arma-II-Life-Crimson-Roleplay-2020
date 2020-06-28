private ["_near","_locations","_marker"];

v_oil_loc = [];

_near = 
{
	private ["_return","_object","_distance"];

	_object = _this select 0;
	_distance = _this select 1;

	_return = 
	{
		if (getMarkerPos _x distance getPos _object < _distance)exitWith {true};

	}forEach v_oil_loc;

	_return = [false,true]select !isNil "_return";
	_return
};




_locations = [];

{
	if !([_x,500]call _near)then {
		_marker = [("drill_" + str _ForEachIndex),getPos _x,nil,nil,"colorBlack","mil_dot",nil,"Oil Field"]call core_createMarkerLocal;
		v_oil_loc set [count v_oil_loc,_marker];
	};
}ForEach (nearestobjects [dtk_center, ["Land_Ind_Oil_Pump_EP1","Land_Ind_Oil_Tower_EP1"], (dtk_center select 0)]);