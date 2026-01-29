
if (typeName _this == "ARRAY")exitWith {
	if (DTK_Server)then {
		private ["_index"];
		_index = count DTK_Lab_Drugs;
		DTK_Lab_Drugs set [_index, _this];
		["Labs", "Items",str _index, _this] call s_stats_write;
	};

	missionNamespace setVariable [_this select 0,_this];
};

private ["_storage","_items","_amount","_varName","_lacedUp","_kg"];

DTK_LacingUp = true;

if !(_this call lab_checkStorage)exitWith {
	systemchat "You can only lace food & drugs items.pleases remove any other items from storage or risk Fire!";
	DTK_LacingUp = false;
	_this spawn {
		sleep 5 + round(random 20);
		if !(_this call lab_checkStorage)then {
			_this call lab_catchFire;
		};
	};
};


_name = ctrlText 87;
if (_name == "Name")exitWith {
	systemchat "Please, type a name for your new product!";
	DTK_LacingUp = false;
};

_storage = _this getVariable ["dtk_storage",[[],[]]];

_items = _storage select 0;
_amount = _storage select 1;

if (count _items < 2)exitWith {
	systemchat "You need at least 2 items to lace. Please add to your storage";
	DTK_LacingUp = false;
};

closeDialog 0;

for "_i" from 1 to 100 step 1 do {
	[format['Lacing (%3)%4 With (%5)%6 to make %7... %1%2',_i,"%",(_amount select 0),(_items select 0)call config_displayName,(_amount select 1),(_items select 1)call config_displayName,_name],'',true]call tag_notify;
	uiSleep 0.1;
	if(!alive player)exitWith {};
				
	if (_i == 100)exitWith {
		_varName = format["%1_%2_%3%4",(_items select 0),(_items select 1),(_amount select 0),(_amount select 1)];
		if (isNil _varName)then {
			_kg = (((_items select 0)call config_weight) + ((_items select 1)call config_weight)) * 0.75;
			_lacedUp = [_varName,["Item", "drug"],["Suitcase",_name],[50000, 50000], [_kg, "none","none"], [true, true, true,false,"lab_use"],_storage];
			["ALL",_lacedUp,"lab_lace",false,true]call network_MPExec;	
		}else{
		
			systemchat format["You haved discoved a item that has been created before, this laced item is know as: %1",_varName call config_displayName];
		};
		
		_this setVariable ["dtk_storage",[[_varName],[1]],true];
	};
};

if ([(_items select 0),(_items select 1)]call lab_itemLaced)then {
	_this call lab_catchFire;
};


DTK_LacingUp = false;
