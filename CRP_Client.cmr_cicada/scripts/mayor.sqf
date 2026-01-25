_this = _this select 3;
_art  = _this select 0;

if (_art == "steuernMayor") then 
{								
	_item = _this select 1;			
	_mag  = _this select 2;													
	_weap = _this select 3;							
	_vcl  = _this select 4;							
	_bank = _this select 5;
	
	call compile format ["
	(INV_ItemTypenArray select 0) SET [2, %1]; 
	(INV_ItemTypenArray select 1) SET [2, %2]; 
	(INV_ItemTypenArray select 2) SET [2, %3]; 
	(INV_ItemTypenArray select 3) SET [2, %4];						
	bank_steuer = %5; 
	publicVariable 'INV_ItemTypenArray';
	publicVariable 'bank_steuer';
	", _item, _vcl, _mag, _weap, _bank];
	
	"hint ""The Governor Has Changed The Taxes!"";"call network_broadcast;
};

if (_art == "clientgesetz") then
{
	_nummer = _this select 1;
	_text   = _this select 2;
	if (_nummer == -1) exitWith {};
	format ["GesetzArray SET [%1, ""%2""];
	hint format [localize ""STRS_gilde_gesetze_public"", %1, ""%2""];", _nummer, _text] call network_broadcast;
};