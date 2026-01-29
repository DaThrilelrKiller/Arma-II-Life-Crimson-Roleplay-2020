/*
File: fn_PickSpawn.sqf
Desc: Allows players to pick where they want to spawn (difrent spawns will show depending on what they are whitelisted for)
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

private ["_index","_c","_marker","_name","_posions","_index"];


if (isNil "AR_Whitelistloaded" || {isNil "SpawnPoints"})then {
	lbAdd [1401, "Waiting for stats to load!"];
	waitUntil {!isNil 'AR_Whitelistloaded'};
	waitUntil {!isNil 'SpawnPoints'};
};

call spawn_list;

buttonSetAction [1601, "[]spawn spawn_setPos;"];

[]spawn spawn_animatemap;