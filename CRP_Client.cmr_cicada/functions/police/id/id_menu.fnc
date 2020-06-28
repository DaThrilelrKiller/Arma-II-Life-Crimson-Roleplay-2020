createDialog "dtk_infomation";

{
	lbAdd [1,_x];
}forEach dtk_months;
{
	lbAdd [2,_x];
}forEach dtk_days;

for "_i" from 1930 to 2013 step 1 do {
	lbAdd [3,str _i];
};

{
	lbAdd [4,_x];
}forEach dtk_faces;

lbSetCurSel [1,round random (count dtk_months)];
lbSetCurSel [2,round random (count dtk_days)];
lbSetCurSel [3,round random (count dtk_years)];
lbSetCurSel [4,round random (count dtk_faces)];	