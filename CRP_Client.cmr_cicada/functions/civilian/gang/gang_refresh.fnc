/* refresh member list when new gang is select in the list box */

if !(v_gang_refresh)exitWith {};

lbClear 4;
[4,lbText[2,(lbCurSel 2)]]call gang_members;
ctrlEnable [7, true];

