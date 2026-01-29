private ["_return"];

_this = typeOf _this;

_return = {
	if (_this == _x select 0)exitWIth {
	_x select 1
	};

}ForEach v_drug_config;

_return