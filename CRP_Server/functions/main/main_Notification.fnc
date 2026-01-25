/*
File: fn_Notification.sqf
Desc: Used to display a notification to a player in a organized manner
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Condition for the notification to be shown (i.e. dtk_cop)
	1. Main lable of the notifiction
	2. Body of the notification
	3. sound (leave nil if you want no sound to play)
*/


private ["_Condition","_Headline","_text","_Sound"];
_Condition = _this select 0;
_Headline = _this select 1;
_text = _this select 2;
_Sound = _this select 3;

call compile format[
"
if (%1) then 
{
if (!isNil '_Sound')then {
playsound _Sound;
};
hintSilent parseText""
		<t align='center' color='#e5b348' size='1.7'><t shadow='1'shadowColor='#000000'>%2</t></t>
		<img color='#ffffff' image='data\images\DaThrillerKiller\img_line_ca.paa' align='left' size='0.20' /><br />
		<t align='left' color='#eaeaea' size='1.0'>%3</t><br />
		<img color='#ffffff' image='data\images\DaThrillerKiller\img_line_ca.paa' align='left' size='0.20' />
	"";
};
"
,_Condition,_Headline,_text];
