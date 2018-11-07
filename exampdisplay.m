
Screen('Preference', 'SkipSyncTests', 1);
addpath('Stim');


% Number of the exp screen:
scr.all = Screen('Screens');
scr.scr_num = max(scr.all);

% Screen resolution (pixel) :
[scr.scr_sizeX, scr.scr_sizeY]=Screen('WindowSize', scr.scr_num);

% Size of the display :
scr.disp_sizeX = 475;scr.disp_sizeY=270; 

% Pixels size:
scr.clr_depth = Screen('PixelSize', scr.scr_num);

% Frame rate : (fps)
scr.frame_duration =1/(Screen('FrameRate',scr.scr_num));


% Subject dist
scr.dist = 67;             
addpath('Config','Data','Stimuli','Conditions','Conversion','Hardware','Misc','Trial');

% Center of the screen :
scr.x_mid = (scr.scr_sizeX/2.0);
scr.y_mid = (scr.scr_sizeY/2.0);
scr.mid = [scr.x_mid,scr.y_mid];



const.background_color=[128 128 128]; % Color of the background.
const.element_con=1; % Contrast of image.
const.element_lum=1; % Luminance of image.
const.element_sizeVal=4; % Size of image (DVA)
const.element_size=round(vaDeg2pix(const.element_sizeVal,scr)); % Size of image in pixels.
const.ctr=scr.mid; % Middle of the screen.
const.sep_sizeVal=1; % Separation of images.
const.sep=round(vaDeg2pix(const.sep_sizeVal,scr)/2)+round(const.element_size/2);


const.asp=1; % Aspect ratio of images.

%const.asp=1
const.framewidth=10; % Width of the frame.

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


Frametex=im2uint8(randn(round(const.element_size*const.asp)+const.framewidth,const.element_size+const.framewidth));

StimtexL=im2uint8(im1);
StimtexR=im2uint8(im2);


scr.rect=[0, 0, scr.scr_sizeX, scr.scr_sizeY];

[const.framerectl] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*const.asp)+const.framewidth], scr.rect)-[const.sep 0 const.sep 0];
[const.framerectr] = CenterRect([0 0 const.element_size+const.framewidth round(const.element_size*const.asp)+const.framewidth], scr.rect)+[const.sep 0 const.sep 0];

[const.stimrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*const.asp)], scr.rect)-[const.sep 0 const.sep 0];
[const.stimrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*const.asp)], scr.rect)+[const.sep 0 const.sep 0];


[scr.main,scr.rect] = Screen('OpenWindow',scr.scr_num,const.background_color,[]);

StimtexL=Screen('MakeTexture',scr.main,StimtexL);
StimtexR=Screen('MakeTexture',scr.main,StimtexR);
Frametex=Screen('MakeTexture',scr.main,Frametex);


  Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

      Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

    


Screen('DrawTexture',scr.main,Frametex,[],[const.framerectl]);
Screen('DrawTexture',scr.main,Frametex,[],[const.framerectr]);



Screen('DrawTexture',scr.main,StimtexL,[],[const.stimrectl]);
Screen('DrawTexture',scr.main,StimtexR,[],[const.stimrectr]);

  Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

      Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

    

Screen('Flip', scr.main);

WaitSecs(10)

KbWait
sca


