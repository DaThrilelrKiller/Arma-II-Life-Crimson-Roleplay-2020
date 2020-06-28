_this setVariable ["dtk_slots","resting",true];

systemchat "Please wait while we rest the machine";
_this animate ["armat_wheel",0];
_this animate ["armat_wheel1",0];
_this animate ["armat_wheel2",0];
_this animate ["armat_wheel3",0];
_this animate ["armat_wheel4",0];
_handler = [_this,[
["armat_wheel",0],
["armat_wheel1",0],
["armat_wheel2",0],
["armat_wheel3",0],
["armat_wheel4",0]
]]spawn slots_animationDone;
waitUntil {scriptDone _handler};
systemchat "Slot machine has been reset, go for a spin";