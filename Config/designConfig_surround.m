function [Trialevents]=designConfig_surround(const)
% ----------------------------------------------------------------------
% [const]=designConfig(const)
% ----------------------------------------------------------------------
% Goal of the function :
% Create trialevents and store in matrix;
% ----------------------------------------------------------------------
% Input(s) :
% const : struct containing constant configurations
% ----------------------------------------------------------------------
% Output(s):
% Trialevents: struct containing trialevents
% ----------------------------------------------------------------------
% Function created by Nick Hedger
% Project :     Eyetracking 2018
% Version :     1.0
% ----------------------------------------------------------------------

% Stimulus type, eye, color.

Table = unique(nchoosek([1,2,1,2,1,2,1,2],4), 'rows');

                  
Trialevents.trialmat=GenerateEventTable(Table,const.reps,const.isfixed);