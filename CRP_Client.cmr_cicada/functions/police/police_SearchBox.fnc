private ["_shop","_data","_unit","_amount","_cost","_item"];

_shop = _this select 0;

_data = _shop getVariable ["druglist",[]];

if (count _data == 0)exitWith {
	systemchat "No drugs found";
};

{
	_unit = _x select 0;
	_amount = _x select 1;
	_cost = _x select 2;
	_item = _x select 3;
	
	if !(isNull _unit)then {
		server globalchat format ["This store has $%2 worth of drugs! Interrogation reveals that they were sold by %1.", name _unit, (_amount*_cost)];
		
		_msg = format["%3 is wanted for trafficking $%2 worth of drugs!",name _unit,(_amount*_cost)];
		["ALL",_msg,{server globalchat _this;},false,true]call network_MPExec;

		[_unit,format["K9 REPORT: %1 Unit(s) of %2 sold for $%3", _amount,(_item call config_displayName),(_amount*_cost)],(_amount*_cost)]call cdb_addWarrant;
	};
	
}forEach _data;


_shop setvariable["druglist", [], true];