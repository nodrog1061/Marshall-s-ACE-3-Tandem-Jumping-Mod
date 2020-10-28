/*
 * Author: Scott Marshall
 *  checks if the player is not in a vehicle then uses the attach template and returns it requred for ace
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via [_player,_target] call SM_tandem_jumping_fnc_canGroundAttach
 *
 * Return Value:
 * Alowed? (bool)
 *
 *
 * Public: Yes
 */


_player = param[0,objNull];
_target = param[1,objNull];

if ((vehicle _player == _player) && (vehicle _target == _target))then{
	[_player,_target] call SM_tandem_jumping_fnc_canAttach;
}else{
	false
}