private ["_item","_playerItems"];

_item = _this;

_playerItems = [
	"fishing_turtle","fish_catfish","fishing_whale","fishing_trout","fishing_bass","fishing_walleye","fishing_mackerel","fishing_herring",
	"fishing_turtle_cooked","fish_catfish_cooked","fishing_trout_cooked","fishing_bass_cooked","fishing_walleye_cooked","fishing_mackerel_cooked","fishing_herring_cooked",
	"iron","Gold","copper","Diamond rock","coal","Diamond","steel",
	"getreide","apple","sand","straw","Unprocessed_LSD","Unprocessed_Cocaine","Unprocessed_Heroin","Unprocessed_Marijuana",
	"Bread","Frozens",
	"MarijuanaSeed","HeroinSeed","CocaineSeed",
	"lsd","cocaine","heroin","marijuana","meth",
	"rawboar","rawboar_tagged","rawcow","rawcow_tagged","rawrabbit","rawrabbit_tagged","rawgoat","rawgoat_tagged","rawsheep","rawsheep_tagged",
	"beef_steak","beef_burger","beef_jerky","goat_curry","goat_stew","rabbit_stew","rabbit_pie","lamb_chops","lamb_roast","boar_sausage","boar_ribs",
	"wood","lumber",
	"Oil","OilBarrel"
];

(_item in _playerItems)
