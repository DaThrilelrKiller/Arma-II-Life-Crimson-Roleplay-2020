createDialog "admin_inventory";
admin_selected = 4;
[2100, true] call dtk_PlayerListToControl;
call admin_load;

"Item" call admin_loadFromConfig;
[]spawn admin_inventory_handler;