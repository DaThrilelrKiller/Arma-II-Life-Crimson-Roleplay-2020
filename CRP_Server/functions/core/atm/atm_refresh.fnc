private["_slider","_data"];

while {ctrlVisible 1003} do 
{
	_slider = ctrlText 2;
	if (!(_slider call string_isInteger)) then {_slider = 0;};
	_slider = _slider call string_toInt; 
	if (_slider < 0) then {_slider = 0;};

	_data = call compile lbData [1, lbCurSel 1];

	if (_data select 1 == player) then 
	{
		CtrlSetText [4,""];
		CtrlSetText [5,""];
	} 
	else 
	{
		CtrlSetText [4, localize "STRS_bank_dialoge_tax"]; 
		CtrlSetText [5, format ["$%1", ((round((_slider*100)/(100-bank_steuer))) call string_intToString)]];
	};
	sleep 0.3;
};