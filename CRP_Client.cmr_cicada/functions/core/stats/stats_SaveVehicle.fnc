private ["_vcl","_vclClass","_trunk","_speedupgrade","_plate","_warrants","_license","_notes","_sirens","_name","_length","_data","_lengthAfer","_index"];
_vcl = (vehicle player);

if (_vcl == player)then {
	_vcl = [getPos player,20]call core_NearbyVehicle;
};
if (isNil "_vcl")exitWith {
	systemchat "Error saving vehicle: no vehicle found";
};
if !([player,_vcl]call keys_has)exitWith {
	systemChat "you dont have the keys to this vehicle";
};

["SERVER",[player,dtk_side,_vcl],"s_vehicle_save",false,false]call network_mpexec;
