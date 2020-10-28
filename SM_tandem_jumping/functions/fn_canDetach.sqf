/*
 * Author: Scott Marshall
 *  checks if the tandem player is acctualy attached to the player and returns it requred for ace
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via [_player,_target] call SM_tandem_jumping_fnc_canDetach
 *
 * Return Value:
 * Alowed? (bool)
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];

if(_target in (attachedObjects _player))then{
	true
}else{
	false
}