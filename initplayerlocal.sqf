if (!isServer) then {
    [] execVM "initcommon.sqf";
};

if (didJIP) then {
    [[player], "helpers\addjiptozeus.sqf"] remoteExec ["execVM",2,false];
};

[] execVM "helpers\intro.sqf";
[] execVM "helpers\createDiaryRecords.sqf";

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
player addEventHandler ["HandleRating",{0}];
