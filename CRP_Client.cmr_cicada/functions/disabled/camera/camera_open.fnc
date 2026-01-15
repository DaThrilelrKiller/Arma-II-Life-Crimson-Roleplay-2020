private ["_laptop","_laptopside","_cameras","_data","_advanced","_side","_text","_index"];

v_cam_array = [];

_laptop = _this;
_laptopside = _laptop getVariable "camera";
if (_laptopside != dtk_side)exitWith {
systemchat "This CCTV laptop does not belong to you";
};

createDialog "camera_dialog";
_cameras = 1;

{
	_data = _x getVariable "camera";
	if (!isNil "_data")then {
	
		_advanced = _data select 0;
		_side = _data select 1;
		
		if (_side == _laptopside)then {
			_text = [format ["Camera %1",_cameras],format ["Advanced Camera %1",_cameras]]select _advanced;
			_index = lbAdd [16, _text];
			lbSetData [16, _index, str _cameras];						
			_cameras = _cameras + 1;
			v_cam_array set [count v_cam_array, _x];
		};
	};
}forEach allMissionObjects "MAP_misc_videoprojector";