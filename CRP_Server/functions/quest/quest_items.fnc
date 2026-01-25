private ["_return"];

_return = [];
{
	_return set [count _return,_x call config_displayname];
}forEach _this;

_return