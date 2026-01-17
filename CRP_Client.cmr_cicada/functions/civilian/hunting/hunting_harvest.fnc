
_animal = _this select 0;
_amount = ceil(random 7);

_item = call {
	if (typeOf _animal == "WildBoar")exitWith {"boar"};
	if (typeOf _animal == "Cow01")exitWith {"rawcow"};
	if (typeOf _animal == "Goat")exitWith {"rawcow"};
	if (typeOf _animal == "Sheep")exitWith {"rawcow"};
	if (typeOf _animal == "seagulls")exitWith {"rabbit"};
	if (typeOf _animal == "Rabbit")exitWith {"rabbit"};
	"rawcow"
};


if ([player,_item,_amount] call storage_add)then {
	deletevehicle _animal;
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	systemChat  format["you got %1 meat", _amount];
}else{
	systemchat "Your inventoy is full";
};