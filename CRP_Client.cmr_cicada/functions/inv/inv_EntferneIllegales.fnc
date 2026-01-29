private["_Fhasnvgoogles", "_Fhasbinoculars"];
   _Fhasnvgoogles  = 0;
   if (player hasWeapon "NVGoggles") then {_Fhasnvgoogles = 1; };
   _Fhasbinoculars = 0;
   if (player hasWeapon "Binocular") then {_Fhasbinoculars = 1;};
   REMOVEALLWEAPONS player;
   player REMOVEMAGAZINES "Handgrenade";
   player REMOVEMAGAZINES "Pipebomb";
   player REMOVEMAGAZINES "Mine";
   If (_Fhasnvgoogles == 1)  then {player addWeapon "NVGoggles";};
   If (_Fhasbinoculars == 1) then {player addWeapon "Binocular";};
   {
      if ( ([player,(_x select 0)] call storage_amount) > 0) then 
      {
         if ((_x select 0) call config_illegal) then {
		 [player,(_x select 0),0]call storage_setAmount;
		 };
      };
   }count INV_InventarArray;