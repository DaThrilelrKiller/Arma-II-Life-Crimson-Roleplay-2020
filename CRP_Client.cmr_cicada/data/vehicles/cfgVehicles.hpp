
class Soldier_Crew_PMC;
class BAF_Soldier_Marksman_MTP;
class BAF_Soldier_L_MTP;
class BAF_crewman_MTP;
class BAF_Pilot_MTP;
class Worker2;
class AH6X_EP1;
class SUV_TK_CIV_EP1;
class SUV_PMC_BAF;
class BTR40_MG_TK_INS_EP1;
class BTR40_TK_INS_EP1;
class SUV_UN_EP1;
class VolhaLimo_TK_CIV_EP1;
class Volha_2_TK_CIV_EP1;

class CfgVehicles {
	class copUni0 : Soldier_Crew_PMC {
		displayName = "Traffic Cop Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_traffic.paa"};
	};
	class copUni1 : Soldier_Crew_PMC {
		displayName = "PC Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_cr.paa"};
	};
	class copUni2 : BAF_Soldier_Marksman_MTP {
		displayName = "SCO19 Uniform (camo)";
		hiddenSelectionsTextures[] = {"\ca\characters_d_baf\data\camo_MTP_co.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni3 : BAF_Soldier_L_MTP {
		displayName = "SCO19 Uniform Light (camo)";
		hiddenSelectionsTextures[] = {"\ca\characters_d_baf\data\camo_MTP_co.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni4 : BAF_crewman_MTP {
		displayName = "SCO19 Uniform (Urban)";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sco_cloth.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni5 : BAF_Soldier_L_MTP {
		displayName = "SCO19 Uniform Light (Urban)";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sco_cloth.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni6 : BAF_Pilot_MTP {
		displayName = "Pilot Uniform (camo)";
		hiddenSelectionsTextures[] = {"\ca\characters_d_baf\data\camo_MTP_co.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni7 : BAF_Pilot_MTP {
		displayName = "Pilot Uniform (Urban)";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sco_cloth.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni8 : Soldier_Crew_PMC {
		displayName = "Police Sergeant Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sgt.paa"};
	};
	class copUni9 : Soldier_Crew_PMC {
		displayName = "Police Interceptor Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_interceptor.paa"};
	};
	class copUni10 : Soldier_Crew_PMC {
		displayName = "Military Police Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_mp.paa"};
	};
	class copUni11 : BAF_crewman_MTP {
		displayName = "SCO19 CT Uniform";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sco_cloth_grey.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class copUni12 : BAF_Soldier_L_MTP {
		displayName = "SCO19 CT Uniform Light";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\cop_sco_cloth_grey.paa","data\vehicles\textures\cop_sco_vest.paa","data\vehicles\textures\cop_sco_equip.paa"};
	};
	class docUni4 : Worker2 {
		displayName = "SCO19 CT Uniform Light";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\paramedic.paa"};
	};
	class inmate : Worker2 {
		displayName = "Jail Inmate";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\prisonor.paa"};
	};
	class AH6X_EP1_COP : AH6X_EP1 {
		displayName = "Police Little Bird";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\ah6x_police.paa"};
	};
	class SUV_COP : SUV_TK_CIV_EP1 {
		displayName = "Police SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_cop.paa"};
	};
	class SUV_SCO : SUV_TK_CIV_EP1 {
		displayName = "nterceptor SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_sco.paa"};
	};
	class SUV_RED : SUV_PMC_BAF {
		displayName = "Red SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_red.paa"};
	};
	class SUV_BLUE : SUV_PMC_BAF {
		displayName = "Blue SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_blue.paa"};
	};
	class SUV_WHITE : SUV_PMC_BAF {
		displayName = "White SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_white.paa"};
	};
	class SUV_BLUEWHITE : SUV_PMC_BAF {
		displayName = "BlueWhite SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_bluewhite.paa"};
	};
	class BTR40_UN : BTR40_MG_TK_INS_EP1 {
		displayName = "UN BTR40";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\btr40_un.paa"};
	};
	class BTR40_UN_U : BTR40_TK_INS_EP1 {
		displayName = "UN BTR40 Unarmed";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\btr40_un.paa"};
	};
	class SUV_UN_EP1 : SUV_UN_EP1 {
		displayName = "UN SUV";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\suv_un.paa"};
	};
	class VolhaLimo_TK_CIV_EP1 : VolhaLimo_TK_CIV_EP1 {
		displayName = "Vohla Black";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\volha_cop.paa"};
	};
	class Volha_2_TK_CIV_MEM : VolhaLimo_TK_CIV_EP1 {
		displayName = "Vohla Black";
		hiddenSelectionsTextures[] = {"data\vehicles\textures\memvohla.paa"};
	};
};