ppEffectDestroy medical_effect_1;
medical_effect_1 = ppEffectCreate ["RadialBlur", 472];
medical_effect_1 ppEffectEnable true;
medical_effect_1 ppEffectAdjust [0.3+random 0.3];
medical_effect_1 ppEffectCommit 2;
	
ppEffectDestroy medical_effect_2;
medical_effect_2 = ppEffectCreate ["ColorCorrections", 1587];
medical_effect_2 ppEffectEnable true;
medical_effect_2 ppEffectAdjust [0.25, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
medical_effect_2 ppEffectCommit 2;
	
			
while {lifeState player == "UNCONSCIOUS"} do
{
	medical_effect_1 ppEffectAdjust [0.3+random 0.3];
	medical_effect_1 ppEffectCommit 0;
		
	medical_effect_2 ppEffectAdjust [0.1+random 0.1, 0.4+random 0.2, 0, [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]];
	medical_effect_2 ppEffectCommit (2.2+random 0.4);
	sleep 4.2+random 0.7;
				
	medical_effect_2 ppEffectAdjust [0.25, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
	medical_effect_2 ppEffectCommit (1.7+random 0.2);
	sleep (6+random 8);
};