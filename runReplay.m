

Stim.Frametex=Screen('MakeTexture',scr.main,Stim.Frame);

Stim.Graytex=Screen('MakeTexture',scr.main,Stim.Frame);
Stim.instructtex=Screen('MakeTexture',scr.main,Stim.instructim);


exptpath='/Users/nicholashedger/Google\ Drive/Current_proj/';
 ifi=Screen('GetFlipInterval', scr.main);
nframesperflip = 2;

% choose a condition to run

E.subj = const.sbj.subname{1};
E.choosecond = upper('P');
E.choosecond = E.choosecond(1);
E.condition = 3;
E.block = 1;
E.nruns = 1;

E.condition=3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% now do all the setting up of graphics hardware etc

WaitSecs(0.1);                % important to load in the MEX file before the expt starts
GetSecs;
                 % opens the sound channel

              % start the 'try/catch' loop
if Trialevents.trialmat(i,2)==1

trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcell0LM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcell0LM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcell0LM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcell0LM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end



elseif Trialevents.trialmat(i,2)==2
    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcellLM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcellLM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcellLM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcellLM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcellRM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
    elseif Trialevents.trialmat(i,2)==3
    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
    StimTexL=Stim.imcell0LM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM5{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
    StimTexL=Stim.imcell0LM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM6{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
    StimTexL=Stim.imcell0LM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM7{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
    StimTexL=Stim.imcell0LM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    StimTexR=Stim.imcell0RM8{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
end
              

[trial.framerectl] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)-[const.sep 0 const.sep 0];
[trial.framerectr] = CenterRect([0 0 const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)+[const.sep 0 const.sep 0];

[trial.stimrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.stimrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];


[trial.butrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)-[const.sep 0 const.sep 0];
[trial.butrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)+[const.sep 0 const.sep 0];

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

    Screen('Flip', scr.main,[],[]);


    bottomlayer = StimTexL;
    ST.timecourse = gettimes(const.triallength, const.gamparams, ifi*nframesperflip, const.nelements);
    
    
    [offsetlistx, offsetlisty] = getpositions(const);
    
    Mi = repmat(1:const.imagesize, const.imagesize, 1);
    Mj = rot90(Mi);
    composite = im2uint8(StimTexR);

counter = 0;
starttime = GetSecs;
vbl = starttime;
vblendtime = vbl + const.triallength;      % put on for a minute


R.toplayer=StimTexR;
R.botlayer=StimTexL;

while(vbl < vblendtime)

    counter = counter + 1;   
    
     gausmask = zeros(floor(const.imagesize*const.asp),const.imagesize);
     for m = 1:const.nelements
     gausmask = gausmask + 0.975*ST.timecourse(m,counter)*exp(-(((Mi-offsetlistx(m)).^2) ./ (2 .* const.gausstd.^2)) - (((Mj-offsetlisty(m)).^2) ./ (2 .* const.gausstd.^2)));
     
     
     end
     
     R.proportion(counter) = mean(gausmask(:));
     
     composite=imresize(composite,[const.element_size,const.element_size]);
    % composite(:,:,4) = round(255*(gausmask+1)/2);    % mask is the alpha layer
       composite(:,:,4) = round(255*(gausmask+1)/2);
  
     toplayer = Screen('MakeTexture', scr.main, composite);  
     bottomlayer = Screen('MakeTexture', scr.main, im2uint8(StimTexL));  

     
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);
     
     Screen('DrawTexture', scr.main, bottomlayer, [], trial.stimrectl);
     Screen('DrawTexture', scr.main, bottomlayer, [], trial.stimrectr);  
     Screen('DrawTexture', scr.main, toplayer, [], trial.stimrectl);
     Screen('DrawTexture', scr.main, toplayer, [], trial.stimrectr);
     
     
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);   

    vbl = Screen('Flip', scr.main, vbl+ifi*nframesperflip-ifi/2);
     
%     Screen('Close', toplayer);      % stop build up of unwanted textures
% record data
  
    [keyIsDown, secs, keyCode] = KbCheck;
          if keyCode(my_key.red)
              R.resps(counter) = 2;
              
              Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 2];
              
          elseif keyCode(my_key.green)
              R.resps(counter) = 1;
              Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 1];
              
          elseif keyCode(my_key.mixed)
              R.resps(counter) = 3;
              Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 3];
          elseif keyCode(KbName('Escape'))
