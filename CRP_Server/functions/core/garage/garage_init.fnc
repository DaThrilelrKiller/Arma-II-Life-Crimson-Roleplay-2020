if (dtk_client)then {
	call garage_markers;
	["Open Garage","kd",["E",false,false,false],garage_open]call keypress_add;
};