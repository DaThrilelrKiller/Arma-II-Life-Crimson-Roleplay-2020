_unit = _this select 0;
_id = _unit getVariable "id";
_array = [];

{
	if (owner _x == _id)then {
		_array set [count _array, _x];
	};
}forEach allMissionObjects "All";

_unit setVariable ["disconnect",_array];