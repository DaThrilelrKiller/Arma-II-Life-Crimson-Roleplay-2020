if !(v_camera_bool)exitWith {};

systemchat str _this;

_unit = _this select 0;

if (v_active_cam distance _unit < 200)then {
	_advanced = v_active_cam getVariable ["camera",[false,""]]select 0;
	if (_advanced)then {
		v_camera camSetTarget player;
		v_camera camSetFov 0.15;
		v_camera camCommit 6;
		titletext[str getPos _unit, "PLAIN DOWN"];
	};	
};