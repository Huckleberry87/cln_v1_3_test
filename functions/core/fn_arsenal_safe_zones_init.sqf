/*
    File: fn_arsenal_safe_zones_init.sqf
    Author: Cerebral
    Public: No

    Description:
        

    Parameter(s): none

    Returns: nothing

    Example(s): none
*/

private _whitelistedModule = objNull;

{
	_whitelistedModule = _x;
} forEach allMissionObjects "vn_module_whitelistedarsenal";

private _arsenals = synchronizedObjects _whitelistedModule;
if (isNil "_previousMessageTime") then {
	_previousMessageTime = 0;
};

vn_mf_arsenal_circles = [];
{
	if (vehicleVarName _x == 'mp_arsenal') then {
		continue
	};
	if (vehicleVarName _x == 'udt_docks_arsenal') then {
		continue
	};
	private _markerName = format["vn_mf_arsenal_%1", _forEachIndex];
	private _marker = createMarker [_markerName, getPos _x];
	_markerName setMarkerAlpha 0;
	_markerName setMarkerSize [5, 5];
	_markerName setMarkerShape "ELLIPSE";

	vn_mf_arsenal_circles pushBack _markerName;
} forEach _arsenals;

publicVariable "vn_mf_arsenal_circles";