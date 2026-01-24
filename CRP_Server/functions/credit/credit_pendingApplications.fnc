// Store pending applications that need employee approval
// Format: [UID, [type, amount, interestRate, score, playerName, time]]
if (isNil "credit_pendingLoans") then {
	credit_pendingLoans = [];
};
if (isNil "credit_pendingCards") then {
	credit_pendingCards = [];
};
