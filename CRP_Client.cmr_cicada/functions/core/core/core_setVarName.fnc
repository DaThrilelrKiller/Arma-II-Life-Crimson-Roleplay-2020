

_this setVehicleInit format [
"
	this setVehicleVarName 'uid_%2_%1';
	uid_%2_%1 = this; 
"
, round(random 100), round(time)];
	
processInitCommands;