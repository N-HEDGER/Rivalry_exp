Screen('Preference', 'SkipSyncTests', 1);

%% Add paths

addpath('Config','Data','Stimuli','Conditions','Conversion','Hardware','Misc','Trial');

if const.oldsub==0 % Is this an old subject?
    
% Screen configurations
% ---------------------
[scr] = scrConfig(const);

% Keyboard configurations
% -----------------------
[my_key] = keyConfig;

% Text configurations
% -----------------------
[text] = textConfig;

% Experimental constant
% ---------------------
[const] = constConfig(scr,const);

% Experimental design
% -------------------
[Trialevents] = designConfig(const);

% Audio
% -------------------
[sounds] = soundConfig;


else
    scr=const.config.scr;
    my_key=const.config.my_key;
    text=const.config.text;
    Trialevents=const.config.Trialevents;
    const=rmfield(const,'config')
end


const.log_text_fid=fopen(const.txtfilename,'a+');

% Open screen window

% ------------------
Screen('Preference', 'SkipSyncTests', 1); 
[scr.main,scr.rect] = Screen('OpenWindow',scr.scr_num,const.background_color,[], scr.clr_depth,2);
priorityLevel = MaxPriority(scr.main);Priority(priorityLevel);
DrawFormattedText(scr.main, text.instruct, 'justifytomax', 100, WhiteIndex(scr.main),[],[]);

% Update the display to show the instruction text:
Screen('Flip', scr.main);
KbWait
DrawFormattedText(scr.main, 'STARTING', 'justifytomax', 100, WhiteIndex(scr.main),[],[]);
Screen('Flip', scr.main);


for i=1:length(Trialevents.triamat)
   RunTrial 
end


