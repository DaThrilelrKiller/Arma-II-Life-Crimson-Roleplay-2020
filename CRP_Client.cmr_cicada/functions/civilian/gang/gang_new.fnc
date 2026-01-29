createDialog "gang_menu1";

call gang_list;

/* sets buttons */
ctrlSetText [6,"Create"];
buttonSetAction [6,"call gang_create"];
ctrlSetText [7,"Join"];
buttonSetAction [7,"call gang_join"];

/* disables buttons that are not needed if your not in a gang */
ctrlEnable [7, false];
ctrlEnable [8, false];
ctrlEnable [9, false];
ctrlEnable [10, false];
ctrlEnable [11, false];
ctrlEnable [12, false];


