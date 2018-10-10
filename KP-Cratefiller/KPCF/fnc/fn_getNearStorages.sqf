/*
    Killah Potatoes Cratefiller

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Scans the spawn area for possible storages.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Dialog controls
private _dialog = findDisplay 758067;
private _ctrlCrate = _dialog displayCtrl 75801;
private _ctrlStorage = _dialog displayCtrl 75802;
private _ctrlCat = _dialog displayCtrl 75810;
private _ctrlWeapon = _dialog displayCtrl 75811;
private _ctrlEquipment = _dialog displayCtrl 75812;
private _ctrlInventory = _dialog displayCtrl 75820;
private _ctrlInventoryAmount = _dialog displayCtrl 75821;

KPCF_nearStorage = [];

lbClear _ctrlStorage;

{
    private _type = typeOf _x;
    if (_type == "GroundWeaponHolder") exitWith {};
    private _config = [_type] call KPCF_fnc_getConfigPath;
    private _number = getNumber (configfile >> _config >> _type >> "maximumLoad");
    if (_number > 0) then {
        KPCF_nearStorage pushBack _x;
    };
} forEach (KPCF_cratefillerSpawn nearObjects KPCF_spawnRadius);

// Fill the list
{
    private _type = typeOf _x;
    private _config = [_type] call KPCF_fnc_getConfigPath;
    _ctrlStorage lbAdd format ["%1m - %2", round (KPCF_cratefillerSpawn distance2D _x), getText (configFile >> _config >> _type >> "displayName")];
} forEach KPCF_nearStorage;

// Check if dialog is closed
if (isNull _dialog) exitWith {};

[{call KPCF_fnc_getNearStorages;}, [], 5] call CBA_fnc_waitAndExecute;
