private ["_vehicle","_pos","_pump","_tickLiters","_stock","_stationIdx","_stationObj"];
_vehicle = _this select 0;
_pump = _this select 1;
_pos = getPos _vehicle;

_tickLiters = 10;
_stock = if (!isNull _pump) then {_pump getVariable ["fuel_stock",-1]} else {-1};
_stationIdx = if (!isNull _pump) then {_pump getVariable ["fuel_stationShopIndex",-1]} else {-1};
_stationObj = if (!isNull _pump) then {_pump getVariable ["fuel_stationShopObj",objNull]} else {objNull};

while {((fuel _vehicle) < 0.99)} do 
{
	_stock = if (!isNull _pump) then {_pump getVariable ["fuel_stock",-1]} else {-1};
	if (_stock == 0) exitWith { systemChat "This fuel station is out of gas."; };
	
	if (!([player,'geld',-v_fuel_cost] call storage_add)) exitWith 
	{
	systemChat  "You currently dont have enough money to refuel the vehicle completly";    
	};

	if (_vehicle distance _pos > 3) exitWith 
	{
	systemChat  "refueling stoped; the vehicle has been moved"; 
	};
	
	[_vehicle,[_vehicle,((fuel _vehicle)+0.05)],{(_this select 0) setFuel (_this select 1)},false,false]call network_MPExec;

	// Consume station stock (if this pump is linked to a player-owned fuel station)
	if (_stationIdx >= 0 && {!isNull _stationObj} && {_stock != -1}) then {
		["SERVER",[player,_stationObj,_stationIdx,_tickLiters],"S_business_consumeFuelStock",false,false] call network_MPExec;
	};
	
	[format['Fuel Status: %1 of 100. You refuelled 10 litres into your car. If you have enough',round(fuel _vehicle * 100)],'data\images\tags\Gas pump']call tag_notify;
	
	sleep 1.5;
};

[format ["you have refueled the vehicle %1%",round(fuel _vehicle * 100)],'data\images\tags\Gas pump']call tag_notify;