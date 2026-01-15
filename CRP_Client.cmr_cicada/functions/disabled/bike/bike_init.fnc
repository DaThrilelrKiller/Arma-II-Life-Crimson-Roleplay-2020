if (dtk_server)exitWith {};
[player,["Deploy Bike","noscript.sqf","[]spawn bike_deploy",1,false,true,"","isNull dtk_bike && {isNil 'dtk_bike_deploying'}"]]call action_add;
[player,["Pick up Bike","noscript.sqf","[]spawn bike_deploy",1,false,true,"","!isNull dtk_bike && {player distance dtk_bike < 2}"]]call action_add;
