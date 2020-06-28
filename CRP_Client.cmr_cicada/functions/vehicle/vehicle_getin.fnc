private ['_vehicle'];

_vehicle = _this select 0;

if(vehicle player == player) then  {  
	if(locked _vehicle)exitwith{};
	
	if(_vehicle emptyPositions 'Driver' > 0)exitwith  { player action ['getInDriver', _vehicle]};
	if(_vehicle emptyPositions 'Gunner' > 0)exitwith   {player action ['getInGunner', _vehicle]}; 
	if(_vehicle emptyPositions 'Commander' > 0)exitwith{player action ['getInCommander', _vehicle]}; 
	if(_vehicle emptyPositions 'Cargo' > 0)exitwith    {player action ['getInDriver', _vehicle];_vehicle spawn {sleep 0.5;player moveincargo _this;};};
}else{
	if (call garage_near)exitWith{};
	if (call paint_near)exitWith{};
	if(locked _vehicle)exitwith{systemChat  'The vehicle is locked.';}; 
	if(speed _vehicle > 30)exitwith{systemChat  'The vehicle is moving too fast';}; 
	player action ['getOut', _vehicle];  
};