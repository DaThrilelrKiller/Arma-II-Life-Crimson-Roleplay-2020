private ["_type","_name","_index","_ui","_Main","_picture"];

{
_type = (_x call config_type);

	if (_type == _this)then
	{
		_name = (_x call config_displayname);
		_index = lbAdd [1501, format["%1", _name]];
		lbSetData [1501, _index, format ['%1',_x]];	
	};
	if (_type == "vehicle")then {
		_class = _x call config_class;
		_image = getText (configFile >> "CfgVehicles" >> _class >> "Picture");
		lbSetPicture [1501, _index, _image];
	};
	if (_type == "item")then {
		lbSetPicture [1501, _index,format ["data\images\items\%1.paa",[_x select 0]call config_image]];
	};
 true
}forEach  dtk_master;

disableserialization;
_ui = uiNameSpace getVariable "admin_inventory";
_Main = _ui displayCtrl 1501;
lbSort _Main;