/*
 * Author: Scott Marshall
 *  checks that the player is not attached the vehicle is not on the ground the vehicle is a air vehicle the target is in a cargo slot and all the checks in canAttach are true
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via [_player,_target] call SM_tandem_jumping_fnc_canAttach
 * 	vehicle (object)
 * not accesable i.e embebded
 *
 * Return Value:
 * Alowed? (bool)
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];

if (!(player getVariable "attached"))then{
	if (!(isTouchingGround vehicle _player))then{
		if ((vehicle _player isKindOf "air") && (vehicle _target isKindOf "air"))then{
			if(((assignedVehicleRole _player select 0) == "Cargo") && ((assignedVehicleRole _target select 0) == "Cargo"))then{
				if ([_player,_target] call SM_tandem_jumping_fnc_canAttach)then{
					true
				}else{
					false
				};
			}else{
				false
			};
		}else{
			false
		};
	}else{
		false
	};
}else{
	false
}