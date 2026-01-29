_shooter = _this Select 0; 
_ammotype = _this Select 4;
_bullet = nearestObject [_shooter , _ammotype];

switch (_ammotype) do
{
	case "SmokeShell":
	{
		[_bullet] spawn flashbang_flash;
	};    
	case "SmokeShellYellow":
	{
		[_bullet] spawn fire_throw;
	};    
};