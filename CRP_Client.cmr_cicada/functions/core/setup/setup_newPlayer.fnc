
player removeAllEventHandlers "fired";	
player removeAllEventHandlers "handleDamage";	
player removeAllEventHandlers "killed";	
player removeAllEventHandlers "respawn";	

player addEventHandler ["fired", { _this call setup_fired;}];
player addEventHandler ["handleDamage", {_this call events_sethit}];
player addMPEventHandler ["MPKilled",{_this call killfeed_display;}];
player addEventHandler ["respawn", {_this call setup_respawn; _this}]; 