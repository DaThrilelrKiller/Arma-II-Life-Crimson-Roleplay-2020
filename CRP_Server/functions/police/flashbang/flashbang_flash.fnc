_bullet = _this select 0;
_timenow = time;

waitUntil {(velocity _bullet)select 0 == 0};

if ((player distance _bullet) < 11)then
{
	while{time < (_timenow + 10)}do
	{
		if (not(alive player)) exitWith {};
		2 cutText ["","WHITE OUT",0];
		sleep 5;
		2 cutText ["","WHITE IN",3];
		sleep 1;
	};
};