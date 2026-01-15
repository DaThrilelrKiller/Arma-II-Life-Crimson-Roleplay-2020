
DTK_Controls = [
[100,101,102,103],
[200,201,202],
[300,301,302],
[400,401,402],
[500]
];

test_show = {
	_controls = _this select 0;
	_show = _this select 1;

	{
		ctrlShow [_x, _show];
	}forEach _controls;

};



test_open = {
createDialog "test";
[[101,102,103,201,202,302,302,402,402],false]call test_show;
buttonSetAction [100,'[]call test_speed'];
buttonSetAction [200,'[]call test_storage'];
buttonSetAction [300,'[]call test_plate'];
buttonSetAction [400,'[]call test_glow'];
};

test_speed = {
	[[200,300,400,500],false]call test_show;
	[DTK_Controls select 0,true]call test_show;
};

test_storage = {
	[[100,300,400,500],false]call test_show;
	[DTK_Controls select 1,true]call test_show;
};

test_plate = {
	[[100,200,400,500],false]call test_show;
	[DTK_Controls select 2,true]call test_show;
};

test_glow = {
	[[100,200,300,500],false]call test_show;
	[DTK_Controls select 3,true]call test_show;
};



[]call test_open;
