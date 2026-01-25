private ["_name","_items","_list"];

if (count v_questitems < 1)exitWith {
systemchat "you currently have no active quest";
};

_name = v_questitems select 0;
_items = v_questitems select 1;
_list = _items call quest_items;

_name hintC _list;