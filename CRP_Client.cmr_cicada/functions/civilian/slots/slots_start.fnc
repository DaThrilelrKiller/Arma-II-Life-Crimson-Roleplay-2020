
private ["_machine","_wallet","_wheel","_wheel1","_wheel2","_wheel3","_wheel4","_rNumber","_payout"];
_machine = _this;
_wallet = [player,"geld"] call storage_amount;
if (_wallet < 5) exitWith {systemChat  "Sorry, you dont have enough money to play.";};

if (time < dtk_playing_slots)exitWith {systemChat format ["wait: %1 seconds before playing again",(dtk_playing_slots - time)];};

if (_machine animationPhase "armat_wheel" > 0)exitWith 
{
	systemchat "Please wait while we rest the machine";
	_machine animate ["armat_wheel",0];
	_machine animate ["armat_wheel1",0];
	_machine animate ["armat_wheel2",0];
	_machine animate ["armat_wheel3",0];
	_machine animate ["armat_wheel4",0];
	_handler = [_machine,[
	["armat_wheel",0],
	["armat_wheel1",0],
	["armat_wheel2",0],
	["armat_wheel3",0],
	["armat_wheel4",0]
	]]spawn slots_animationDone;
	waitUntil {scriptDone _handler};
	systemchat "Slot machine has been reset, go for a spin";
};

[player,"geld",-5] call storage_add;
["ALL",[_machine,"slot",7],"network_say3d",false,true]call network_MPExec;



_wheel = random (random 20);
_wheel1 = random (random 20);
_wheel2 = random (random 20);
_wheel3 = random (random 20);
_wheel4 = random (random 20);

_machine animate ["armat_wheel",_wheel];
_machine animate ["armat_wheel1",_wheel1];
_machine animate ["armat_wheel2",_wheel2];
_machine animate ["armat_wheel3",_wheel3];
_machine animate ["armat_wheel4",_wheel4];

_handler = [_machine,[
["armat_wheel",_wheel],
["armat_wheel1",_wheel1],
["armat_wheel2",_wheel2],
["armat_wheel3",_wheel3],
["armat_wheel4",_wheel4]
]]spawn slots_animationDone;
waitUntil {scriptDone _handler};

if ([90]call Main_Random)exitWith {systemChat  "Sorry you've lost, please play again!";dtk_playing_slots = time;};
dtk_playing_slots = time + 300;

_rNumber = random 1000;
_payout = round(_rNumber*0.25);

["ALL",[_machine,"slotwin",7],"network_say3d",false,true]call network_MPExec;

[player,"geld",_payout] call storage_add;
systemChat  "Congratulations on your win at the Emita Casino! You now must wait 5 minutes to spin again!";
["ALL",["dtk_client",format["%1 JUST WON THE JACKPOT AT THE Emita CASINO!",name player],3],"network_chat",false,true]call network_MPExec;
