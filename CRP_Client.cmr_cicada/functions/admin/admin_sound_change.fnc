private ["_sound","_path"];

_sound = (lbData [1501, (lbCurSel 1501)]);
_path = getArray(configFile >> "CfgSounds" >> _sound >> "sound");

ctrlSetText [1400,_sound];
systemchat format ["Directory: %1", _path select 0];


systemchat format[""];

if !(isNull dtk_source)then {
	deleteVehicle dtk_source;
};
dtk_source = "HeliHEmpty" createVehicleLocal [0,0,0];
dtk_source attachto[player,[0,0,0]];

dtk_source say _sound;