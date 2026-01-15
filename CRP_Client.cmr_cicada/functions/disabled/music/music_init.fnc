private["_config", "_i", "_trackTitle"];

_config = configFile >> "cfgMusic";
for "_i" from 0 to count (_config)-1 do {
		_trackTitle = configName(_config select _i);
		music_array set[_i, _trackTitle];
};


if (dtk_client && {play_music})then {
	call music_random;
};