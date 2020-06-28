
{ 
	if (_x call TFAR_fnc_isRadio)then {
		AR_Radios set [count AR_Radios, _x];
		player removeWeapon _x;
	};
	nil
}forEach (weapons player);

player removeWeapon "ItemRadio";