/*
 * Author: Scott Marshall
 *  used for if a player is in a vehicle and tandem is wanted the players are ejected then wait untill player really exits the vehicle then triggers groundAttach
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via call (you can tell im starting to get boored with writing these notes now)
 * 	vehicle (object)
 * not accesable i.e embebded
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];

player setVariable ["tandem_player",_player];
player setVariable ["tandem_target",_target];


// _player action ["Eject", vehicle _player];
// _target action ["Eject", vehicle _target];

moveOut _target;
moveOut _player;

[]spawn{waitUntil{if(vehicle player getVariable "tandem_target" == player getVariable "tandem_target")exitWith{true};false};
[player getVariable "tandem_player",player getVariable "tandem_target"] call SM_tandem_jumping_fnc_groundAttach;
};