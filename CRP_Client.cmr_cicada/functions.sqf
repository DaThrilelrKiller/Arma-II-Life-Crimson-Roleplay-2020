// Client function loader (Arma 2 OA).
// This mission's `pre_init.sqf` expects `functions.sqf` to exist and compile all client functions.
//
// Naming convention: each `functions\**\*.fnc` is compiled into a global variable matching its basename.
// Example: `functions\core\network\network_MPExec.fnc` -> `network_MPExec`
//
// Keep idempotent (safe to run multiple times).
if (!isNil "DTK_FunctionsLoaded") exitWith {};
DTK_FunctionsLoaded = true;

if (isNil "dtk_fnc_total") then { dtk_fnc_total = 0; } else { dtk_fnc_total = 0; };

// ------------------------------------------------------------------
// Module variables (must load before functions)
// ------------------------------------------------------------------
// Generated from the repository contents.

// NOTE: paths must use backslashes for Arma 2.
// ---- *.variables ----
call compile preprocessFile "functions\admin\_module.variables";
call compile preprocessFile "functions\checkpoint\_module.variables";
call compile preprocessFile "functions\civilian\bank\_module.variables";
call compile preprocessFile "functions\civilian\chop\_module.variables";
call compile preprocessFile "functions\civilian\codepad\_module.variables";
call compile preprocessFile "functions\civilian\drug\_module.variables";
call compile preprocessFile "functions\civilian\factory\_module.variables";
call compile preprocessFile "functions\civilian\fishing\_module.variables";
call compile preprocessFile "functions\civilian\gallery\_module.variables";
call compile preprocessFile "functions\civilian\gang\_module.variables";
call compile preprocessFile "functions\civilian\hunting\_module.variables";
call compile preprocessFile "functions\civilian\lab\_module.variables";
call compile preprocessFile "functions\civilian\lotto\_module.variables";
call compile preprocessFile "functions\civilian\oil\_module.variables";
call compile preprocessFile "functions\civilian\robbery\_module.variables";
call compile preprocessFile "functions\civilian\shipment\_module.variables";
call compile preprocessFile "functions\civilian\slots\_module.variables";
call compile preprocessFile "functions\civilian\taxi\_module.variables";
call compile preprocessFile "functions\civilian\vault\_module.variables";
call compile preprocessFile "functions\civilian\zone\_module.variables";
call compile preprocessFile "functions\clothing\_module.variables";
call compile preprocessFile "functions\core\action\_module.variables";
call compile preprocessFile "functions\core\array\_module.variables";
call compile preprocessFile "functions\core\atm\_module.variables";
call compile preprocessFile "functions\core\bis\_module.variables";
call compile preprocessFile "functions\core\chat\_module.variables";
call compile preprocessFile "functions\core\config\_module.variables";
call compile preprocessFile "functions\core\core\_module.variables";
call compile preprocessFile "functions\core\credit\_module.variables";
call compile preprocessFile "functions\core\dance\_module.variables";
call compile preprocessFile "functions\core\fuel\_module.variables";
call compile preprocessFile "functions\core\garage\_module.variables";
call compile preprocessFile "functions\core\gear\_module.variables";
call compile preprocessFile "functions\core\hud\_module.variables";
call compile preprocessFile "functions\core\hunger\_module.variables";
call compile preprocessFile "functions\core\keypress\_module.variables";
call compile preprocessFile "functions\core\keys\_module.variables";
call compile preprocessFile "functions\core\licenses\_module.variables";
call compile preprocessFile "functions\core\log\_module.variables";
call compile preprocessFile "functions\core\network\_module.variables";
call compile preprocessFile "functions\core\roads\_module.variables";
call compile preprocessFile "functions\core\settings\_module.variables";
call compile preprocessFile "functions\core\setup\_module.variables";
call compile preprocessFile "functions\core\shops\_module.variables";
call compile preprocessFile "functions\core\stats\_module.variables";
call compile preprocessFile "functions\core\storage\_module.variables";
call compile preprocessFile "functions\core\string\_module.variables";
call compile preprocessFile "functions\core\tag\_module.variables";
call compile preprocessFile "functions\core\whitelist\_module.variables";
call compile preprocessFile "functions\court\_module.variables";
call compile preprocessFile "functions\dealer\_module.variables";
call compile preprocessFile "functions\disabled\bike\_module.variables";
call compile preprocessFile "functions\disabled\camera\_module.variables";
call compile preprocessFile "functions\disabled\music\_module.variables";
call compile preprocessFile "functions\disabled\race\_module.variables";
call compile preprocessFile "functions\disabled\template\_module.variables";
call compile preprocessFile "functions\disabled\test\_module.variables";
call compile preprocessFile "functions\donuts\_module.variables";
call compile preprocessFile "functions\drugs\_module.variables";
call compile preprocessFile "functions\ems\_module.variables";
call compile preprocessFile "functions\ems\fire\_module.variables";
call compile preprocessFile "functions\ems\gas\_module.variables";
call compile preprocessFile "functions\ems\spill\_module.variables";
call compile preprocessFile "functions\experience\_module.variables";
call compile preprocessFile "functions\gates\_module.variables";
call compile preprocessFile "functions\goverment\_module.variables";
call compile preprocessFile "functions\gps\_module.variables";
call compile preprocessFile "functions\groups\_module.variables";
call compile preprocessFile "functions\holster\_module.variables";
call compile preprocessFile "functions\house\_module.variables";
call compile preprocessFile "functions\impound\_module.variables";
call compile preprocessFile "functions\ipad\_module.variables";
call compile preprocessFile "functions\items\_module.variables";
call compile preprocessFile "functions\killfeed\_module.variables";
call compile preprocessFile "functions\locations\_module.variables";
call compile preprocessFile "functions\markers\_module.variables";
call compile preprocessFile "functions\medical\_module.variables";
call compile preprocessFile "functions\mounted\_module.variables";
call compile preprocessFile "functions\paint\_module.variables";
call compile preprocessFile "functions\police\_module.variables";
call compile preprocessFile "functions\police\cdb\_module.variables";
call compile preprocessFile "functions\police\cuffs\_module.variables";
call compile preprocessFile "functions\police\dog\_module.variables";
call compile preprocessFile "functions\police\fingerprints\_module.variables";
call compile preprocessFile "functions\police\flashbang\_module.variables";
call compile preprocessFile "functions\police\id\_module.variables";
call compile preprocessFile "functions\police\jail\_module.variables";
call compile preprocessFile "functions\police\plates\_module.variables";
call compile preprocessFile "functions\police\speedcam\_module.variables";
call compile preprocessFile "functions\quest\_module.variables";
call compile preprocessFile "functions\siren\_module.variables";
call compile preprocessFile "functions\spawn\_module.variables";
call compile preprocessFile "functions\tfar\_module.variables";
call compile preprocessFile "functions\tower\_module.variables";
call compile preprocessFile "functions\vehicle\_module.variables";

