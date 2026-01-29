private ["_item","_amount","_max","_name"];

_item   = _this select 1;
_amount = _this select 2;
_max =   [player,_item] call storage_amount;

_name = _item call config_displayname;

if( _amount >  _max) then { _amount =  _max;};

_hunger = switch toLower _item do 
	{	
		case "d5w":  		{5};
		case "straw":  		{3};
		case "donut":     	{10};
		case "cl_donut":    {10};
		case "boar":     	{10};
		case "rabbit":     	{10};
		case "strangemeat": {15};
		case "bread":     	{5};
		case "apple":    	{7};
		case "stoer":    	{75};
		case "coconut":     {10};
		case "banana":     	{7};
		case "getreide":    {2};
		case "hgbar":     	{4};
		case "tcgmp":    	{5};
		case "doshd":    	{5};
		case "gdar":     	{5};
		case "bjerk":     	{5};
		case "frozens":     {4};
		case "wulf":     	{6};
		case "fuzz":     	{4};
		case "inby":     	{4};
		default {0};
	};

[player,_item,-_amount] call storage_add;
[format['Eating %1',_name],format ["data\images\items\%1",[_item]call config_image],true]call tag_notify;

dtk_hunger = dtk_hunger - (_hunger*_amount);
if (dtk_hunger < 0) then {dtk_hunger = 0};

systemChat  format[localize "STRS_inv_item_nahrung_gegessen", ((round (100-dtk_hunger)) call string_intToString)];