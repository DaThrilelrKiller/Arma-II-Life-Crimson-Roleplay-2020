
_animal = _this select 0;
_amount = ceil(random 7);

_item = call {
	if (typeOf _animal == "WildBoar")exitWith {"boar"};
	if (typeOf _animal == "Rabbit")exitWith {"rabbit"};
	if (typeOf _animal in ["Cow","Cow01","Cow02","Cow03","Cow04","Cow01_EP1"])exitWith {"rawcow"};
	if (typeOf _animal in ["Goat","Goat01_EP1","Goat02_EP1","Sheep","Sheep01_EP1","Sheep02_EP1"])exitWith {"rawcow"};
	"rawcow"
};


if ([player,_item,_amount] call storage_add)then {
	deletevehicle _animal;
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	systemChat  format["you got %1 meat", _amount];
}else{
	systemchat "Your inventoy is full";
};