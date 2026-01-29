private ["_name"];

_name = player call gang_name;
if (_name != "")then {
/* if your in a gang already open managment */
_name call gang_manage;
v_gang_refresh = false;

}else{
/* else your a noob and should proably join one */
call gang_new;
v_gang_refresh = true;
};
