/*
 * Author: Scott Marshall
 *  checks if the player has a tandem harness, isnt attached, has a para as a backpack and returns it requred for ace 
 *  also used as a template for other checks
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * via [_player,_target] call SM_tandem_jumping_fnc_canAttach
 *
 * Return Value:
 * Alowed? (bool)
 *
 *
 * Public: Yes
 */

_player = param[0,objNull];
_target = param[1,objNull];

if ((backpack _player isKindOf "B_Parachute") || (backpack _player isKindOf "Parachute") || (backpack _player isKindOf "Paraglide"))then{
  if("SM_Harness" in items _player)then{
    // have atleast 1 blindfold
    if(!(player getVariable "attached"))then{
      true
    }else{
      false
    };
  }else{
    //no item
    false
  };
}else{
  false
};