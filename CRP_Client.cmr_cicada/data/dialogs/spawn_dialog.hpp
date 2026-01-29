class AR_SpawnMenu
{
	idd = 1600;
	movingEnable = true;
	objects[] = {};
	onLoad = "[]spawn spawn_menu; _this call display_keypress";
	class controls
	{	

		class RscPicture_1200: RscBackground
		{
			idc = 33333;

			text = "";
			x = 0.00206971;
			y = 0.00354552;
			w = 0.99539;
			h = 0.992435;
		};
		class RscPicture_1201: Rsc_lable
		{
			idc = 1201;
			text = "";
			x = 0.00206971;
			y = -0.000395358;
			w = 0.998345;
			h = 0.0763596;
		};
		class Spawn: RscButton
		{
			idc = 1601;
			action = "";
			text = "Spawn";
			x = 0.520685;
			y = 0.848699;
			w = 0.4487;
			h = 0.10197;
		};
		class SpawnList: RscListBox
		{
			idc = 1401;
			x = 0.0312499;
			y = 0.100001;
			w = 0.437499;
			h = 0.85;
			onLBSelChanged = "[]spawn spawn_animatemap;";
		};
		class kndr_MapControl 
		{ 
			idc = 10023; 
			type = CT_MAP_MAIN; 
			style = ST_PICTURE; 
			x = 0.528073;
			y = 0.100079;
			w = 0.441932;
			h = 0.572223;
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
		
		class Custmize: RscButton
		{
			idc = 1602;
			text = "Change Nation";
			action = "[]call spawn_changeNation";
			x = 0.525118;
			y = 0.712766;
			w = 0.4487;
			h = 0.10197;
		};
	};
};

class test_map
{
	idd = 16100;
	movingEnable = true;
	objects[] = {};
	onLoad = "";
	class controls
	{	
		class kndr_MapControl 
		{ 
			idc = 10023; 
			type = CT_MAP_MAIN; 
			style = ST_PICTURE; 
			x = SafeZoneXAbs;
			y = SafeZoneY;
			w = SafeZoneWAbs;
			h = SafeZoneH;
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
		
	};
};


class dtk_infomation
{
	idd = 1601;
	movingEnable = false;
	objects[] = {};
	onLoad = "_this call display_keypress";
	
	class ControlsBackground
	{
		class RscPicture_1200 : RscBackground 
		{
			idc = -1;
			x = 0.00206971;
			y = 0.00354552;
			w = 0.99539;
			h = 0.992435;
		};
		class RscPicture_1201 : Rsc_lable 
		{
			idc = -1;
			x = 0.00206971;
			y = -0.000395358;
			w = 0.998345;
			h = 0.0763596;
		};
		class Lable : Rsc_lable 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.309375;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.181875;
			h = safeZoneH * 0.04222223;
			style = 0+2;
			text = "Faces";
			
		};
	};
	class Controls
	{
		class kndr_MapControl : RscPicture
		{
			idc = 5;
			x = safeZoneX + safeZoneW * 0.511875;
			y = safeZoneY + safeZoneH * 0.28;
			w = safeZoneW * 0.1825;
			h = safeZoneH * 0.31444445;
			
		};
		class Month : RscCombo
		{
			idc = 1;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.29111112;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03111112;			
		};
		class Day : RscCombo
		{
			idc = 2;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.34;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03111112;			
		};
		class Year : RscCombo
		{
			idc = 3;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.38888889;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03111112;			
		};
		class Faces : RscListBox
		{
			idc = 4;
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.48555556;
			w = safeZoneW * 0.180625;
			h = safeZoneH * 0.25888889;			
			onLBSelChanged = "[]call id_update;";
		};
		class Spawn : RscButton 
		{
			idc = 1601;
			x = 0.520685;
			y = 0.848699;
			w = 0.4487;
			h = 0.10197;
			text = "Save Infomation";
			action = "[]call id_save";
			
		};
	};
};

class dtk_credit
{
	idd = -1;
	
	class ControlsBackground
	{
		class RscPicture_1200 : RscBackground 
		{
			idc = 33333;
			x = safeZoneX + safeZoneW * 0.294375;
			y = safeZoneY + safeZoneH * 0.22666667;
			w = safeZoneW * 0.410625;
			h = safeZoneH * 0.54555556;
			text = "";
			
		};
		class RscPicture_1201 : Rsc_lable 
		{
			idc = 1201;
			x = 0.00206971;
			y = -0.000395358;
			w = 0.998345;
			h = 0.0763596;
			text = "Welcome To Crimson Role Play!";
			
		};
		
	};
	class Controls
	{
		class Logo : RscPicture
		{
			idc = 10023;
			x = safeZoneX + safeZoneW * 0.511875;
			y = safeZoneY + safeZoneH * 0.28;
			w = safeZoneW * 0.1825;
			h = safeZoneH * 0.31444445;
			text = "data\images\logo.paa";
			
		};
		class lable_website : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.02444445;
			text = "Website";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			colorText[] = {0.8,0.4,0.2,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class lable_ts3 : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.310625;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.02;
			text = "Teamspeak 3";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			colorText[] = {0.8,0.4,0.2,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class lable_rules : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.01888889;
			text = "Server Rules";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			colorText[] = {0.8,0.4,0.2,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class lable_applications : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31375;
			y = safeZoneY + safeZoneH * 0.50222223;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.01777778;
			text = "Deptment Applications";
			colorText[] = {0.8,0.4,0.2,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class lable_Discord : Rsc_lable
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.38888889;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "Discord";
			colorText[] = {0.8,0.4,0.2,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class url_website : RscEdit
		{
			type = 2;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31625;
			y = safeZoneY + safeZoneH * 0.32444445;
			w = safeZoneW * 0.1575;
			h = safeZoneH * 0.02222223;
			text = "www.google.com";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class url_teamspeak : RscEdit
		{
			type = 2;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31625;
			y = safeZoneY + safeZoneH * 0.36888889;
			w = safeZoneW * 0.1575;
			h = safeZoneH * 0.02222223;
			text = "ts.crimsonRP.net";
			autocomplete = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class url_rules : RscEdit
		{
			type = 2;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.318125;
			y = safeZoneY + safeZoneH * 0.52555556;
			w = safeZoneW * 0.1575;
			h = safeZoneH * 0.01888889;
			text = "ts.crimsonRP.net";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class url_appications : RscEdit
		{
			type = 2;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31625;
			y = safeZoneY + safeZoneH * 0.42222223;
			w = safeZoneW * 0.1575;
			h = safeZoneH * 0.02;
			text = "ts.crimsonRP.net";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class url_discord : RscEdit
		{
			type = 2;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.316875;
			y = safeZoneY + safeZoneH * 0.47333334;
			w = safeZoneW * 0.1575;
			h = safeZoneH * 0.02222223;
			text = "ts.crimsonRP.net";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
		class Textures_brandon : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.71333334;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "A. Brandon";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class DeveloperFramework : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.59111112;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "Framework Developer";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Framework_DaThrillerKiller : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.61555556;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "DaThrillerKiller/ Tucker H";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Map_Developer : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "Map Developer";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Map_DayzRunner : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.66444445;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "DayzRunner";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Texture_Developer : RscText
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.311875;
			y = safeZoneY + safeZoneH * 0.68888889;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.03666667;
			text = "Texture Developer";
			colorBackground[] = {0.5569,0.9412,0.1804,0};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Continue : RscButton 
		{
			idc = 1601;
			x = 0.520685;
			y = 0.848699;
			w = 0.4487;
			h = 0.10197;
			text = "Continue ";
			action = "closeDialog 0";
			
		};
		
	};
	
};


