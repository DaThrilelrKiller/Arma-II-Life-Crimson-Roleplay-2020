private ["_vehicle","_siren","_number","_siren"];
_vehicle = (vehicle player);


if (driver _vehicle !=  player)exitWith {true};

_siren = _vehicle getVariable "dtk_siren";
if (isnil "_siren")exitWith {};

if (dtk_sirenon)exitWith {true};
dtk_sirenon = true;

if ((call siren_mode) == "Manual")then
{
	call siren_playManual;
}
else
{
	[]spawn siren_playAuto;
};

true
