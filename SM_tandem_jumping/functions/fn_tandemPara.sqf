/*
 * Author: Scott Marshall
 * using a event handler when the player changes vehicle the script check 
 * if they are atched and if the vehicle is a para and if they are falling also deploys the corect sctipt for landing and proper deplyment into para
 *
 * Arguments:
 * 	vehicle (object)
 * 	player	(object)
 * 	target	(object)
 * all above not avalable in a call for the script since triggered via event handler
 *
 * Return Value:
 * None
 *
 *
 * Public: Yes
 */

["vehicle", {
    params ["_unit", "_newVehicle", "_oldVehicle"];

	if (player getVariable "attached")then{

		_player = player getVariable "tandem_player";
		_target = player getVariable "tandem_target";

		if(((typeOf _newVehicle) == "Steerable_Parachute_F") || ((typeOf _newVehicle) == "NonSteerable_Parachute_F") || (_oldVehicle isKindOf "Paraglide") || (_oldVehicle isKindOf "Parachute"))then{
			_target enableSimulationGlobal true;
			_target hideObjectGlobal false;
			player setVariable ["freefall",false];
			_target attachTo [_vehicle, [0, 0.3, -0.9]];
			//_target switchAction "Para_Pilot";
			//_target switchmove "HubSittingChairB_idle1";
			[_target, "HubSittingChairB_idle1"] remoteExec ["switchMove", 0];
		};
		if (!((typeOf _newVehicle) == "Steerable_Parachute_F") && !((typeOf _newVehicle) == "NonSteerable_Parachute_F") && !(_oldVehicle isKindOf "Paraglide") && !(_oldVehicle isKindOf "Parachute"))then{
			player setVariable ["tandem_inVehicle",true];
			[_player,_target] call SM_tandem_jumping_fnc_groundDetach;
		};
		if((_oldVehicle isKindOf "Paraglide") || (_oldVehicle isKindOf "Parachute"))then{
			[_player,_target] call SM_tandem_jumping_fnc_groundDetach;
			_target setPosATL [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2) + 1];
			//_target switchAction "GetOutPara";
			[_target, "GetOutPara"] remoteExec ["switchAction", 0];
		};

	};

}, true] call CBA_fnc_addPlayerEventHandler;


