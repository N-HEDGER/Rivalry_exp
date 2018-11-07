
exptpath='/Users/nicholashedger/Google\ Drive/Rivalry';

nframesperflip = 2;

% choose a condition to run

E.subj = const.sbj;
E.choosecond = upper(P);
E.choosecond = E.choosecond(1);
E.condition = 3
E.block = str2num(initvals{4});
E.nruns = str2num(initvals{5});

E.condition=3;

d = dir(strcat(exptpath,'Results/'));
target = strcat(E.subj, 'paramsIM.mat');
b = 0;
for n = 1:length(d)
	a = strfind(d(n).name, target);
    if ~isempty(a), b = b + a; end
end

resdir = strcat(exptpath, 'Results/', E.subj, '/');

if b>0
	load(strcat(exptpath, 'Results/',E.subj,'paramsIM.mat'));
else												% must be a new subject, so initialise and create a results directory
	subconds = zeros(E.conds,E.nlevels);
    
	save(strcat(exptpath,'Results/',E.subj,'paramsIM.mat'), 'subconds');
    mkdir(resdir);
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% now do all the setting up of graphics hardware etc

WaitSecs(0.1);                % important to load in the MEX file before the expt starts
GetSecs;
beep = MakeBeep(440,0.1);       % generates the beep waveform
Snd('Open');                    % opens the sound channel

              % start the 'try/catch' loop


              
if Trialevents.trialmat(i,2)==1

trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcellLS1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRS1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcellLS2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRS2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcellLS3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRS3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcellLS4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRS4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end





elseif Trialevents.trialmat(i,2)==2
    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcellLM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcellLM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcellLM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcellLM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
    elseif Trialevents.trialmat(i,2)==3
    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcellLM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcellLM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcellLM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcellLM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
end


[trial.framerectl] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)-[const.sep 0 const.sep 0];
[trial.framerectr] = CenterRect([0 0 const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)+[const.sep 0 const.sep 0];

[trial.stimrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.stimrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];


[trial.butrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)-[const.sep 0 const.sep 0];
[trial.butrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)+[const.sep 0 const.sep 0];

              
    
    
    

    % Enable alpha blending with proper blend-function. We need it
    % for drawing of our alpha-mask (gaussian aperture):
    Screen('BlendFunction', w, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    HideCursor;
    

    
% Image 1 and image 2 are defined here    


    
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);
    
 Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);   




    Screen('Flip', w);

    
    
    bottomlayer = StimTexL;
    ST.timecourse = gettimes(const.triallength, const.gamparams, ifi*nframesperflip, const.nelements);
    
    
    [offsetlistx, offsetlisty] = getpositions(ST);
    
    Mi = repmat(1:const.imagesize, const.imagesize, 1);
    Mj = rot90(Mi);
    composite = StimTexR;

KbWait

counter = 0;
starttime = GetSecs;
vbl = starttime;
vblendtime = vbl + const.triallength;      % put on for a minute

while(vbl < vblendtime)

    counter = counter + 1;   
    
     gausmask = zeros(const.imagesize);
     for m = 1:const.nelements
     gausmask = gausmask + 0.975*ST.timecourse(m,counter)*exp(-(((Mi-offsetlistx(m)).^2) ./ (2 .* const.gausstd.^2)) - (((Mj-offsetlisty(m)).^2) ./ (2 .* const.gausstd.^2)));
     
     
     end
     
     R.proportion(counter) = mean(gausmask(:));
     composite(:,:,4) = round(255*(gausmask+1)/2);    % mask is the alpha layer
         
     toplayer = StimTexR;

     Screen('DrawTexture', w, bottomlayer, [], trial.stimrectl);
     Screen('DrawTexture', w, bottomlayer, [], trial.stimrectr);  
     Screen('DrawTexture', w, toplayer, [], trial.stimrectl);
     Screen('DrawTexture', w, toplayer, [], trial.stimrectr);       

   	Screen('DrawTexture', w, ver, [], trial.framrectl);
    Screen('DrawTexture', w, ver, [], trial.framrectr);
    drawfixation(w, width, height);
    vbl = Screen('Flip', w, vbl+ifi*nframesperflip-ifi/2);
     
