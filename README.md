# Marshall's ACE3 Tandem Jumping Mod

for a few months, I've been working on a tandem skydiving mod and today I'm proud to announce that ill be releasing this mod to steam workshop in the next few weeks I am working on the final touches to make this mod be able to move from the Alpha build to open it up for a public Beta. below is some media showcasing the mod and after that is a list of current and future features.
 

## Features:

  - [x] ACE Compatibility from launch
  - [x] BackpackOnChest by DerZade Compatibility from launch
  - [x] Compatibility with most base and modded parachutes (primarily tested with base game steerable parachute)
  - [x] Compatibility with both walking to deploy (I.e C-130 or C-17) but also from seated air vehicles (I.e Helicopters)
  - [x] Item required to establish a tandem mode
  - [x] Fully Multiplayer Compatible
  - [ ] Clipping in and out sound effect
  - [ ] Custom animations for the actual fall
  - [ ] Custom animations for in-vehicle (Long Term)


  Below I may or may not have put a small trailer that i quickly made as a showcase i do plan on doing a proper cinematic trailer for the mod in the future

 

### How to use the mod on the release:

  1. go to an arsenal and get a tandem harness and parachute
  ### From land:

  2. find a tandem buddy and use ace interact with them and attach them
  3. then jump off an edge :))))

  ### From a Vehicle:

  2. Jump in a passenger seat in an air vehicle both you and your tandem buddy need to be in a cargo seat
  3. use ace interact on the buddy you want to jump with and select jump with tandem (or something like that)

### Required Mods:

* [ACE](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057)
* [BackpackOnChest](https://steamcommunity.com/sharedfiles/filedetails/?id=820924072)
* [CBA_A3](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)

## Interacting with the mod (For Mod Makers)
  The mod uses the usual system for calling scripts below is a list of the available scripts as of 28/10/2020 this can be found in the `config.cpp` file in all of the pbo's in this case `SM_tandem_jumping`
  
```C#
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
        };
      };
    };
```

along with all the scripts being placed like this, there is also a handy guide in each file referring to how to use the script and what it does an example is shown below
```
/*
 * Author: Scott Marshall
 * if the player starts tandem on ground the harness is removed and they 
 * are forced to walk the weapons are put away and backpacks are put on chest ai is diabled to stop problems then a wait is trigured untill the player is actually falling
 *
 * Arguments:
 * 	player (object)
 * 	target (object)
 * 	via [_player,_target] call SM_tandem_jumping_fnc_groundAttach
 *
 * Return Value:
 * none
 *
 *
 * Public: Yes
 */
```

## Licence

<a rel="license" href="https://www.bohemia.net/community/licenses/arma-and-dayz-public-license-share-alike-adpl-sa" target="_blank" ><img src="https://data.bistudio.com/images/license/ADPL-SA.png" ><br>This work is licensed under the Arma and Dayz Public License Share Alike</a>

## Credit

* This work was tested and inspired by [Task Force Misfit](https://tf-misfit.co.uk)
* Code Sourcing [BapackOnChest Team](https://steamcommunity.com/sharedfiles/filedetails/?id=820924072)
* Code Sourcing [CBA_A3 Team](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
* Code Sourcing [ACE Team](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057)
