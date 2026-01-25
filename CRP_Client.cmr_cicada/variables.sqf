// Compatibility wrapper for missions that expect variables.sqf
// Keep this lightweight and safe to run multiple times.
if (!isNil "DTK_VariablesLoaded") exitWith {};
DTK_VariablesLoaded = true;

call compile preprocessFile "configuration\CfgVariables.sqf";

