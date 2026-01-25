class fuel_business_dialog
{
	idd = 7100;
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "business_fuel_shopObject = objNull; business_fuel_shopIndex = -1;";

	class ControlsBackground
	{
		class Background: RscBackground
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.30;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.40;
			h = safeZoneH * 0.42;
		};
	};

	class Controls
	{
		class Title: RscText
		{
			idc = 7101;
			text = "Fuel Station";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.26;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.04;
			sizeEx = 0.04;
		};

		class OwnerText: RscText
		{
			idc = 7102;
			text = "Owned by:";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.03;
			sizeEx = 0.03;
		};

		class BalanceText: RscText
		{
			idc = 7103;
			text = "Balance:";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.03;
			sizeEx = 0.03;
		};

		class ForSaleText: RscText
		{
			idc = 7104;
			text = "For sale:";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.39;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.03;
			sizeEx = 0.03;
		};

		class StockText: RscText
		{
			idc = 7106;
			text = "Stock:";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.03;
			sizeEx = 0.03;
		};

		class ForSaleEdit: RscEdit
		{
			idc = 7105;
			text = "0";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.46;
			w = safeZoneW * 0.18;
			h = safeZoneH * 0.04;
		};

		class SetForSaleButton: RscButton
		{
			idc = 7113;
			text = "Set for sale (0=off)";
			x = safeZoneX + safeZoneW * 0.50;
			y = safeZoneY + safeZoneH * 0.46;
			w = safeZoneW * 0.19;
			h = safeZoneH * 0.04;
			action = "[] call business_fuel_setForSale;";
		};

		class DepositButton: RscButton
		{
			idc = 7115;
			text = "Deposit Gasoline Barrels";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.05;
			action = "[] call business_fuel_deposit;";
		};

		class BuyButton: RscButton
		{
			idc = 7110;
			text = "Buy (unowned)";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.57;
			w = safeZoneW * 0.19;
			h = safeZoneH * 0.05;
			action = "[] call business_fuel_buy;";
		};

		class BuyForSaleButton: RscButton
		{
			idc = 7111;
			text = "Buy (if for sale)";
			x = safeZoneX + safeZoneW * 0.50;
			y = safeZoneY + safeZoneH * 0.57;
			w = safeZoneW * 0.19;
			h = safeZoneH * 0.05;
			action = "[] call business_fuel_buyForSale;";
		};

		class WithdrawButton: RscButton
		{
			idc = 7112;
			text = "Withdraw balance";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.63;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.05;
			action = "[] call business_fuel_withdraw;";
		};

		class CloseButton: RscButton
		{
			idc = 7114;
			text = "Close";
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.69;
			w = safeZoneW * 0.38;
			h = safeZoneH * 0.05;
			action = "closeDialog 0;";
		};
	};
};

