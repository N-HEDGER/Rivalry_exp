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

%% Stimulus parameters

const.barbit=0.2;
const.isfixed=0;
const.background_color=[128 128 128]; % Color of the background.
const.element_con=1; % Contrast of image.
const.element_lum=1; % Luminance of image.
const.element_sizeVal=4; % Size of image (DVA)
const.element_size=round(vaDeg2pix(const.element_sizeVal,scr)); % Size of image in pixels.
const.ctr=scr.mid; % Middle of the screen.
%const.sep_sizeVal=15; % Separation of images.
const.sep_sizeVal=5;
const.sep=round(vaDeg2pix(const.sep_sizeVal,scr)/2)+round(const.element_size/2);

const.asp=1; % Aspect ratio of images.


const.framewidth=110; % Width of the frame.

const.barsep=30;
const.barsepval=(const.element_size*const.asp)+const.framewidth+const.barsep;

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
const.lineextend=50;
const.diff=0.5;


const.triallength=10;
const.reps=1;

scr.rect=[0, 0, scr.scr_sizeX, scr.scr_sizeY];

const.ITI=0.5;

const.asp=1;
const.stimctr=scr.mid;
const.stimbot=scr.scr_sizeY;
const.stimright=scr.scr_sizeX;
const.selectRect=[0 0 10 40];
const.slidebar_xsize=200;
const.slidebar_ysize=10;

const.slidebar_xPosition=const.stimctr(1)-const.slidebar_xsize;
const.slidebar_yPosition=const.stimbot*0.85;
const.baseBar =[0 0  const.slidebar_xsize  const.slidebar_ysize];
const.progBar =[0 0  const.progbar_xsize  const.progbar_ysize];


const.tick = [0 0 4 10];
const.rectColor=[200 200 200];
const.selectRect = [0 0 10 10];
const.blue=[0 0 200];


const.slitsize=round(vaDeg2pix(.30,scr));
const.fliptime=.016;
const.padsize=20;
const.minintervals=round(((const.element_size+(const.slitsize*2)+(const.padsize*2))/const.slitsize));
const.nstops=floor(linspace((const.minintervals*2),const.element_size*2,3));

const.imagesize = const.element_size;
const.voronoisize = 308;
const.npixelsperdegree = vaDeg2pix(1,scr);


const.gausstd=round(vaDeg2pix(0.8,scr));
   % std of gaussian windows for replay
const.nelements =  12;       % number of gaussian windows for replay
const.gamparams = [2.5 2]; % for generating timecourse
const.passlevel = round(vaDeg2pix(1,scr));

const.conds = 3;          % left, right, replay
const.nlevels = 8;        % eight images x2 eye combinations + bin replay
const.nreps = [6 6 12];    % no of reps of each condition



end