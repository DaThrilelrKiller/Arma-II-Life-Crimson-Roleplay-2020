class dtkMap 
{ 
	idc = 56; 
	type = CT_MAP_MAIN; 
	style = ST_PICTURE; 
	x = 0;
	y = 0;
	w = 0;
	h = 0; 
	colorBackground[] = {0.80, 0.80, 0.60, 1.00}; 
	colorText[] = {0.00, 0.00, 0.00, 1.00}; 
	colorSea[] = {0.00, 0.35, 0.50, 0.60}; 
	colorForest[] = {0.10, 0.50, 0.10, 0.50}; 
	colorRocks[] = {0.50, 0.50, 0.50, 0.50}; 
	colorCountlines[] = {0.65, 0.45, 0.27, 0.50}; 
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1.00}; 
	colorCountlinesWater[] = {0.00, 0.53, 1.00, 0.50}; 
	colorMainCountlinesWater[] = {0.00, 0.53, 1.00, 1.00}; 
	colorForestBorder[] = {0.40, 0.80, 0.00, 1.00}; 
	colorRocksBorder[] = {0.50, 0.50, 0.50, 1.00}; 
	colorPowerLines[] = {0.00, 0.00, 0.00, 1.00}; 
	colorNames[] = {0.00, 0.00, 0.00, 1.00}; 
	colorInactive[] = {1.00, 1.00, 1.00, 0.50}; 
	colorLevels[] = {0.00, 0.00, 0.00, 1.00}; 
	colorOutside[] = { 1, 1, 1, 1};
	colorRailWay[] = {1, 0, 0.5, 1};
	alphaFadeStartScale = 1;
	alphaFadeEndScale = 2;
	font = "TahomaB"; 
	sizeEx = 0.1; 
	fontLabel = "TahomaB"; 
	sizeExLabel = 0.1; 
	fontGrid = "TahomaB"; 
	sizeExGrid = 0.02; 
	fontUnits = "TahomaB"; 
	sizeExUnits = 0.02; 
	fontNames = "TahomaB"; 
	sizeExNames = 0.02; 
	fontInfo = "TahomaB"; 
	sizeExInfo = 0.02; 
	fontLevel = "TahomaB"; 
	sizeExLevel = 0.02; 
	stickX[] = {0.20, {"Gamma", 1.00, 1.50} }; 
	stickY[] = {0.20, {"Gamma", 1.00, 1.50} }; 
	ptsPerSquareSea = 6; 
	ptsPerSquareTxt = 8; 
	ptsPerSquareCLn = 8; 
	ptsPerSquareExp = 8; 	
	ptsPerSquareCost = 8; 
	ptsPerSquareFor = "4.0f"; 
	ptsPerSquareForEdge = "10.0f"; 
	ptsPerSquareRoad = 2; 
	ptsPerSquareObj = 10; 
	maxSatelliteAlpha = 0.5;
	text = "\ca\ui\data\map_background2_co.paa"; 
	showCountourInterval=2; 
	scaleDefault = 0.1; 
	onMapSingleClick =  ""; 
	onMouseButtonClick = ""; 
	onMouseButtonDblClick = ""; 

	class ActiveMarker 
	{ 
		color[] = {0.30, 0.10, 0.90, 1.00}; 
		size = 50; 
	}; 
	class Bunker 
	{ 
		icon = "\ca\ui\data\map_bunker_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 14; 
		importance = "1.5 * 14 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Bush 
	{ 
		icon = "\ca\ui\data\map_bush_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 14; 
		importance = "0.2 * 14 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class BusStop 
	{ 
		icon = "\ca\ui\data\map_busstop_ca.paa"; 
		color[] = {0.00, 0.00, 1.00, 1.00}; 
		size = 10; 
		importance = "1 * 10 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Command 
	{ 
		icon = "#(argb,8,8,3)color(1,1,1,1)"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 18; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
	class Cross 
	{ 
		icon = "\ca\ui\data\map_cross_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "0.7 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	};	
	class Chapel 
	{ 
		icon = "\ca\ui\data\map_chapel_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "1 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Church 
	{ 
		icon = "\ca\ui\data\map_church_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	};
	class CustomMark 
	{
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress 
	{ 
		icon = "\ca\ui\data\map_bunker_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Fuelstation 
	{ 
		icon = "\ca\ui\data\map_fuelstation_ca.paa"; 
		color[] = {1.00, 0.35, 0.35, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.75; 
		coefMax = 4.00; 
	}; 
	class Fountain 
	{ 
		icon = "\ca\ui\data\map_fountain_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 12; 
		importance = "1 * 12 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 	
	class Hospital 
	{ 
		icon = "\ca\ui\data\map_hospital_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4; 
	}; 
	class Lighthouse
	{ 
		icon = "\ca\ui\data\map_lighthouse_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 20; 
		importance = "3 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Quay 
	{ 
		icon = "\ca\ui\data\map_quay_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4.00; 
	};
	class Rock 
	{
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Ruin 
	{
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};
	class Stack 
	{ 
		icon = "\ca\ui\data\map_stack_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 20; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class Tree 
	{ 
		icon = "\ca\ui\data\map_tree_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 12; 
		importance = "0.9 * 16 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class SmallTree 
	{ 
		icon = "\ca\ui\data\map_smalltree_ca.paa"; 
		color[] = {0.55, 0.64, 0.43, 1.00}; 
		size = 12; 
		importance = "0.6 * 12 * 0.05"; 
		coefMin = 0.25; 
		coefMax = 4.00; 
	}; 
	class Task 
	{
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {1,1,1,1};
		colorDone[] = {1,1,1,1};
		colorFailed[] = {1,1,1,1};
	};	
	class Tourism 
	{ 
		icon = "\ca\ui\data\map_tourism_ca.paa"; 
		color[] = {0.78, 0.00, 0.05, 1.00}; 
		size = 16; importance = "1 * 16 * 0.05"; 
		coefMin = 0.70; 
		coefMax = 4.00; 
	}; 
	class Transmitter
	{ 
		icon = "\ca\ui\data\map_transmitter_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 20; 
		importance = "2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00; 
	}; 
	class ViewTower 
	{ 
		icon = "\ca\ui\data\map_viewtower_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 16; 
		importance = "2.5 * 16 * 0.05"; 
		coefMin = 0.50; 
		coefMax = 4.00; 
	}; 
	class Watertower 
	{ 
		icon = "\ca\ui\data\map_watertower_ca.paa"; 
		color[] = {0.00, 0.35, 0.70, 1.00}; 
		size = 32; 
		importance = "1.2 * 16 * 0.05"; 
		coefMin = 0.90; 
		coefMax = 4.00;
	}; 
	class Waypoint 
	{ 
		icon = "\ca\ui\data\map_waypoint_ca.paa"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 24; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
	class WaypointCompleted 
	{ 
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa"; 
		color[] = {0.00, 0.00, 0.00, 1.00}; 
		size = 24; 
		importance = 1.00; 
		coefMin = 1.00; 
		coefMax = 1.00; 
	}; 
};