%     Screen('Close', toplayer);      % stop build up of unwanted textures
% record data
  
    [keyIsDown, secs, keyCode] = KbCheck;
          if keyCode(my_key.red)
              R.resps(counter) = 2;
          elseif keyCode(my_key.green)
              R.resps(counter) = 1;
              
          elseif keyCode(my_key.mixed)
              R.resps(counter) = 3;
              
          elseif keyCode(KbName('Escape'))
%             onset = 0;        % make this very small to exit the loop
            runsthissession = runsthissession + 100;        % make this big to stop doing more trials
            vbl = vbl + 1000;
          else
              R.resps(counter) = 0;
          end
          
          if (keyCode(KbName('LeftArrow')) + keyCode(KbName('RightArrow')))==2
              R.resps(counter) = 0;         % code as zero if both pressed
          end
          
        R.resptime(counter) = vbl-starttime;     % time of response

end     
     
    Screen('FillRect',scr.main, [128 128 128]);
%     Screen('DrawTexture', w, fp, [], fprect);      % draws fixation points
    drawfixation(w, width, height);
    Screen('Flip', w);
    
R.subj = E.subj;
R.cond = E.condition;
R.block = E.block;
R.rep = E.rep;
R.imagecontrast = r1;
R.scramblecontrast = r2;

if E.condition==3
    R.timecourse = ST.timecourse;
    R.windowlocations(1,1:const.nelements) = offsetlistx;
    R.windowlocations(2,1:const.nelements) = offsetlisty;
end

if ~keyCode(KbName('Escape'))
save(strcat(resdir,'ImC',num2str(E.condition),'B',num2str(E.block),'r',num2str(E.rep),'.mat'), 'R');
% record that this condition & rep are done
subconds(E.condition,E.block) = subconds(E.condition,E.block) + 1;
save(strcat(exptpath,'Results/',E.subj,'paramsIM.mat'), 'subconds');
 Screen('CloseAll');
 ShowCursor;
end

clear R;    

  
Screen('Close')

% end experiment


%--------------------------------------------------------------------------------------------------

%--------------------------------------------------------------------------------------------------
function timecourse = gettimes(const.triallength, gamparams, ifi, nelements)

% generate gamma distributions for replay conditions

tframes = 0:ifi:const.triallength+ifi;      % frames on which stim are displayed

mu = const.triallength/2;       % create gaussian for smoothing
sigma = 0.4;
gaus = exp(-(tframes-mu).^2./(2.*sigma^2));

for nels = 1:nelements
gamdurs = random('gam', gamparams(1,1), gamparams(1,2), const.triallength*2, 1);

currentstate = round(rand);   %0 or 1
currenttotal = 0;
counter = 1;

for n = 1:length(tframes)
    if tframes(n)>currenttotal
        currentstate = ~currentstate;
        currenttotal = currenttotal + gamdurs(counter);
        counter = counter + 1;
    end    
    tempcourse(n) = currentstate;
end

tempcourse = conv(tempcourse, gaus);        % smooth the timecourse
tempcourse = tempcourse(1, 1+round(length(tframes)/2):round(length(tframes)*3/2)); % cut out middle portion
timecourse(nels,:) = tempcourse;

clear tempcourse;

end

timecourse = timecourse/max(abs(timecourse(:)));
timecourse = (timecourse*2)-1;  
return % scale between -1 and 1 (for gaussians)
end

%--------------------------------------------------------------------------------------------------     

%--------------------------------------------------------------------------------------------------
function [offsetlistx, offsetlisty] = getpositions(ST)

    offsetlistx(1) = randn*ST.imagesize/8 + ST.imagesize/2;
    offsetlisty(1) = randn*ST.imagesize/8 + ST.imagesize/2;

    for n = 2:ST.nelements
       exitcode = 0;
      while exitcode==0         % check the distance between all gaussians
              offsetlistx(n) = randn*ST.imagesize/8 + ST.imagesize/2;
              offsetlisty(n) = randn*ST.imagesize/8 + ST.imagesize/2;

          for m = 1:n-1
            xdiff = offsetlistx(n) - offsetlistx(m);
            ydiff = offsetlisty(n) - offsetlisty(m);
            dist = sqrt(xdiff^2 + ydiff^2);      % distance between points
            if dist>ST.passlevel
            passlist(m) = 1;
            else
            passlist(m) = 0;
            end
          end
          if sum(passlist)==length(passlist)
              exitcode = 1;
          end
          
      end
    
    end
end
   
%--------------------------------------------------------------------------------------------------
