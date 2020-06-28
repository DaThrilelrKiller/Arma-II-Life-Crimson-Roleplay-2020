private ["_Funcitons","_externalFunctions"];

_Funcitons = 
[

["events","events","events"],
["events","onpause","events"],
["events","sethit","events"],

["inv","entferneillegales","inventory"],
["inv","getobjectsteuer","inventory"],
["inv","addprozent","inventory"],
["inv","isarmed","inventory"], 
["inv","getitemsteuer","inventory"],


["main","notification","main"],
["main","format_integer","main"],
["main","formatamount","main"],
["main","stringucase","main"],
["main","formatmoney","main"],
["main","isplayernear","main"],
["main","random","main"],

["other","repairvehicle","vehicle"],
["other","pullout","vehicle"],
["other","putplayerincar","vehicle"],
["other","Towing","vehicle"],

["dtk","playerlisttocontrol","dathrillerkiller"]

];

{
	call compile format['%1_%2 = compile preprocessFile "functions\%3\fn_%2.fnc";', _x select 0, _x select 1,_x select 2];
}count _Funcitons;