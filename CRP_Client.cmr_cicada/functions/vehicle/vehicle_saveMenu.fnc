private ["_Array","_Scriptname","_trunk","_upgrades","_name","_classname","_picture"];

createDialog "liste_1_button";
ctrlSetText [221, "Retrive Vehicle"];

DTK_SaveKind = _this;

buttonSetAction [221,"[]spawn vehicle_spawn;"];
["SERVER",[player,[getplayeruid player,dtk_side, "Vehicles"],"s_stats_buildArray","vehicle_loadVehicles"],'network_callBack',false,false]call network_MPExec;