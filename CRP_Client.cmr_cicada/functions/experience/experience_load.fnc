
DTK_civTime = _this select 0;
DTK_unTime = _this select 1;
DTK_pdTime = _this select 2;
_todayTime = _this select 3;
DTK_JoinTime = time;

systemchat format ["Monthly Time Log Report: CIV: %1 FIRE: %2 PD: %3 ",(DTK_civTime/60/60),(DTK_unTime/60/60),(DTK_pdTime/60/60)];
systemchat format ["Todays Time Report: CIV: %1 FIRE: %2 PD: %3 ",((_todayTime select 0)/60/60),((_todayTime select 1)/60/60),((_todayTime select 2)/60/60)];