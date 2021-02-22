class CfgPatches {
	class SM_tandem_jumping {
	units[] = {};
	weapons[] = {"SM_Harness"};
    requiredVersion = 1.30;
    requiredAddons[] = {"ace_interaction","zade_boc"};
	};
};


class CfgFunctions
{
	class SM_tandem_jumping
	{
		class COMPONENT
		{
			file="\SM_tandem_jumping\functions";
			class addonInit{postInit = 1;};
			class canDetach{};
			class groundDetach{};
			class groundAttach{};
			class tandemPara{postInit = 1;};
			class canAttach{};
			class hotFix{postInit = 1;};
			class airEject{};
			class canGroundAttach{};
			class canAirEject{};
			class freeFall{};
			//class remoteFreeFall{};
			class aiSp{};
			class canOrDoSelfDetach{};
		};
	};
};

class CfgVehicles{
	class Man;
	class CAManBase: Man	{
		class ACE_Actions{
			class ACE_MainActions{
				class SM_clipIntoHarness{
					displayName="Clip into Harness";
					condition="[_player,_target] call SM_tandem_jumping_fnc_canGroundAttach";
					statement="[_player,_target] call SM_tandem_jumping_fnc_groundAttach";
					showDisabled=0;
					priority=1;
					distance=2;
					exceptions[] = {"isNotSwimming","isNotInside","isNotSitting","isNotOnLadder","isNotRefueling"};
				};
				class SM_unClipHarness{
					displayName="Remove Clip";
					condition="[_player,_target] call SM_tandem_jumping_fnc_canDetach";
					statement="[_player,_target] call SM_tandem_jumping_fnc_groundDetach";
					exceptions[] = {"isNotSwimming","isNotInside","isNotSitting","isNotOnLadder","isNotRefueling"};
					showDisabled=0;
					priority=1;
					distance=2;
				};
				class SM_ejectWithHarness{
					displayName="Eject with Harnes";
					condition="[_player,_target] call SM_tandem_jumping_fnc_canAirEject";
					statement="[_player,_target] call SM_tandem_jumping_fnc_airEject";
					exceptions[] = {"isNotSwimming","isNotSitting","isNotOnLadder","isNotRefueling"};
					showDisabled=0;
					priority=1;
					distance=2;
				};
			};
		};
		class ACE_SelfActions {
			class SM_unClipHarnessSelf{
				displayName="Unclip Partner";
				condition="[true] call SM_tandem_jumping_fnc_canOrDoSelfDetach";
				statement="[false] call SM_tandem_jumping_fnc_canOrDoSelfDetach";
				exceptions[] = {"isNotSwimming","isNotInside","isNotSitting","isNotOnLadder","isNotRefueling"};
				showDisabled=0;
			};
		};
	};
};
class CfgWeapons
{
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;
	class SM_Harness: ACE_ItemCore
	{
		author = "Bohemia Interactive & Scott Marshall & ACE Team";
		displayName = "Tandem Jumping Harness";
		descriptionShort = "Used for attaching people when skydiving for civilians or paradropping for the military.";
		model = "\a3\Props_F_Enoch\Military\Camps\TentSolar_01_folded_F.p3d";
		picture = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_TentSolar_01_folded_sand_F.jpg";
		hiddenSelections[] = {"Camo_1"};
		hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\TentSolar_01_sand_F_CO.paa"};
		scope = 2;
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
};