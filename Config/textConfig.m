function [text]=textConfig
% ----------------------------------------------------------------------
% [text]=textconfig
% ----------------------------------------------------------------------
% Goal of the function :
% Define a structure for text items.
% ----------------------------------------------------------------------
% Input(s) :
% none
% ----------------------------------------------------------------------
% Output(s):
% text : structure containing textformats
% ----------------------------------------------------------------------
% Function created by Nick Hedger
% Project :     Eyetracking 2018
% Version :     1.0
% ----------------------------------------------------------------------
text.formatSpecStart=('Subject started at: %s');
text.formatSpecQuit=('Subject quitted at: %s');
text.formatSpecSave=('Data saved at: %s');
instruct='Take a good look at the images';
text.instruct=sprintf(instruct);
text.stimlabels={'social','nonsocial'};
text.scramlabel={'intact','scrambled'};
text.durlabel={};
text.targmorphstrengthlabel={'low','high'};
text.formatSpecTrial=('Trial: %s Trialtype: %s Stimtype: %s \n');



text.conglabels={'congruent','texture','incongruent'};
text.colabels={'face green','house green'};

text.stimlabels={'face','house'};
text.orientlabels={'horizontal split','vertical split'};
text.triallabels={'rivalry','replay'};

text.formatSpecTrial=('Trial %s ,Trial type %s ,Stimtype: %s ,Greenstim: %s,  Orientation %s');


text.formatSpecTrialstrip=('Trial %s Stimtype: %s Congtype %s Orientation %s Direction %s Speed %s');


end
