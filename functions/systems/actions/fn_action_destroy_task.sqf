/*
	File: fn_action_destroy_task.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a task
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_destroy_task;
*/

[
	player,											// Object the action is attached to
	localize "STR_vn_mf_destroy_task",							// Title of the action
	"custom\holdactions\holdAction_destroy_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_destroy_ca.paa",	// Progress icon shown on screen
	"(typeOf cursorObject in 
	[
	'O_MBT_02_arty_F',
	'CUP_O_ZUBR_CSAT_T',
	'O_APC_Wheeled_02_rcws_v2_F',
	'O_Boat_Armed_01_hmg_F',
	'CUP_O_T55_CSAT',
	'O_static_AT_F',
	'O_HMG_01_F',
	'CUP_O_BMP2_CSAT',
	'Land_PaperBox_open_full_F',
	'O_HMG_01_high_F',
	'rhsgref_ins_SPG9M',
	'CamoNet_OPFOR_big_F',
	'CUP_O_T72_CSAT',
	'CargoNet_01_barrels_F',
	'O_CargoNet_01_ammo_F',
	'Land_Pod_Heli_Transport_04_fuel_F',
	'Land_vn_b_prop_fueldrum_01',
	'rhsusf_ammo_crate',
	'rhs_weapons_crate_ak',
	'O_Radar_System_02_F',
	'CUP_O_UAZ_MG_CSAT',
	'Land_WoodenBox_02_F',
	'O_Heli_Light_02_dynamicLoadout_F',
	'O_Heli_Attack_02_dynamicLoadout_F',
	'Land_TentA_F',
	'ShedSmall',
	'B_Slingload_01_Ammo_F',
	'CUP_O_ZSU23_CSAT',
	'vn_b_ammobox_full_09',
	'Misc_cargo_cont_net3',
	'vn_o_nva_navy_static_zpu4',
	'Land_vn_pavn_launchers',
	'Land_vn_o_shelter_06',
	'vn_b_ammobox_01',
	'Land_vn_pavn_weapons_wide',
	'Land_vn_pavn_weapons_cache',
	'Land_vn_pavn_ammo',
	'Land_vn_pavn_weapons_stack1',
	'Land_vn_pavn_weapons_stack2',
	'Land_vn_pavn_weapons_stack3',
	'vn_b_ammobox_full_02',
	'vn_o_ammobox_wpn_04',
	'vn_o_ammobox_full_03',
	'vn_o_ammobox_full_07',
	'vn_o_ammobox_full_06',
	'vn_o_nva_65_static_zpu4',
	'vn_o_nva_navy_static_mortar_type63',
	'vn_o_nva_65_static_mortar_type53',
	'vn_o_nva_static_d44_01',
	'O_Mortar_01_F', 
	'Land_vn_wf_vehicle_service_point_east',
	'vn_sa2',
	'vn_o_static_rsna75',
	'Land_vn_o_trapdoor_01',
	'vn_o_ammobox_02',
	'Land_CratesWooden_F',
	'vn_o_nva_navy_static_mortar_type63',
	'Land_Pod_Heli_Transport_04_ammo_F',
	'B_Slingload_01_Fuel_F',	
	'vn_o_nva_65_static_mortar_type53',
	'vn_o_nva_static_d44_01'
	] 
	&& player distance cursorObject < 10 && side player != east)",	// Condition for the action to be shown
	"player distance cursorObject < 10",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		[cursorObject, player] remoteExec ["vn_mf_fnc_destroy_task", 2];
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
