private ["_array"];

_array = robbery_dialog_array call BIS_selectRandom;
{
	if (robbing)then
	{
	1560 cutText [_x,"PLAIN DOWN"];
	}
	else
	{
	exit;
	};
sleep 5;
}count _array;