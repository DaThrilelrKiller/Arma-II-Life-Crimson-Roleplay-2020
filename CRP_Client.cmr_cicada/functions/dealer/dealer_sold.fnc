_vehicle = _this select 0;
_price =  _this select 1;
_name =  _this select 2;
_display = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayname");

dtk_bank = dtk_bank + _price;
systemchat format["%1 has bought your %2 from the Dealership for %3",_name,_display,[_price]call main_formatmoney];
