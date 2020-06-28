
_animal = _this select 0;
_amount = ceil(random 7);

_item = call {
	if (typeOf _animal == "WildBoar")exitWith {"boar"};
	if (typeOf _animal == "cow01")exitWith {"rawcow"};
	if (typeOf _animal == "Rabbit")exitWith {"rawcow"};
};


if ([player,_item,_amount] call storage_add)then {
	deletevehicle _animal;
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	systemChat  format["you got %1 meat", _amount];
}else{
	systemchat "Your inventoy is full";
};