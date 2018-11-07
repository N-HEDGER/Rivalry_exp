
% Prompt user for subject directory
folder = uigetdir();


% Gaze directory
gaze_dir=strcat(folder,'/gaze');

% Const directory
const_dir=strcat(folder,'/const');

% Get all the gaze.mat files
filelist = dir([gaze_dir filesep '**_gaze.mat']);
files = {filelist.name}';

% Get all the const.mat files
filelistconst = dir([const_dir filesep '**.mat']);
filesconst = {filelistconst.name}';

% From the config file, get the events for each trial.
trialinfo=load(strcat(const_dir,'/',filesconst{1}));
events=trialinfo.config.Trialevents.trialmat;
