

_this addaction['','noscript.sqf',format["[%1]call vehicle_getIn;",_this],-1,false,true,'LeanRight','vehicle player == _target'];
_this addaction['','noscript.sqf',format["[%1]call vehicle_getIn;",_this],-1,false,true,'LeanRight','player distance _target < 5 && {(_target call vehicle_side) == dtk_side or dtk_side == "CIV"} && {vehicle player == player} && {!(locked _target)} && {!([_target,"Get In (E)",""]call tag_show)}'];
_this addaction['','noscript.sqf',format["[%1]call vehicle_menu;",_this],-1,false,true,'LeanRight','player distance _target < 5 && {vehicle player == player} && {dtk_side == "PD"}  && {(locked _target)} &&  {!([_target,"Vehicle Menu (E)",""]call tag_show)}'];
_this addaction["Roll Vehicle Over","noscript.sqf",'[]spawn vehicle_unflip;',1,false,true,"",'player distance _target < 5'];
_this addaction["Pull Player Out","noscript.sqf",'_this spawn Other_pullout;',1,true,true,"",'player distance _target < 5 && {count (crew _target) > 0} && {(call INV_isArmed)}'];

_this call ems_SwitchGear;

if (dtk_civ) then {
    _this addaction["Impound Vehicle","noscript.sqf",format['[%1]call impound_add;',_this],1,true,true,"",'[_target,["Air", "Ship", "LandVehicle"]]call core_isKindOf and player distance _target < 10 and player distance newimpoundlot < 15 '];
    _this addaction["Tow Vehicle","noscript.sqf",format['["TOW",%1] call Other_Towing;',_this],1,true,true,"",'player distance _target < 10 and _target getVariable "towing" == "" and [player,_target]call keys_has'];
    _this addaction["Release Vehicle","noscript.sqf",format['["RELEASE",%1] call Other_Towing;',_this],1,true,true,"",'player distance _target < 10 and _target getVariable "towing" != "" and [player,_target]call keys_has'];

if (dtk_cop) then {
    _this addaction[localize "STRS_addaction_trunk_see","noscript.sqf",format['[%1]call storage_seach;',_this],1,true,true,"",'[_target,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _target < 10}'];
};

if (dtk_ems) then {
    _this addaction["Repair Vehicle","noscript.sqf",format['[%1]call Other_repairvehicle;',_this],1,true,true,"",'[_target,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _target < 10}'];
};