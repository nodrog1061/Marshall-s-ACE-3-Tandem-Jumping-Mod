/*
 * Author: Scott Marshall
 * using a if statment script works as a juction box for scripts this is for the self intearct as the getVariable call wont work in in a config so replys false unless the mod has been initalised by the game
 * (handles statment and condition for uncliup self interact)
 *
 * Arguments:
 * 	state (bool)
 *
 * Return Value:
 * Alowed? (bool)
 *
 *
 * Public: Yes
 */

_state = param[0];


scopeName "main";
//check if game is acc loaded 
if(!isNull player && time > 0)then{
	// true == can?
	if(_state)then{ 
		if([player getVariable "tandem_player",player getVariable "tandem_target"] call SM_tandem_jumping_fnc_canDetach)then{
			true breakOut "main"
		}else{
			false breakOut "main"
		};
	};
	//false == call the acc ground detach
	if(!(_state))then{
		[player getVariable "tandem_player",player getVariable "tandem_target"] call SM_tandem_jumping_fnc_groundDetach;
	};
	
	false breakOut "main"

}else{
	false breakOut "main"
};
