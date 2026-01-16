_NearRuins = (nearestObjects [player, ["Ruins"], 15]select 0);
if (isNil "_NearRuins")exitWith {systemChat "You are not near a collaped building";};