if(AM_temp_carrying)exitWith{[] call Checkpoint_Drop;};
	
AM_classnames_total = call {
	if (dtk_ems)exitWith {CPB_BASE_classnames + CPB_EMS_classnames};
	CPB_BASE_classnames
};


createDialog "AM_CheckpointBuilder";
	
private ["_cost","_name"];
{
	_cost   = _x select 1;
	_name = _x select 3;
	lbAdd[1500,format["Buy %1($%2)",_name,_cost]];
	
}forEach AM_classnames_total;

true