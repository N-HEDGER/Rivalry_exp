function [Trialevents]=designConfig(const)
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

trialmat = unique(nchoosek([1,2,3,4,1,2,1,2],3), 'rows');

Table=trialmat(trialmat(:,2)<3,:);

Table=Table(Table(:,3)<3,:);


% Four stimuli, presented to both the left and right eye, presented in both
% red and green.


Grattable=shoveatstart(Table,1);
Factable=shoveatstart(Table,2);
Incongtable=shoveatstart(Table,3);

% Now these are shoved at the start so that the three stimulus types are
% folded in.
Table=vertcat(Grattable,Factable,Incongtable);

Trialevents.incongpairs=[2,4,1,3];


% Now the definition of the trialtype is also shoved at the start.
Tableriv=shoveonend(Table,1);
Tablereplay=shoveonend(Table,2);

Table=vertcat(Tableriv,Tablereplay);
                  
Trialevents.trialmat=GenerateEventTable(Table,const.reps,const.isfixed);


% Trial number, stimulus type, stimulus number,eye of presentation, color, trialtype. 


% Reduce to remove the texture trials
Trialevents.stripmat=Trialevents.trialmat(Trialevents.trialmat(:,2)<3,:);


% No such thing as a replay condition in the strip task, so get rid of both
% the trial number and trialtype as variables.

Trialevents.stripmat=Trialevents.stripmat(:,2:end);
Trialevents.stripmat=Trialevents.stripmat(:,1:(end-1));


% Add the variable that modulates slider speed.
newtab = [];
for i =1:length(const.nstops)
    temp=shoveonend(Trialevents.stripmat,i);
    newtab=[temp;newtab];
    
end

% wtf is this.
newtab2 = [];
for i =1:2
    temp=shoveatstart(newtab,i);
    newtab2=[temp;newtab2];
    
end
    



Trialevents.stripmat=GenerateEventTable(newtab2,const.reps,const.isfixed);


% We dont care about red or green. 
Trialevents.stripmat=Trialevents.stripmat(Trialevents.stripmat(:,6)==1,:);


%Trialnum, stimtype, cong, stim num, orient, (eye?) RG, speed.








