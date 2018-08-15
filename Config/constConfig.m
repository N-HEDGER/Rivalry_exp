function [const]=constConfig(scr,const)
% ----------------------------------------------------------------------
% [scr]=scrConfig(const)
% ----------------------------------------------------------------------
% Goal of the function :
% Define configuration relative to the screen
% ----------------------------------------------------------------------
% Input(s) :
% scr : struct containing screen configurations
% const : struct containing constant configurations
% ----------------------------------------------------------------------
% Output(s):
% const: struct containing constant configurations
% ----------------------------------------------------------------------
% Function created by Nick Hedger
% Project :     Eyetracking 2018
% Version :     1.0
% ----------------------------------------------------------------------


%% Design parameters

const.stimtypes=2;
% Social and Nonsocial.

const.scrams=2;
% Scrambled and unscrambled.

const.reps=10;
% Repetitions

const.numtrials=(const.stimtypes*const.scrams*length(const.durations)*const.reps);

%% Stimulus parameters

const.background_color=[128 128 128]; % Color of the background.
const.element_con=1; % Contrast of image.
const.element_lum=1; % Luminance of image.
const.element_sizeVal=5.59; % Size of image (DVA)
const.element_size=round(vaDeg2pix(const.element_sizeVal,scr)); % Size of image in pixels.
const.ctr=scr.mid; % Middle of the screen.
const.sep_sizeVal=4.6; % Separation of images.
const.sep=round(vaDeg2pix(const.sep_sizeVal,scr)/2)+round(const.element_size/2);


const.asp=0.74; % Aspect ratio of images.
const.framewidth=100; % Width of the frame.

const.stimbot=scr.scr_sizeY; % Bottom of screen.
const.stimright=scr.scr_sizeX; % Right of screen.

const.progbar_xsize=const.stimright; % Progress bar width.
const.progbar_ysize=10; % Progress bar height.
const.progBar =[0 0  const.progbar_xsize  const.progbar_ysize];

% Fixation.
const.bigfixsizeval=0.5; % Size of outer circle of fixation (DVA).
const.bigfixsize=round(vaDeg2pix(const.bigfixsizeval,scr)); % Size of outer circle of fixation in pixels.
const.smallfixsizeval=0.25; % Size of inner circle of fixation (DVA).
const.smallfixsize=round(vaDeg2pix(const.smallfixsizeval,scr)); % Size of inner circle of fixation in pixels
const.bigfixcol=[0 0 0]; % Color of big fixation circle
const.smallfixcol=[70 70 70]; % Color of small fixation circle
const.smallerfixsizeval=0.1; % Size of inner circle of fixation (DVA).
const.smallerfixsize=round(vaDeg2pix(const.smallerfixsizeval,scr)); % Size of inner circle of fixation in pixels
const.smallerfixcol=[255 255 255];
const.blue=[0 0 200];

const.triallength=30;

end