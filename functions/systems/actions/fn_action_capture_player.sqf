/*
	File: fn_action_capture_player.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Capture a incapacitated opponent
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_capture_player;
*/

[
	player,											// Object the action is attached to
	format ["<t color='#0000FF'>%1</t>", localize 'STR_vn_mf_capture_player'],							// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",	// Progress icon shown on screen
	"player getVariable ['vn_mf_side', WEST] != cursorTarget getVariable ['vn_mf_side', WEST] && player distance cursorTarget <= 3 && { vehicle player isEqualTo player && {cursorTarget isKindOf 'Man' && {alive cursorTarget && { [cursorTarget] call vn_fnc_revive_moving && {[player] call vn_fnc_revive_moving && { [cursorTarget] call vn_fnc_revive_incap && { !([player] call vn_fnc_revive_incap) }}}}}}}",	// Condition for the action to be shown
	"player distance cursorTarget < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		[cursorTarget, player] remoteExec ["vn_mf_fnc_capture_player", 2];
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	1,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
