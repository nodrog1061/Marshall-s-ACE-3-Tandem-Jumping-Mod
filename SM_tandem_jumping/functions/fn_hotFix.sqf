/*
 * Author: Scott Marshall
 * using a event handler if the pilot is killed or cuts there para the tandem player is disconected 
 *
 * Arguments:
 * 	vehicle (object)
 * 	player (object)
 * 	target (object)
 * all above not avalable in a call for the script since triggered via event handler
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */
player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (player getVariable "attached")then{

		_player = player getVariable "tandem_player";
		_target = player getVariable "tandem_target";

		if(((typeOf _vehicle) == "Steerable_Parachute_F") || ((typeOf _vehicle) == "NonSteerable_Parachute_F"))then{
			[]spawn{
				sleep 5;
				player setVariable ["attached",false];
			};
		};
	};
}];

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (player getVariable "attached")then{

		_player = player getVariable "tandem_player";
		_target = player getVariable "tandem_target";

		player setVariable ["attached",false];
	};
}];