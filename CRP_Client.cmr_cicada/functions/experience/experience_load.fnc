
DTK_civTime = _this select 0;
DTK_unTime = _this select 1;
DTK_pdTime = _this select 2;
_todayTime = _this select 3;
_last7Days = _this select 4;
DTK_JoinTime = time;

systemchat format ["30 Day Time Log Report: CIV: %1 FIRE: %2 PD: %3 ",(DTK_civTime/60/60),(DTK_unTime/60/60),(DTK_pdTime/60/60)];
systemchat format ["7 Day Time Report: CIV: %1 FIRE: %2 PD: %3 ",((_last7Days select 0)/60/60),((_last7Days select 1)/60/60),((_last7Days select 2)/60/60)];
systemchat format ["Todays Time Report: CIV: %1 FIRE: %2 PD: %3 ",((_todayTime select 0)/60/60),((_todayTime select 1)/60/60),((_todayTime select 2)/60/60)];