// ------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------
// Generated from the repository contents.

admin_clothes = compile preprocessFile "functions\admin\admin_clothes.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_console = compile preprocessFile "functions\admin\admin_console.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_console_exec = compile preprocessFile "functions\admin\admin_console_exec.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_console_handler = compile preprocessFile "functions\admin\admin_console_handler.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_console_recents = compile preprocessFile "functions\admin\admin_console_recents.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_exec1 = compile preprocessFile "functions\admin\admin_exec1.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_init = compile preprocessFile "functions\admin\admin_init.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_inventory = compile preprocessFile "functions\admin\admin_inventory.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_inventory_add = compile preprocessFile "functions\admin\admin_inventory_add.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_inventory_handler = compile preprocessFile "functions\admin\admin_inventory_handler.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_inventory_remove = compile preprocessFile "functions\admin\admin_inventory_remove.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_licenses = compile preprocessFile "functions\admin\admin_licenses.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_licenses_add = compile preprocessFile "functions\admin\admin_licenses_add.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_licenses_handler = compile preprocessFile "functions\admin\admin_licenses_handler.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_licenses_remove = compile preprocessFile "functions\admin\admin_licenses_remove.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_load = compile preprocessFile "functions\admin\admin_load.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_loadFromConfig = compile preprocessFile "functions\admin\admin_loadFromConfig.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_logs = compile preprocessFile "functions\admin\admin_logs.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_logs_add = compile preprocessFile "functions\admin\admin_logs_add.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_monitor = compile preprocessFile "functions\admin\admin_monitor.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_move = compile preprocessFile "functions\admin\admin_move.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_open = compile preprocessFile "functions\admin\admin_open.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_Revive = compile preprocessFile "functions\admin\admin_Revive.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_sound_change = compile preprocessFile "functions\admin\admin_sound_change.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_sound_mode = compile preprocessFile "functions\admin\admin_sound_mode.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_sounds = compile preprocessFile "functions\admin\admin_sounds.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_spectate = compile preprocessFile "functions\admin\admin_spectate.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_tags = compile preprocessFile "functions\admin\admin_tags.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_teleport = compile preprocessFile "functions\admin\admin_teleport.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_vehicles = compile preprocessFile "functions\admin\admin_vehicles.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_vehicles_create = compile preprocessFile "functions\admin\admin_vehicles_create.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_weapons = compile preprocessFile "functions\admin\admin_weapons.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_weapons_add = compile preprocessFile "functions\admin\admin_weapons_add.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_weapons_handler = compile preprocessFile "functions\admin\admin_weapons_handler.fnc"; dtk_fnc_total = dtk_fnc_total + 1;
admin_weapons_remove = compile preprocessFile "functions\admin\admin_weapons_remove.fnc"; dtk_fnc_total = dtk_fnc_total + 1;

// ... (generated list continues for all *.fnc in functions\...)

