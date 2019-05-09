/*
    KP_fnc_cratefiller_preInit

    File: fn_cratefiller_preInit.sqf
    Author: Dubjunk - https://github.com/KillahPotatoes
    Date: 2019-05-09
    Last Update: 2019-05-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KPDS] [%1] [PRE] [EXAMPLE] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/



/*
    ----- Module Initialization -----
*/

// Process CBA Settings
//[] call KP_fnc_cratefiller_settings;

// Server section (dedicated and player hosted)
if (isServer) then {

    KP_cratefiller_data = true call CBA_fnc_createNamespace;
    publicVariable "KP_cratefiller_data";

    KP_cratefiller_cache = true call CBA_fnc_createNamespace;
    publicVariable "KP_cratefiller_cache";

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {diag_log format ["[KPDS] [%1] [PRE] [EXAMPLE] Module initialized", diag_tickTime];};

true