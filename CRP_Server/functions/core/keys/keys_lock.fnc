private ["_vcl","_name"];
_vcl = call compile lbData [1, (lbCurSel 1)];
[_vcl] call keys_toggle;