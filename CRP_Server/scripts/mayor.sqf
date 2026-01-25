_this = _this select 3;
_art  = _this select 0;

if (_art == "steuernMayor") then 
{								
	_item = _this select 1;			
	_mag  = _this select 2;													
	_weap = _this select 3;							
	_vcl  = _this select 4;							
	_bank = _this select 5;

	// Server-authoritative: only the current whitelisted governor can apply changes.
	["SERVER",[player,_item,_mag,_weap,_vcl,_bank],"s_goverment_setTaxes",false,false]call network_MPExec;
};

if (_art == "clientgesetz") then
{
	_nummer = _this select 1;
	_text   = _this select 2;
	if (_nummer == -1) exitWith {};

	// Server-authoritative: only the current whitelisted governor can apply changes.
	["SERVER",[player,_nummer,_text],"s_goverment_setLaws",false,false]call network_MPExec;
};