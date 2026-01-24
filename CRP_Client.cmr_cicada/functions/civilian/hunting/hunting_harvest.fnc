private ["_animal","_amount","_animalType","_tagItem","_meatItem","_taggedMeatItem","_hasTag","_item"];
_animal = _this select 0;
_amount = ceil(random 7);

_animalType = typeOf _animal;

_tagItem = call {
	if (_animalType == "WildBoar")exitWith {"huntingtag_boar"};
	if (_animalType == "Rabbit")exitWith {"huntingtag_rabbit"};
	if (_animalType in ["Cow","Cow01","Cow02","Cow03","Cow04","Cow01_EP1"])exitWith {"huntingtag_cow"};
	if (_animalType in ["Goat","Goat01_EP1","Goat02_EP1"])exitWith {"huntingtag_goat"};
	if (_animalType in ["Sheep","Sheep01_EP1","Sheep02_EP1"])exitWith {"huntingtag_sheep"};
	"huntingtag_cow"
};

_meatItem = call {
	if (_animalType == "WildBoar")exitWith {"rawboar"};
	if (_animalType == "Rabbit")exitWith {"rawrabbit"};
	if (_animalType in ["Cow","Cow01","Cow02","Cow03","Cow04","Cow01_EP1"])exitWith {"rawcow"};
	if (_animalType in ["Goat","Goat01_EP1","Goat02_EP1"])exitWith {"rawgoat"};
	if (_animalType in ["Sheep","Sheep01_EP1","Sheep02_EP1"])exitWith {"rawsheep"};
	"rawcow"
};

_taggedMeatItem = _meatItem + "_tagged";
_hasTag = [player,_tagItem] call storage_amount;

if (_hasTag > 0) then {
	[player,_tagItem,-1] call storage_add;
	_item = _taggedMeatItem;
	systemChat format["You used a hunting tag and got %1 tagged meat", _amount];
} else {
	_item = _meatItem;
	systemChat format["You got %1 untagged meat (no hunting tag used)", _amount];
};

if ([player,_item,_amount] call storage_add)then {
	deletevehicle _animal;
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
} else {
	systemchat "Your inventoy is full";
};