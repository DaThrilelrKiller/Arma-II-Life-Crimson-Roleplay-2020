chop_Vehicle = {
private ["_vehicle","_speed","_storage","_test","_cost"];

if (isNil "chopping")then {
chopping = true;

_vehicle = [getPos player,20]call core_NearbyVehicle;

if (isNil "_vehicle")exitWith {
	systemchat "No vehicles found nearby";
};

_speed = _vehicle getVariable ["tuning",0];
_storage = _vehicle getVariable ["dtk_upgrade",0];
_test = (_vehicle getVariable "DTK_OwnerUID" select 1);
_cost = (_test call config_buycost) * 0.90;

_speed = _speed call {
	if (_this == 1.006)exitWith {5000};
	if (_this == 1.008)exitWith {10000};
	if (_this == 1.010)exitWith {25000};
	if (_this == 1.012)exitWith {30000};
	if (_this == 1.014)exitWith {50000};
	if (_this == 1.018)exitWith {100000};
	0
};


if (_speed != 0)then {
	playsound "Drill";
	for "_i" from 1 to 100 step 1 do {
			[format['Removing Turbo Bro... %1%2',_i,"%"],'\crp_data\images\items\turbo',true,_vehicle]call tag_notify;
			uiSleep 0.01;
	};
	_cost = _cost + _speed;
};

if (_storage != 0)then {
	playsound "Drill";
	for "_i" from 1 to 100 step 1 do {
			[format['Removing Badass tunes dude... %1%2',_i,"%"],'\crp_data\images\items\exhaust',true,_vehicle]call tag_notify;
			uiSleep 0.01;
	};
	_cost = _cost + 10000;
};


for "_i" from 1 to 100 step 1 do {
		[format['Inspecting Vehicle Condition... %1%2',_i,"%"],'\crp_data\images\tags\tools',true,_vehicle]call tag_notify;
		uiSleep 0.01;
};


['Finilizing price with Bossman...','data\images\shady',true]call tag_notify;
sleep 5;
[format['You Made %1',[_cost]call main_formatMoney],'data\images\shady',true]call tag_notify;
[player,'geld',_cost]call storage_add;

deleteVehicle _vehicle;
chopping = nil;
};
};
