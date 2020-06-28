
for "_i" from 0 to -1 step 1 do 
{
	_item = ["Labs","Items",str _i,""]call s_stats_read;
	if (typeName _item != "ARRAY")exitWith {};
	DTK_Lab_Drugs set [count DTK_Lab_Drugs,_item];
};