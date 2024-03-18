 /*
	author: Aebian
	description: Codelock for doors [main-file]
	returns: KeyPad
	created: 2019-12-31

	desc:
		#include "itsAebian\CodeLock\dialog\nhcl_defines.hpp"
		#include "itsAebian\CodeLock\dialog\nhcl_control.hpp"

	init:
		[CellTab_01, CellHouse_01, 628400] execVM "itsAebian\CodeLock\NH_CodeLock.sqf"; // for default status (door open, no code set) set code to 123456
		

https://aebian.org/story/codelock-script-arma-3

You can unlock the door by entering the correct key code on the keyPad and then press Enter. If the door is open and a code is already saved, a click on Lock will close and lock the door.

You can unlock the door by entering the correct key code on the keyPad and then press Enter. If the door is open and a code is already saved, a click on Lock will close and lock the door.

Download: https://groupfiles.nethavn.group/d/7fb60bb3dd4a444db7f5/files/?p=%2FArma%2FCodeLock.zip

When you have downloaded the file, copy the folder itsAebian to your mission folder and open up the NH_CodeLock.sqf and check the description of it.
You need to have two files in your mission root for my script to work:

description.ext (code for desc goes there)
initServer.sqf (code for init goes there)
On the misison side (in-game) you need a house and a keypad object. In the description in the SQF the keyPad object is named CellTab_01 and the house is named CellHouse_01.
Make sure the keyPad object is not a house and has propper space between house and itself as the addAction otherwise won't fire up.

*/

params ["_keypad", "_building", "_code"];

_keyPad = (_this select 0);
_doorCount = getNumber (configFile >> "cfgVehicles" >> typeOf _building >> "numberOfDoors");
_doorList = [];

for "_i" from 1 to _doorCount do
{
	_data = [];
	_door = format ["Door_%1_trigger", _i];
	_tempPos = _building selectionPosition _door;	
	_doorPos = _building modelToWorld _tempPos;
	_num = _i;
	_data pushBack _door;
	_data pushBack _doorPos;
	_data pushBack _num;
	_doorList pushBack _data;
};

_index = true;
_holderDist = 50000;
{
	_pos = _x select 1;
	_distance = _keyPad distance [_pos select 0, _pos select 1, _pos select 2];
	if (_distance < _holderDist) then
	{
		_index = _forEachIndex;
		_holderDist = _distance;
	};
} forEach _doorList;

_tempSel = _doorList select _index;
_closestDoor = _tempSel select 0;
_doorNumber = _tempSel select 2;

_keyPad setVariable ["building", _building, true];
_keyPad setVariable ["doorNumber", _doorNumber, true];
_keyPad setVariable ["theCode", "", true];
_keyPad setVariable ["hasCode", false, true];
_keyPad setVariable ["isLocked", false, true];


if (typeName  _code == "SCALAR" && _code != 123456  ) then {

_keyPad setVariable ["theCode", _code, true];
_keyPad setVariable ["hasCode", true, true];
_keyPad setVariable ["isLocked", true, true];
[_keyPad, _building] execVM "itsAebian\CodeLock\actions\lockDoors.sqf";

};


[_keyPad, ["Open KeyPad", 
{
	params ["","","","_keyPad"]; [_keyPad] execVM "itsAebian\CodeLock\dialog\openDialog.sqf";

}, 
[_keyPad], 6, false, true, "", "_this distance _target <  2.2"]] remoteExec ["addAction", 0, true];

/*
};

if (side (group player)) == east)) then
{
[_keyPad, ["Open KeyPad", 
{
	params ["","","","_keyPad"]; [_keyPad] execVM "itsAebian\CodeLock\dialog\openDialog.sqf";

}, 
[_keyPad], 6, false, true, "", "_this distance _target <  2.2"]] remoteExec ["addAction", 0, true];
};
*/