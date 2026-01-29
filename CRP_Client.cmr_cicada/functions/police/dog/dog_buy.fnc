private ["_type","_grp","_name","_dog"];

if (alive dtk_dog)exitWith {
	systemchat"You can not own more then 1 dogs!";
};

if !([player,"geld",-dog_cost] call storage_add)exitWith {
	systemchat"You dont have enough money";
};

systemchat format["%1 bought a dog for %2", name player, (dog_cost call string_intToString)];

_type = "Pastor";
_grp = group player;
_name = format ["CLAY_tmpDog%1", round (random 1000)];


call compile format ["_type createUnit [[(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)), 0], _grp, '%1 = this']", _name];
dtk_dog = call compile format ["%1", _name];
dtk_dog setDir getDir player;
player setVariable ["CLAY_DogUnit", dtk_dog];
player setVariable ["CLAY_DogStatus", "Waiting"];