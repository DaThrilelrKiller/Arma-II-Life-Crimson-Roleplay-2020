/*
File: fn_UntiMarkers.sqf
Desc: Create units markers to show where are units are at
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

if (dtk_server)exitWith {};

[]spawn {

private ["_settings","_mrkname","_UnitSide","_color","_pos","_comparePos","_marker","_unit","_return","_i","_side"];
	
	_settings = call markers_config;
	_UnitSide = (_settings select 0);
	_color = (_settings select 1);
	_curside = dtk_side; 
	
	for "_i" from 0 to 1 step 0 do 
	{
			{
			_unit = call compile _x;
			_mrkname =  format['%1_mrk',_x];
			_pos = getMarkerPos _mrkname;  
			_comparePos =  str _pos;

				if (!isNil "_unit")then 
				{
					if (isNull _unit)then
					{
						if !(_comparePos == '[0,0,0]')then
						{
							deleteMarkerLocal _mrkname;

						};
					}
					else
					{  
						_side = _unit call core_side;
						if !(isPlayer _unit) exitWith {};

						if (_comparePos == '[0,0,0]')then
						{
							if (_side == dtk_side) then
							{

							_marker = createMarkerLocal[format["%1_mrk",_unit], [-100, -100]];																																																						
							_marker setMarkerShapeLocal  "ICON";				
							_marker setMarkerTypeLocal  "Dot";				
							_marker setMarkerColorLocal _color;																										
							_marker setMarkerSizeLocal  [1.2, 1.2];			
							_marker setMarkerTextLocal format["%2  %1" , _unit,(name _unit)];		
							_marker SetMarkerPosLocal (getPos _unit);	
							};					
						}
						else
						{

							_mrkname SetMarkerPosLocal (getPos _unit);
							if (_side != dtk_side)then 
							{
							deleteMarkerLocal _mrkname;
							}
						};
						
					};
				};
	
			}count _UnitSide;
			
			if (_curside != dtk_side)then 
			{
				_settings = call markers_config;
				_UnitSide = (_settings select 0);
				_color = (_settings select 1);
				_curside = dtk_side;
			};
		sleep 1;
	};
};