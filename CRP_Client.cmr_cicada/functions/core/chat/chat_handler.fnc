private ["_i"];
disableSerialization;

for "_i" from 0 to 1 step 0 do {
	waitUntil {!(isNull (findDisplay 24))};
	(findDisplay 24) displaySetEventHandler ["keyUp", "_this call chat_KeyUp"];
	call chat_show;
	waitUntil {isNull (findDisplay 24)};
};