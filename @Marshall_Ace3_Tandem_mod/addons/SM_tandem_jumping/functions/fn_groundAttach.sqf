/*
 * Author: Scott Marshall
 * if the player starts tandem on ground the harness is removed and they 
 * are forced to walk the weapons are put away and backpacks are put on chest ai is diabled to stop problems then a wait is trigured untill the player is actually falling
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 *  state (bool) [false == ground activation true == from vehicle activation] just skips assigment of varibles FROM V4.50
 * 	via [_player,_target] call SM_tandem_jumping_fnc_groundAttach
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];
_state = param[2,false];

_player removeItem "SM_Harness";

_target attachTo [_player, [0, 0.5, 0]];
_player forceWalk true;

[_player] call ace_weaponselect_fnc_putWeaponAway;
[_target] call ace_weaponselect_fnc_putWeaponAway;

[_target] call zade_boc_fnc_actionOnChest;


/* while{alive _target}do{
 	if ((velocity _player select 2) < -3) then{
 		_freeFallId = _target execVM "\SM_tandem_jumping\functions\fn_freeFall.sqf";
 		//_player setVariable ["freeFallId",_freeFallId];
 		[_player,_target,_freeFallId] call SM_tandem_jumping_fnc_tandemPara;
 		exit;
 	};
	_test = {Sleep 1;};
	[]spawn _test;
 	
}; */

if(!(isPlayer _target))then{
	_target switchmove "AmovPercMstpSnonWnonDnon";
	_target disableAI "TARGET";
	_target disableAI "AUTOTARGET";
	_target disableAI "MOVE";
	_target disableAI "ANIM";
	_target disableAI "WEAPONAIM";
	_target action ["SwitchWeapon", _target, _target, -1];
};


player setVariable ["attached",true];
player setVariable ["tandem_inVehicle",false];

if(!(_state))then{
player setVariable ["tandem_player",_player];
player setVariable ["tandem_target",_target];
};


[]spawn{waitUntil { sleep 2; if((!isTouchingGround player) || ((velocity player select 2) <= -3) && !(player getVariable "tandem_inVehicle"))exitWith{true};false};
player setVariable ["freefall",true];
//systemChat "test 1 true";
_target = player getVariable "tandem_target";
detach player getVariable "tandem_target";
player getVariable "tandem_target" enableSimulationGlobal false;
[player getVariable "tandem_player",player getVariable "tandem_target"] call SM_tandem_jumping_fnc_freeFall;
//[player getVariable "tandem_player",_target] remoteExec ["SM_tandem_jumping_fnc_remoteFreeFall", _target];
//[[player getVariable "tandem_player",_target],"SM_tandem_jumping_fnc_remoteFreeFall",_target,false,true] call BIS_fnc_MP;
};