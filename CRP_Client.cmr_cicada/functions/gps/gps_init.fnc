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
// Arma 2 OA-safe: get markers from runtime instead of parsing mission.sqm via description.ext includes.
// This avoids hard mission config parse errors and still provides full marker info.
{
	_name = _x;
	_position = getMarkerPos _name;
	_text = markerText _name;
	_type = markerType _name;
	_colorName = markerColor _name;
	_size = markerSize _name;

	PureGamingMarkerArray set [
		count PureGamingMarkerArray,
		[_name, _position, _size, _name, _text, _type, _colorName]
	];
} forEach allMapMarkers;

call gps_diary;