%             onset = 0;        % make this very small to exit the loop
            runsthissession = runsthissession + 100;        % make this big to stop doing more trials
            vbl = vbl + 1000;
          else
              R.resps(counter) = 0;
                Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 3];
          end
          
          if (keyCode(KbName('LeftArrow')) + keyCode(KbName('RightArrow')))==2
              R.resps(counter) = 0;         % code as zero if both pressed
          end
          
        R.resptime(counter) = vbl-starttime;     % time of response
        
          Trialevents.vec{2,i}=[Trialevents.vec{2,i}; vbl-starttime;];

end     
     
    Screen('FillRect',scr.main, [128 128 128]);

    
    
    
    Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);
    Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);
    
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);
    
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
    Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);
    
    
    
    progvec=round(linspace(1,const.stimright,length(Trialevents.trialmat)));
progbar=[0 7 progvec(i) 17];
Screen('FillRect', scr.main, const.blue, progbar);
Screen('DrawTexture',scr.main,Stim.instructtex,[],[trial.butrectl]);
Screen('DrawTexture',scr.main,Stim.instructtex,[],[trial.butrectr]);    
    
Screen('Flip', scr.main);
        

    
    [KeyIsDown,secs,keyCode]=KbCheck;
    while keyCode(my_key.space)==0 && keyCode(my_key.escape)==0
        [KeyisDown,secs,keyCode]=KbCheck;
    end
    
    if keyCode(my_key.space)==1;

    config.scr = scr; config.const = const; config.Trialevents = Trialevents; config.my_key = my_key;config.text = text;
    log_txt=sprintf(text.formatSpecSave,num2str(clock));
    fprintf(const.log_text_fid,'%s\n',log_txt);
    save(strcat(const.filenamer,'.mat'),'config');

    elseif keyCode(my_key.escape)==1
    const.trialsdone=i;
    config.scr = scr; config.const = const; config.Trialevents = Trialevents; config.my_key = my_key;config.text = text;
        log_txt=sprintf(text.formatSpecQuit,num2str(clock));
        fprintf(const.log_text_fid,'%s\n',log_txt);
        save(strcat(const.filenamer,'.mat'),'config');

        log_txt=sprintf(text.formatSpecSave,num2str(clock));
        fprintf(const.log_text_fid,'%s\n',log_txt);
        ShowCursor(1);
        Screen('CloseAll')
    end

    
    
    
R.subj = E.subj;
R.cond = E.condition;
R.block = E.block;
R.rep = i;


if E.condition==3
    R.timecourse = ST.timecourse;
    R.windowlocations(1,1:const.nelements) = offsetlistx;
    R.windowlocations(2,1:const.nelements) = offsetlisty;
end

if ~keyCode(KbName('Escape'))
save(strcat(const.filenamer,'_',num2str(i),'.mat'), 'R');
% record that this condition & rep are done

end

clear R;    
Screen('Close')

 

% end experiment


%--------------------------------------------------------------------------------------------------

%--------------------------------------------------------------------------------------------------
function timecourse = gettimes(triallength, gamparams, ifi, nelements)

% generate gamma distributions for replay conditions

tframes = 0:ifi:triallength+ifi;      % frames on which stim are displayed

mu = triallength/2;       % create gaussian for smoothing
sigma = 0.4;
gaus = exp(-(tframes-mu).^2./(2.*sigma^2));

for nels = 1:nelements
gamdurs = random('gam', gamparams(1,1), gamparams(1,2), triallength*2, 1);

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
function [offsetlistx, offsetlisty] = getpositions(const)

    offsetlistx(1) = randn*const.imagesize/8 + const.imagesize/2;
    offsetlisty(1) = randn*const.imagesize/8 + const.imagesize/2;

    for n = 2:const.nelements
       exitcode = 0;
      while exitcode==0         % check the distance between all gaussians
              offsetlistx(n) = randn*const.imagesize/8 + const.imagesize/2;
              offsetlisty(n) = randn*const.imagesize/8 + const.imagesize/2;

          for m = 1:n-1
            xdiff = offsetlistx(n) - offsetlistx(m);
            ydiff = offsetlisty(n) - offsetlisty(m);
            dist = sqrt(xdiff^2 + ydiff^2);      % distance between points
            if dist>const.passlevel
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
