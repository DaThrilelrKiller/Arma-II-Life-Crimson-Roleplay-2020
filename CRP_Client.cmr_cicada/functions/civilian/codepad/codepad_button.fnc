ctrlSetText [999,format ["%1%2",ctrlText 999,_this]];
playSound format["button%1",_this];

if (ctrlText 999 == dtk_VaultCode)then {
	playSound "codefound";
	ctrlShow [dtk_ledGreen, true ];
	ctrlSetText [ 999, "Unlocked!" ];
	[]spawn {
		sleep 1;
		closeDialog 0;
		dtk_VaultObject spawn dtk_VaultAction;
	};
}else{
	if (count toArray (ctrlText 999) >= count toArray dtk_VaultCode)then {
		playsound "wrongcode";
		ctrlShow [ dtk_ledRed, true ];
		ctrlShow [ dtk_ledGreen, false ];
		ctrlSetText [999,"Incorrect!"];
		[]spawn {
			sleep 1;
			closeDialog 0;
		};
	};
};