private ["_return","_data","_item","_info","_itemcost","_costwithTax","_amount","_cost","_itemtype","_classname","_array","_fahne","_crate","_logic","_license","_license1","_license2","_invspace","_menge"];

if(dtk_shopactive)exitWith {
	systemchat "Shop script is already running";
};
dtk_shopactive = true;

_return = false;
_data = call compile(lbData [301, (lbCurSel 301)]);
_item = _data select 0;
_info = _data select 1;
_itemcost = _data select 2;                         
_costwithTax = _data select 3;
_amount = _this select 0;

 _itemtype    = _info call config_type;                
 _classname  = _info call config_class;
 _fahne      = (shop_cache select 0);  
 _crate      = (shop_cache select 2);  
 _logic      = (shop_cache select 4);
 _license    = (shop_cache select 5);
 _license1   = _info call config_license1;
 _license2   = _info call config_license2;
 

if (!(_amount call string_isInteger)) exitWith {
	systemChat  localize "STRS_inv_no_valid_number";
	dtk_shopactive = false;
};

_amount = _amount call string_toInt;  
if (_amount <= 0) exitWith {
	dtk_shopactive = false;
};

switch(_itemtype)do
{
	case "Item":
	{
		if ([player,_item] call storage_amount == 0) exitWith {systemChat  localize "STRS_inv_buyitems_sell_notenough";};								
		if ([player,_item] call storage_amount < _amount) then {_amount = ([player,_item] call storage_amount);};

		if (_item in (v_questitems select 1))then 
		{
			_costIncreat = (_cost * 0.4);
			_cost = _cost + _costIncreat;
			systemChat format ['You have made a extra %1$ by selling this item during your quest',_costIncreat];
		};
		
		_cost = _amount*_costwithTax; 
		 _cost =  round (_cost);
		
		[player,"geld",_cost] call storage_add;
		[player,_item,-_amount] call storage_add;
		if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};																																														
		systemChat  format [localize "STRS_inv_shop_sold", (_amount call string_intToString), (_info call config_displayname), (_cost call string_intToString)];			
	
		// Add stock to shop if item is player-obtainable
		if (!isNull shop_object && [_item] call shops_isPlayerItem) then {
			private ["_shopVarName"];
			["SERVER", [shop_object, _item, _amount], "shops_addStock", false, false] call network_MPExec;
		};
	
		if (_info call config_illegal) then{
			_array = shop_object getvariable["druglist",[]];
			_array set [count _array,[player, _amount, (_cost/_amount),_item]];
			shop_object setvariable["druglist", _array, true];
		};
	
	
	};
	case "weapon":
	{
		_weaps      = {_x == (_info call config_class)} count weapons player;																														
		if (_weaps == 0) exitWith {systemChat  localize "STRS_inv_buyitems_sell_notenough";};	
		if (_weaps < _amount) then {_amount = _weaps;};			
		_cost = _amount*_costwithTax; 
		 _cost =  round (_cost);
		[player,"geld",_cost] call storage_add;
		if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};																																														

		for [{_i=0}, {_i < _amount}, {_i=_i+1}] do 

			{
																						
			player removeWeapon (_info call config_class);	

			};
		
		systemChat  format [localize "STRS_inv_buyitems_verkauft", 1, (_info call config_displayname), (_cost call string_intToString)];												
	};
	case "magazin":
	{																															
		_mags      = {_x == (_info call config_class)} count magazines player;																														
		if (_mags == 0) exitWith {systemChat  localize "STRS_inv_buyitems_sell_notenough"; _exitvar = 1};						
		if (_mags < _amount) then {_amount = _mags;};		
		_cost = _amount*_costwithTax; 
		 _cost =  round (_cost);		
		[player,"geld",_cost] call storage_add;
		if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};																																														
		
		for [{_i=0}, {_i < _amount}, {_i=_i+1}] do 

			{																											

			player removeMagazine (_info call config_class);																														

			};
		
		systemChat  format [localize "STRS_inv_buyitems_verkauft", (_amount call string_intToString), (_info call config_displayname), (_cost call string_intToString)];
		_exitvar = 1;
	};
	case "vehicle":
	{
		_vehicle = _data select 4 select 0;
		_amount = 1;																																																																																
		if (_posInVclArray == -1) exitWith {systemChat  localize "STRS_inv_buyvehicles_noowner"; _exitvar = 1};																								
		if (not (alive _vehicle))            exitWith {systemChat  localize "STRS_inv_buyvehicles_destroyed"; _exitvar = 1};										
		if ((_vehicle distance player) > 25) exitWith {systemChat  localize "STRS_inv_buyitems_sell_toofar"; _exitvar = 1};																												
		deleteVehicle _vehicle;
		
		_cost = _amount*_costwithTax; 
		 _cost =  round (_cost);
		
		[player,"geld",_cost] call storage_add;		
		systemChat  format [localize "STRS_inv_shop_vehiclesold", (_cost call string_intToString)];																																
	};
	case "App":
	{
		if (_item in INVAppsInstalled)then {
		
		_cost = 1*_costwithTax; 
		 _cost =  round (_cost);
		
		[player,"geld",_cost] call storage_add;
		INVAppsInstalled = INVAppsInstalled - [_item];
		
		}else{
		systemChat "you do not have the app you are tryin to sell";
		};
		
	};
	case "siren":
	{
		if ((vehicle player) == player)exitWith {};
		[vehicle player,_classname]call siren_remove;
		
		_cost = 1*_costwithTax; 
		 _cost =  round (_cost);
		[player,"geld",_cost] call storage_add;
	};
	default 
	{
	};
};

call shops_refresh;

dtk_shopactive = false;