class factory_manifacture 
{

	idd = 2002;
	movingEnable = true;
	objects[] = { };
	
	class ControlsBackground
	{

		class DLG_BACK1: Rscbackground
		{												
			x = 0.30; 
			y = 0.10;
			w = 0.54; 
			h = 0.80;
		};

		class background : RscBgRahmen		
		{
			x = 0.30; 
			y = 0.10;
			w = 0.54; 
			h = 0.80;

			text = $STRS_inv_fac_dia_herstellen1;
		};
	};
	class controls
	{
		class select_storage : RscCombo 
		{
			idc = 2100;
			x = safeZoneX+safeZoneW*0.288125;
			y = safeZoneY+safeZoneH*0.22777778;
			w = safeZoneW*0.14375;
			h = safeZoneH*0.03444445;
			onLBSelChanged = "call factory_load";
		};
		
		class list_manifacture : RscListBox
		{
			idc = 1;
			x = 0.32; 
			y = 0.14;
			w = 0.50; 
			h = 0.25;
			onLBSelChanged = "call factory_update";
		};

		class list_needed : RscListBox
		{
			idc = 2;
			x = 0.32; 
			y = 0.42;
			w = 0.50; 
			h = 0.25;
		};

		class create : RscButton
		{
			idc = 4;
			x = 0.32; 
			y = 0.69;
			w = 0.50; 
			h = 0.04;

			text = "Create";
			action="[]call factory_make;";
		};

		class export : RscButton
		{
			idc = 5;
			x = 0.32; 
			y = 0.74;
			w = 0.50; 
			h = 0.04;

			text = "Sell";
		};

		class manifacture : RscButton
		{
			idc = 3;
			x = 0.32; 
			y = 0.79;
			w = 0.50; 
			h = 0.04;

			text = "Manifacture";
		};

		class close : RscButton		
		{
			x = 0.32; 
			y = 0.84;
			w = 0.50; 
			h = 0.04;

			text = $STRD_inv_description_close;
			action = "closeDialog 0;";
		};
	};

};