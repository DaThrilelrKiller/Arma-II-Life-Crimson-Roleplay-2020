private ["_return"];
_return = switch(dtk_side)do
	{
		case "PD": {[call core_units,"ColorBlue"]};
		case "UN":{[call core_units,"ColorGreen"]};
		case "CIV": { [[str player],"ColorWhite"] };
	};
	
_return