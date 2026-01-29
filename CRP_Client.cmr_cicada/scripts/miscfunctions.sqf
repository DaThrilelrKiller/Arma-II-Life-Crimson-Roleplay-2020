
Emita_GetGridRef =
{
	private ["_Pos","_X","_Y","_sY","_sX","_Result"];
	_Pos = _this select 0;
	_X = floor ((getPos _Pos select 0) / 100);
	_Y = floor ((getPos _Pos select 1) / 100);
	_Y = 50 - _Y;
	_sX = str(_X);
	_sY = str(_Y);
	switch (true) do
	{
		case ((_X < 10) && (_Y < 10)):
		{
			_Result = "00"+_sX+"00"+_sY;
		};
		case ((_X < 10) && (_Y > 10)):
		{
			_Result = "00"+_sX+"0"+_sY;
		};
		case ((_Y < 10) && (_X > 10)):
		{
			_Result = "0"+_sX+"00"+_sY;
		};
		default
		{
			_Result = "0"+_sX+"0"+_sY;
		};
	};
	_Result;
};		

TastenDruck = 
{
	private ["_ctrl", "_zeichennummer", "_ctrlid"];
	_ctrl          = ((_this select 0) select 0);
	_zeichennummer = ((_this select 0) select 1);
	_ctrlid        = (_this select 1);
	if (ISSE_str_const_validInput find _zeichennummer < 0) then
	{
		closedialog 0;
		systemChat  format[localize "STRS_wrong_input", _zeichennummer];
	};
};

ISSE_ArrayNumberNear = 
{
	private ["_c", "_obj", "_arr", "_dis", "_res"];
	_obj = _this select 0;
	_arr = _this select 1;
	_dis = _this select 2;
	_res = 0;
	if (isNull _obj) then 
	{	
		_res = 0;
	}
	else
	{
		for "_c" from 0 to (count _arr - 1) do {
		
			if (not(isNull(_arr select _c))) then
			{
				if ((_obj distance (_arr select _c)) < _dis) then
				{
					_res = _res + 1;
				};
			};
		};
	};
	_res
};

ISSE_IsVictim =
{
	private ["_state", "_victimStats"];
	_state  = animationState _this;
	_victimStats = ["amovpercmstpssurwnondnon", "adthppnemstpsraswpstdnon_2", "adthpercmstpslowwrfldnon_4", "amovpercmwlkssurwnondf_forgoten", "civillying01", "civilsitting", "civilsitting01", "civilsitting02", "civilsitting03", "actspercmstpsnonwrfldnon_interrogate02_forgoten"];
	if (_state in _victimStats) then
	{
		true
	}
	else
	{
		false
	};
};


INV_CreateWeapon =
{
	private["_class", "_menge", "_cache", "_weapons", "_names", "_amount","_index"];
	_class = _this select 0;
	_menge = _this select 1;
	_cache = shop_object getVariable ["Gear",[[[],[]],[[],[]]]];
	_weapons = _cache select 0;
	
	_names = _weapons select 0;
	_amount = _weapons select 1;
	
	_index = count _names;
	_names set [_index,_class];
	_amount set [_index,_menge];
	_cache set [0,_weapons];

	shop_object setVariable ["Gear",_cache];
};

INV_CreateMag =
{
	private["_class", "_menge", "_cache", "_magazines", "_names", "_amount","_index"];
	_class = _this select 0;
	_menge = _this select 1;
	_cache = shop_object getVariable ["Gear",[[[],[]],[[],[]]]];
	_magazines = _cache select 1;
	
	_names = _magazines select 0;
	_amount = _magazines select 1;
	
	_index = count _names;
	_names set [_index,_class];
	_amount set [_index,_menge];
	_cache set [1,_magazines];

	shop_object setVariable ["Gear",_cache];
};

display_keypress = {
	(_this select 0) displaySetEventHandler ["keyDown","_this call {true}"];
};

