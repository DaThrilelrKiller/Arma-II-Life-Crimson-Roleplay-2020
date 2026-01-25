if (!isNil "medical_effect_1")then {
	ppEffectDestroy medical_effect_1;
};
if (!isNil "medical_effect_2")then {
	ppEffectDestroy medical_effect_2;
};

player setVariable ["tf_unable_to_use_radio", false, true];
player setVariable ["tf_voiceVolume", 1, true];