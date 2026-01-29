/*
File: vehicleAntiHack.sqf
Desc: Quick, simole and effective anti hack
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com

	Use Without Permission is prohibited

Prams: 
	none
*/

/* Breaks basicly all hacks from Remote exicuting anything */
isDedicated = false; 

[]spawn {

sleep 60;
waitUntil {!isNil 'dtk_master'};
temparray =  ["itemradio","itemmap","itemcompass","itemwatch","tf_microdagr","itemgps","tf_anprc152_1","firefighterweap2","tf_anprc148jem_1","tf_pd785_1","m16a2","m16a4"];

private ["_vehicleantihack"];
{
	_vehicleantihack = (_x select 2 select 0);
	temparray set [count temparray,(toLower _vehicleantihack)];
	true
}count dtk_master;
sleep 60;

private ["_i"];
for "_i" from 0 to 1 step 0 do 
{
	call s_OwlEye_vehicle;
	sleep 1;
};
};