player createDiarySubject ["PureNav","Map Navigation"];

 player createDiaryRecord ["PureNav", ["Hide/Show Markers", 
    "
	Main<br/>
	<execute expression='[""ShowAll"",""""]spawn gps_sort; '>Show All Markers</execute><br/>
	<execute expression='[""HideAll"",""""]spawn gps_sort;  '>Hide All Markers</execute><br/>
	<br/>
	Color<br/>
	<execute expression='[""colorName"",""ColorBlue""]spawn gps_sort; '>Show Blue</execute><br/>
	<execute expression='[""colorName"",""ColorOrange""]spawn gps_sort; '>Show Orange</execute><br/>
	<execute expression='[""colorName"",""ColorYellow""]spawn gps_sort; '>Show Yellow</execute><br/>
	<execute expression='[""colorName"",""ColorRed""]spawn gps_sort; '>Show Red</execute><br/>
	<execute expression='[""colorName"",""ColorWhite""]spawn gps_sort; '>Show White</execute><br/>
	<execute expression='[""colorName"",""ColorBlack""]spawn gps_sort; '>Show Black</execute><br/>
	<execute expression='[""colorName"",""ColorGreen""]spawn gps_sort; '>Show Green</execute><br/>
	<execute expression='[""colorName"",""ColorKhaki""]spawn gps_sort; '>Show Khaki</execute><br/>
	"]];