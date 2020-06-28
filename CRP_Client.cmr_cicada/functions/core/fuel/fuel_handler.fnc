private ["_vehicle","_pos"];
_vehicle = _this;
_pos = getPos _vehicle;

while {((fuel _vehicle) < 0.99)} do 
{
	if(v_fuel_cost < v_fuel_max)then
	{
		v_fuel_cost = v_fuel_cost + v_fuel_use
	};
	
	if (!([player,'geld',-v_fuel_cost] call storage_add)) exitWith 
	{
	systemChat  "You currently dont have enough money to refuel the vehicle completly";    
	};

	if (_vehicle distance _pos > 3) exitWith 
	{
	systemChat  "refueling stoped; the vehicle has been moved"; 
	};
	
	[_vehicle,[_vehicle,((fuel _vehicle)+0.05)],{(_this select 0) setFuel (_this select 1)},false,false]call network_MPExec;
	
	[format['Fuel Status: %1 of 100. You refuelled 10 litres into your car. If you have enough',round(fuel _Vehicle * 100)],'\crp_data\images\tags\Gas pump']call tag_notify;
	
	sleep 1.5;
};

[format ["you have refueled the vehicle %1%",round(fuel _Vehicle * 100)],'\crp_data\images\tags\Gas pump']call tag_notify;

publicvariable "v_fuel_cost";