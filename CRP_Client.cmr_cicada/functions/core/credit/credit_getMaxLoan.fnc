// Calculate maximum loan amount based on credit score
private ["_score","_maxLoan"];

_score = _this select 0;

// Scale loan amount based on credit score
// Best credit (850) = $1,000,000
_maxLoan = switch (true) do {
	case (_score >= 850): {1000000}; // Perfect credit - $1M
	case (_score >= 800): {750000};  // Excellent - $750K
	case (_score >= 750): {500000};  // Very Good - $500K
	case (_score >= 700): {250000};  // Good - $250K
	case (_score >= 650): {100000};  // Fair - $100K
	case (_score >= 600): {50000};   // Poor - $50K
	case (_score >= 550): {25000};   // Bad - $25K
	case (_score >= 500): {10000};   // Very Bad - $10K
	default {0}; // No loan available
};

_maxLoan
