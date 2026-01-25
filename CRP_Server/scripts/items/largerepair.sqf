private["_art","_vcl","_item","_anzahl"];
_art = _this select 0;
if (_art == "use") then 
{
_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 6] select 0);
_item = _this select 1;
_anzahl = _this select 2;



if (isnil ("_vcl")) exitwith {systemChat  "Not near any vehicles"};
if (!(player == vehicle player)) exitWith {systemChat  "You must be outside the vehicle"};
if (player distance _vcl <= 6) then 
{
	systemChat  "REPAIRING";
	[player,_item,-1] call storage_add;
	
	for "_i" from 1 to 100 step 1 do {
		if (animationState player != "ainvpknlmstpslaywrfldnon_medic")then {
			player playMove "ainvpknlmstpslaywrfldnon_medic";
		};
		[format['Repairing... %1%2',_i,"%"],'data\images\items\repairkit',true]call tag_notify;
		uiSleep 0.1;
		if(!alive player)exitWith {};
	};
	
	_vcl setDamage 0;
};

};
