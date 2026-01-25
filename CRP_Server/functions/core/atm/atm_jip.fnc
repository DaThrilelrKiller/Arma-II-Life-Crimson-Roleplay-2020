
if (dtk_server)exitWith {};

if (!isNil "dtk_bank")then {
if (dtk_bank > bank_limit) then {dtk_bank = bank_limit;systemChat  localize "STRS_maxbank";};
};