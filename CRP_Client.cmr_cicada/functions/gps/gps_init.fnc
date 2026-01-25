/*
File: markers_init.fnc
Desc: sbuilds a array for marker infomation from the mission.sqm for use in the sorter
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

if (dtk_server)exitWith {};


private ["_Markeramount","_markerID","_position","_name","_text","_type","_colorName","_width","_hieght"];
_Markeramount = getNumber(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> "items");

for "_i" from 0 to _Markeramount do 
{
	_markerID = format["Item%1",_i];
	_position = getArray(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "position");
	_name = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "name");
	_text = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "text");
	_type = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "type");
	_colorName = getText(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "colorName");
	_width = getNumber(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "a");
	_hieght = getNumber(missionConfigFile >> "MissionSQM" >> "Mission" >> "Markers" >> _markerID >> "b");
	_width = if (isNil "_width")then {1}else {_width};
	_hieght = if (isNil "_hieght")then {1}else {_hieght};


	PureGamingMarkerArray set[count PureGamingMarkerArray,[_markerID,_position,[_width,_hieght],_name,_text,_type,_colorName]];
};

call gps_diary;