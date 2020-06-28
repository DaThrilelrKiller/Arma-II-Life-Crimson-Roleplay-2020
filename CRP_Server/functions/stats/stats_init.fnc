handle_saveLoop = []spawn S_stats_loop;

s_seasion = ["server", "settings", "seasion",0]call S_stats_read;
s_seasion = s_seasion + 1;
publicVariable "s_seasion";
["server",[["settings","seasion",s_seasion]]]call S_stats_update;