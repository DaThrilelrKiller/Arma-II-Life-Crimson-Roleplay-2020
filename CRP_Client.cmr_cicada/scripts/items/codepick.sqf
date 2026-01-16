private ["_art"];
_art = _this select 0;

if (_art == "use") then 

{
if(player distance PB_3 <= 15) then 
{
[player,"codeb",-1] call storage_add;
if ((random 100) < 50) then 
{	
systemChat  format ["The code to unlock is %1",armat_JailCode];
}else{
systemChat  "Code Breaker Malfunction, Silent Alarm Triggered";		
systemChat "Jail Gate Sensor has gone off!";	
};
};

}else
{
systemChat  "You are not close enough to a gate to the jail";
};
};

if(player distance PB_3 <= 15) then 
{
[player,"codeb",-1] call storage_add;
if ((random 100) < 50) then 
{	
systemChat  format ["The code to unlock is %1",armat_JailCode];
}else{
systemChat  "Code Breaker Malfunction, Silent Alarm Triggered";		
systemChat "Jail Gate Sensor has gone off!";
};
};

}else
{
systemChat  "You are not close enough to a gate to the jail";
};
};
								
		