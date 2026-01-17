

_this setVehicleInit format [
"
	this setVehicleVarName 'uid_%2_%1_%3_%4';
	uid_%2_%1_%3_%4 = this; 
"
, round(random 1000), round(time),typeOf _this,player];
	
processInitCommands;