
closeDialog 0;

if (count dtk_dob > 0)then {
	createDialog "AR_SpawnMenu";

	if (!dtk_civ || {!isNil "dtk_spawned"})then {
		ctrlEnable [1602, false];
	};
}else{
	[]call id_menu;
};