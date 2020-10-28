/*
 * Author: Scott Marshall
 *  deploys freefall animation in loop on call until freefall == false
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via [_player,_target] call SM_tandem_jumping_fnc_freeFall;
 * 	freefall (bool)
 * via player setVariable ["freefall",true];
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];

detach _target;
_target attachTo [_player, [0, -0.2, -0.3]];
	//systemChat "test 2 active";
 	 //bob playMove "HaloFreeFall_non";

/* if((isPlayer _target))then{
	_target hideObjectGlobal true;
	[player getVariable "tandem_player",player getVariable "tandem_target"] call SM_tandem_jumping_fnc_aiSp;
}else{ */

	while {player getVariable "freefall"} do {
		//systemChat "ani true";
		//_target switchMove "HaloFreeFall_non";
		[_target, "HaloFreeFall_non"] remoteExec ["switchMove", 0];
		//if (!alive _unit) exitWith {_unit enableAI "ANIM";_unit switchMove "";};
		waitUntil {!(animationState _target == "HaloFreeFall_non")};
	};
//};