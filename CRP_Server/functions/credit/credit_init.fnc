// Initialize credit system on server
diag_log text "[CREDIT] Credit system initialized";

// Start credit loop (processes interest every 5 minutes)
[]spawn {
	for "_i" from 0 to 1 step 0 do {
		sleep 300; // 5 minutes
		[] call S_credit_loop;
	};
};
