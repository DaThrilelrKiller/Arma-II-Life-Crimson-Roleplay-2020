/*
File: fn_MarkerSorter.sqf
Desc: Marker sorter in the map tabs used to help navigate players around the map... (Not Complete)
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
 0. Sort type (What are you tying to sort by i.e. Color)
 1. Sort type by (i.e. ColorOrange)
*/

private ["_SortBy","_SortBy2"];
_SortBy = _this select 0;
_SortBy2 = _this select 1;

switch(_SortBy)do
{
	case "position":
	{
	
	};
	case "name":
	{

	};
	case "text":
	{
	
	};
	case "type":
	{
	
	};
	case "colorName":
	{
		_handler = ["HideAll",""]spawn gps_sort;
		waitUntil {scriptDone _handler};
		
		{
			if ((_x select 6) == _SortBy2)then
			{
			(_x select 3) setMarkerAlphaLocal 1;
			};
		}count PureGamingMarkerArray;
	};
	case "HideAll":
	{
		{
		(_x select 3) setMarkerAlphaLocal 0;
		}count PureGamingMarkerArray;
	};
	case "ShowAll":
	{
		{
		(_x select 3) setMarkerAlphaLocal 1;
		}count PureGamingMarkerArray;
	};
};