private ["_vehicle","_dog"];

_vehicle = dtk_dog getVariable "CLAY_DogVehicle";
detach dtk_dog;
dtk_dog setPos [(getPos _vehicle select 0) + (-5 * sin (getDir _vehicle)), (getPos _vehicle select 1) + (-5 * cos (getDir _vehicle)), 0.5];
dtk_dog setDir (getDir _vehicle + 180);
dtk_dog enableAI "ANIM";
dtk_dog playMove "Dog_Run";
sleep 1;
player setVariable ["CLAY_DogStatus", "Waiting"];