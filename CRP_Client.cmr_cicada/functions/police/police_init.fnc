if (dtk_client && {dtk_cop})then {
["Pit Vehicle","ku",["R",false,false,false],police_pit]call keypress_add;
["Request Backup","ku",["`",false,false,false],{[]call police_panic}]call keypress_add;
};