private ["_i","_plabalunita","_unithack","_mags","_typeofmag"];
_plabalunita = playableUnits;
for [{_i=0}, {_i < (count _plabalunita)}, {_i=_i+1}] do 
{
_unithack = (_plabalunita select _i);
_mags = (magazines _unithack);

{
	_typeofmag = toLower _x;
	if !(_typeofmag in temparray)then
	{
		["ALL",[getPlayerUID _unithack,name _unithack,format["Blacklisted Magizine: %1",_typeofmag]],"OwlEye_ban",false,true]call network_MPExec;
	};
	true
}count _mags;