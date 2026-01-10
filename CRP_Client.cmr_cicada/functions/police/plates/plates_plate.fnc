private ["_vehicle","_plate","_ui"];

ar_plates = !ar_plates;

_text = ["Disabled","Enabled"]select ar_plates;

systemchat format ["Licences Plates: %1",_text];

while {ar_plates} do 
{
	waitUntil {!isNull cursorTarget || {!ar_plates}};
	if !(ar_plates)exitWith {};
	_vehicle = CursorTarget;

	if ([player,_vehicle,1]call bis_isInFrontOf && {!local _vehicle} && {!([_vehicle,player,1]call bis_isInFrontOf)} && {player distance _vehicle < 15})then 
	{

		_plate = _vehicle getVariable "dtk_plate";

		if (!isNil '_plate')then 
		{
			private ["_ui","_Main"];
			disableSerialization;

			589 cutRsc ["ar_plate","PLAIN"];
					
			_ui = uiNameSpace getVariable "ar_plate";
			dtk_current_plate = format ['%1%2%3%4%5%6%7%8',(_plate select 0),(_plate select 1),(_plate select 2),(_plate select 3),(_plate select 4),(_plate select 5),(_plate select 6),(_plate select 7)];
			(_ui displayCtrl 20) ctrlSetText dtk_current_plate;
			
		};
		sleep 1;
	};
	sleep 0.5;
};