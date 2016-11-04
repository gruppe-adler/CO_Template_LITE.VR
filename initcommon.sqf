#include "USERSCRIPTS\missionsettings.sqf"
#include "USERSCRIPTS\loadouts.sqf"

enableSentences false;
enableRadio false;
enableSaving [false, false];

// LOADOUT FACTIONS ============================================================
if (!isNil "_loadoutFactionBlu") then {
    if (_loadoutFactionBlu != "") then {
        ["BLU_F", _loadoutFactionBlu] call GRAD_Loadout_fnc_FactionSetLoadout;
    };
    if (_loadoutFactionOpf != "") then {
        ["OPF_F", _loadoutFactionOpf] call GRAD_Loadout_fnc_FactionSetLoadout;
    };
    if (_loadoutFactionInd != "") then {
        ["IND_F", _loadoutFactionInd] call GRAD_Loadout_fnc_FactionSetLoadout;
    };
} else {
    ["BLU_F", _loadoutFaction] call GRAD_Loadout_fnc_FactionSetLoadout;
};
GRAD_loadoutFactionSet = true;

// CACHING =====================================================================
if (_useCaching) then {
    f_param_debugMode = _cachingDebug;
    f_param_caching = _cachingRange;
    f_var_cachingAggressiveness = _cachingAggressiveness;
    f_param_uncacheForZeus = _uncacheForZeus;
    [30] spawn f_fnc_cInit;
};

// SCRIPTS =====================================================================
[] execVM "helpers\setRadioSettings.sqf";
[] execVM "helpers\setGroupSettings.sqf";
