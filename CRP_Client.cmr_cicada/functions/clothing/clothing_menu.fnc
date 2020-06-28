_shop = _this select 0;
_clothing =  _this select 1;
_condition = _this select 2;

if !(call _condition)exitWith {
	systemchat format ["%1, you do not have permission for this shop",name player];
};

paint_unit = player;

paint_cam = "Camera" camCreate [0, 0, 0];
paint_cam cameraEffect ["internal", "front"];

createDialog "Clothing";

sliderSetRange [11, 0, 1];
sliderSetSpeed [11, 0.10, 0.10];

sliderSetRange [12, 0, 1];
sliderSetSpeed [12, 0.10, 0.10];

sliderSetRange [10, 0, 1];
sliderSetSpeed [10, 0.10, 0.10];


[player]call clothing_preview;

{
	_name = _x call config_displayname;
	_price = _x call config_buycost;
	_class = _x call config_class;
	_picture = getText(configFile >> "cfgVehicles" >> _class >> "portrait");
	
	_index = lbAdd [150, format["%1 ($%2)", _name, _price] ];						
	lbSetData [150, _index, format ['%1',_x]];			
	lbSetPicture [150, _index, format ["%1",_picture]];	
}forEach _clothing;