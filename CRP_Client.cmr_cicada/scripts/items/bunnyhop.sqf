/*
Script made by : Foster for OurLifeRPG
Version 1.1 (Stabel)
File: bunnyhop.sqf
Description: Bunny hop on a bicycle.
TeamSpeak: TS.OurLifeRPG.Net
Website: OurLifeRPG.Net
*/

private ["_vcl","_vel","_height"];

_vcl = vehicle player;

if (count _this > 1) exitWith {

  if(_vcl getVariable "bunnyhop") exitWith {systemChat  "this vehicle already has bunny-hop shocks installed"};
  if (!(_vcl isKindOf "bicycle")) exitWith {systemChat  "You can only use this on a bicycle";};

  [player,"bunnyhop",-1] call storage_add;
  systemChat  "tuning bicycle...";

  sleep 10;

  _vcl setVariable ["bunnyhop", true, true];
  systemChat  "bicycle tuned, press space to bunny-hop!";
};

if (doingSomething) exitWith {};
doingSomething = true;

_vel = velocity _vcl;
_height = abs(speed _vcl) / 6.6;

if (_height > 7.4) then {_height = 7.4};

_vcl setVelocity [_vel select 0, _vel select 1, (_vel select 2)+_height];

sleep 1.3;
doingSomething = false;









