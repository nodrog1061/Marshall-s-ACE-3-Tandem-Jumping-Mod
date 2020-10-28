/*
 * Author: Scott Marshall
 *  same as attached was used for testing curently not used but i cba to remove it creates a rangemaster applys the tandems players gear forces them into a cam and makes there old body hidden
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via call
 *
 * Return Value:
 * none
 *
 *
 * Public: No
 */

_player = param[0,objNull];
_target = param[1,objNull];

_aisp = group _target createUnit ["B_RangeMaster_F", position player, [], 0, "FORM"];
//_aisp = "B_RangeMaster_F" createUnit [position player, group player];
_aisp setUnitLoadout getUnitLoadout player;

_target attachTo [_player, [0, -0.2, -0.3]];

_aisp switchmove "AmovPercMstpSnonWnonDnon";
_aisp disableAI "TARGET";
_aisp disableAI "AUTOTARGET";
_aisp disableAI "MOVE";
_aisp disableAI "ANIM";
_aisp disableAI "WEAPONAIM";
_aisp action ["SwitchWeapon", _aisp, _aisp, -1];

_cam = "camera" camCreate (ASLToAGL eyePos _aisp);
_cam cameraEffect ["internal", "BACK"];

player setVariable ["cam",_cam];
player setVariable ["aisp",_aisp];

while {player getVariable "freefall"} do {
	systemChat "ani true";
 	_aisp playMoveNow "HaloFreeFall_non";
 	//if (!alive _unit) exitWith {_unit enableAI "ANIM";_unit switchMove "";};
 	waitUntil {!(animationState _aisp == "HaloFreeFall_non")};
};

[]spawn{waitUntil {if(!player getVariable "freefall")exitWith{true};false};

_cam = player getVariable "cam";
_aisp = player getVariable "aisp";

_cam cameraEffect ["internal", "back", "rendersurface"];
camDestroy _cam;
deleteVehicle _aisp;

player setVariable ["cam",nil];
player setVariable ["aisp",nil];