
_object = nearestobjects [getpos player, ["MAP_notebook","MAP_misc_videoprojector"], 5] select 0;
if (isNil "_object")exitwith {systemchat "no laptop or camera found to hack"};
_type = _object getVariable "camera";
if (isNil "_type")exitwith {systemchat "no laptop or camera found to hack"};


switch(typeName _filename)do
{
	case "STRING":
	{
				
	};
	case "ARRAY":
	{
		
	};
};

