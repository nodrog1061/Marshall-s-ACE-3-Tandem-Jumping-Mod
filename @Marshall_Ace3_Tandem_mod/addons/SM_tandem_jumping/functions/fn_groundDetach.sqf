/*
 * Author: Scott Marshall
 * if the player removes the tandem unit on the ground this script gives the harness back and puts the backpack back on and returns ai back to normal behaviour
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * 	via [_player,_target] call SM_tandem_jumping_fnc_groundDetach
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */
_player = param[0,objNull];
_target = param[1,objNull];

if ((_target == objNull) || !(_target isEqualTo (player getVariable "tandem_target")) || (isNull _target)) then{
	_target = player getVariable "tandem_target";
};


detach _target;
_player forceWalk false;
_player forceWalk false;
[_target] call zade_boc_fnc_actionOnBack;


player setVariable ["attached",false];
player setVariable ["tandem_player",nil];
player setVariable ["tandem_target",nil];

if ( _player canAdd "SM_Harness")then{
	_player addItem "SM_Harness";
}else{
	"SM_Harness" createVehicle position player;
};
if(!(isPlayer _target))then{
	_target enableAI "TARGET";
	_target enableAI "AUTOTARGET";
	_target enableAI "MOVE";
	_target enableAI "ANIM";
	_target enableAI "WEAPONAIM";
};

