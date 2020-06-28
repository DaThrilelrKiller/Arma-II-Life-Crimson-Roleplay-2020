v_questitems = v_quest call BIS_selectRandom;
v_questtime = time + 1800;

i_quest = [120,quest_handler]call core_addLoop;

call quest_info;