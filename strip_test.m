%Nakano params
% Slit size= .14 deg
% Slit speed 3.5 dps
% 4 DVA.
Screen('Preference', 'SkipSyncTests', 1);

addpath('Config','Data','Stim','Conditions','Conversion','Hardware','Misc','Trial','GUI');
const.bla=1;


screenNumber=max(Screen('Screens'));
[scr] = scrConfig(const);

% Size of the slit.
slitsize=round(vaDeg2pix(.14,scr));
[const] = constConfig(scr,const);

[w, wRect]=Screen('OpenWindow',screenNumber, [128 128 128], [0 0 1920 800], 32, 2);

%This is our alpha blending mode
Screen(w,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


im1=incongcellR{2,4};
im1=im2uint8(imresize(im1,[const.element_size NaN]));

minintervals=floor((const.element_size/slitsize));

fliptime=.016;

mintottime=(fliptime*minintervals);

desired_dps=1;

desired_time=const.element_sizeVal/desired_dps;

nstops=desired_time/fliptime;

conditions=floor(linspace(minintervals,250,5));


sizers=size(im1);

imcell=cell(1,sizers(2));

imcellt=cell(1,sizers(2));
for j=1:sizers(2)
% imcell{j}=im1;
imcell{j}=im1;
imcell{j}(:,:,4)=stripalpha(im1,slitsize,slitsize,j)*255;
imcellt{j}=Screen('MakeTexture',w,imcell{j});
end



% imt=Screen('MakeTexture',w,rgb2gray(im1));
% Screen('DrawTexture',w,imt);

Screen('Flip',w)
KbWait;

im2=im1;


% nstops=minintervals;

stops=floor(linspace(1,sizers(2),conditions(3)));

  t1=GetSecs;
for j=1:length(stops)
  
    tx=GetSecs;
    Screen('DrawTexture',w,imcellt{stops(j)});
    Screen('Flip',w,[],[])
    ty=GetSecs;
   
end
 t2=GetSecs;
 
KbWait;
 sca
 


