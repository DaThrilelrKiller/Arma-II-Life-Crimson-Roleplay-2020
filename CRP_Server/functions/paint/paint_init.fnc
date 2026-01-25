if (dtk_client)then {
["Open Paint Shop","kd",["E",false,false,false],paint_open]call keypress_add;

["paint_1",getPos DTK_Paint_1,nil,nil,"colorOrange","mil_dot",nil,"Paint Shop"]call core_createMarkerLocal;
["paint_2",getPos DTK_Paint_2,nil,nil,"colorOrange","mil_dot",nil,"Paint Shop"]call core_createMarkerLocal;
};