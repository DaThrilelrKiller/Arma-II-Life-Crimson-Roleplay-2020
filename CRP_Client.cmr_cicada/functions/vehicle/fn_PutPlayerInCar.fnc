targetvar = objNull;
private ["_cop""_vcl"];
_cop = player;
_vcl = (nearestobjects [getpos _cop, ["Air", "Ship", "LandVehicle"], 3] select 0);
if (isNil '_vcl')exitWith { systemChat "No Vehicles In Range!";};
{
    if(_x distance _vcl < 10)then
    {
        if(animationstate _x == "actspercmstpsnonwrfldnon_interrogate02_forgoten") then
        {
            targetvar = _x;
        };
		
		if(animationstate _x == "civillying01") then
        {
            targetvar = _x;
        };
    };
}count playableunits;

if(isNull targetvar)then
{
    systemChat "No Civilians Restrained Close To Vehicle!";
	targetvar = nil;
}else{
format['%1 moveInCargo %2;',targetvar,_vcl]call network_broadcast;
systemChat "You have put the player in the car";
};