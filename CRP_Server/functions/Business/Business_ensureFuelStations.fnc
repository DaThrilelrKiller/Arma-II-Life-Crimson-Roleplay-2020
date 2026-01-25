/*
	Ensures business_fuelStations is populated with DTK fuel station objects.
*/

if (isNil "business_fuelStations") then { business_fuelStations = []; };

if (count business_fuelStations >= 5) exitWith {business_fuelStations};

private _stations = [];
{
	private _obj = missionNamespace getVariable [_x, objNull];
	if (!isNull _obj) then { _stations set [count _stations, _obj]; };
} forEach ["DTK_Shop_Fuel_1","DTK_Shop_Fuel_2","DTK_Shop_Fuel_3","DTK_Shop_Fuel_4","DTK_Shop_Fuel_5"];

business_fuelStations = _stations;
business_fuelStations

