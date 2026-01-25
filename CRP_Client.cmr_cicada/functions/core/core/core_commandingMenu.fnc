/* this disables the commanding Menu because its really annoying everytime you hit a number key it comes up */
if ((["#USER:","RscMainMenu"] find commandingMenu) < 0)then {
	systemchat commandingMenu;
	showCommandingMenu "#USER:";
};