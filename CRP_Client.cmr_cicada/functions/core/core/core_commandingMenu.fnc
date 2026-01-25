/* this disables the commanding Menu because its really annoying everytime you hit a number key it comes up */
if !(commandingMenu in ["#USER:","RscMainMenu"])then {
	systemchat commandingMenu;
	showCommandingMenu "#USER:";
};