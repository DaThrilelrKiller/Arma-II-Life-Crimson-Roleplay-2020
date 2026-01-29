private["_file", "_section", "_key", "_data"];
_file = _this select 0;
_section = _this select 1;
_key = _this select 2;
_data = _this select 3;

if(count (toarray(format["%1", _data])) > 8080) then {
	_data = false;
	_log = format["IniDBI: write failed %1 %2 data too big > 8K", _section, _key];
	[_log] call s_stats_log;
} else {
	_data = format['"%1"', _data];
	_data = "iniDB" callExtension format["write;%1;%2;%3;%4", _file, _section, _key, _data];
};

(call compile _data) select 0;