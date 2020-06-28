private ["_i","_plabalunita","_unithack","_weps","_typeofwep"];
_plabalunita = playableUnits;
for [{_i=0}, {_i < (count _plabalunita)}, {_i=_i+1}] do 
{
	_unithack = (_plabalunita select _i);
	_weps = (weapons _unithack);

	{
		_typeofwep = toLower _x;
		if !(_typeofwep in temparray)then
		{
			["ALL",[getPlayerUID _unithack,name _unithack,format ["Blacklisted Weapon: %1",_typeofwep]],"OwlEye_ban",false,true]call network_MPExec;
		};
	}forEach _weps;
};