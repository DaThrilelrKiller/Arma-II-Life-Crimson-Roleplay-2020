if (V_voted)exitwith {
	systemchat "You already voted you cant acess the voting database until next election";
};

_data = call goverment_votes;
createDialog "wahldialog";

{
	_index = lbAdd [1, name (_x select 0)];
	lbSetData [1, _index, str (_x select 0)];	
	true
}count _data;

