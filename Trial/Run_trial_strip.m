%Nakano params
% Slit size= .14 deg
% Slit speed 3.5 dps
% 4 DVA.

log_txt=sprintf(text.formatSpecTrialstrip,num2str(i),text.stimlabels{Trialevents.stripmat(i,2)},text.conglabels{Trialevents.stripmat(i,3)},text.orientlabels{Trialevents.stripmat(i,5)},num2str(Trialevents.stripmat(i,6)),num2str(Trialevents.stripmat(i,7)));
fprintf(const.log_text_fid,'%s\n',log_txt);
fprintf(log_txt); 

if Trialevents.stripmat(i,5)==1
    orient=1;
    
if Trialevents.stripmat(i,3)==1 && Trialevents.stripmat(i,6)==1
    trialstim=Stim.congcellL{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==1 && Trialevents.stripmat(i,6)==2
    trialstim=Stim.congcellR{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==2 && Trialevents.stripmat(i,6)==1
    trialstim=Stim.incongcellL{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==2 && Trialevents.stripmat(i,6)==2
    trialstim=Stim.incongcellR{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
end

elseif Trialevents.stripmat(i,5)==2
      orient=2;
    if Trialevents.stripmat(i,3)==1 && Trialevents.stripmat(i,6)==1
    trialstim=Stim.congcellLv{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==1 && Trialevents.stripmat(i,6)==2
    trialstim=Stim.congcellRv{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==2 && Trialevents.stripmat(i,6)==1
    trialstim=Stim.incongcellLv{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
elseif Trialevents.stripmat(i,3)==2 && Trialevents.stripmat(i,6)==2
    trialstim=Stim.incongcellRv{Trialevents.stripmat(i,2),Trialevents.stripmat(i,4)};
    
    end
end
    

trialstim=imresize(trialstim, [const.element_size NaN]);

trialstim2=padarray(trialstim,[const.padsize,const.padsize],0.5,'both');

trial.asp=1.27;

[trial.framerect] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect);

[trial.stimrect] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect);



sizers=size(trialstim2);

imcell=cell(1,const.element_sizeVal);

imcellt=cell(1,const.element_sizeVal);



if orient==1
for j=1:sizers(2)
imcell{j}=im2uint8(trialstim2);
imcell{j}(:,:,4)=stripalpha(trialstim2,const.slitsize,const.slitsize,j,orient)*255;
imcellt{j}=Screen('MakeTexture',scr.main,imcell{j});
end

elseif orient==2
for j=1:sizers(1)
imcell{j}=im2uint8(trialstim2);
imcell{j}(:,:,4)=stripalpha(trialstim2,const.slitsize,const.slitsize,j,orient)*255;
imcellt{j}=Screen('MakeTexture',scr.main,imcell{j});
end
end



Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerect]);
im2=trialstim2;


% nstops=minintervals;

if Trialevents.stripmat(i,5)==1
    
if Trialevents.stripmat(i,6)==1
    Screen('DrawDots',scr.main,scr.mid-[(const.element_size+const.padsize)/2 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[(const.element_size+const.padsize)/2 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[(const.element_size+const.padsize)/2 0],const.smallerfixsize,const.smallerfixcol,[],1);
 stops=floor(linspace(1,sizers(2),const.nstops(Trialevents.stripmat(i,7))));
elseif Trialevents.stripmat(i,6)==2
 stops=floor(linspace(sizers(2),1,const.nstops(Trialevents.stripmat(i,7))));
Screen('DrawDots',scr.main,scr.mid+[(const.element_size+const.padsize)/2 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[(const.element_size+const.padsize)/2 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[(const.element_size+const.padsize)/2 0],const.smallerfixsize,const.smallerfixcol,[],1);
end

elseif Trialevents.stripmat(i,5)==2
    
 if Trialevents.stripmat(i,6)==1
    Screen('DrawDots',scr.main,scr.mid-[0 ((const.element_size*trial.asp)+const.padsize)/2],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[0 ((const.element_size*trial.asp)+const.padsize)/2],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[0 ((const.element_size*trial.asp)+const.padsize)/2],const.smallerfixsize,const.smallerfixcol,[],1);
 stops=floor(linspace(1,sizers(1),const.nstops(Trialevents.stripmat(i,7))*trial.asp));
elseif Trialevents.stripmat(i,6)==2
 stops=floor(linspace(sizers(1),1,const.nstops(Trialevents.stripmat(i,7))*trial.asp));
Screen('DrawDots',scr.main,scr.mid+[0 ((const.element_size*trial.asp)+const.padsize)/2],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[0 ((const.element_size*trial.asp)+const.padsize)/2],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[0 ((const.element_size*trial.asp)+const.padsize)/2],const.smallerfixsize,const.smallerfixcol,[],1);
 end
end



Screen('Flip',scr.main,[],[]);
WaitSecs(0.5)

  t1=GetSecs;
for j=1:length(stops)
    tx=GetSecs;
    Screen('DrawTexture',scr.main,imcellt{stops(j)},[],trial.stimrect);
    Screen('Flip',scr.main,[],[]);
    ty=GetSecs;
   
end
 t2=GetSecs;
 
 Trialevents.elapsed(i)=t2-t1;
 
 Screen('DrawText',scr.main,'Congruent (left) or incongruent (right)?',scr.x_mid-10,scr.y_mid-9,[255 255 255]);
 Screen('Flip',scr.main,[],[]);
 
 
 t0=GetSecs;
 [KeyIsDown,secs,keyCode]=KbCheck;
    
   
    while keyCode(my_key.green)==0 && keyCode(my_key.red)==0
        [KeyisDown,secs,keyCode]=KbCheck;
    end
    
 Screen('DrawText',scr.main,'Press space for new trial',scr.x_mid-10,scr.y_mid-9,[255 255 255]);

 Screen('Flip',scr.main,[],[]);
    
    
Trialevents.rt(i)=secs-t0;


    if keyCode(my_key.green)==1;
        Trialevents.congresp(i)=1;
    elseif keyCode(my_key.red)==1;
        Trialevents.congresp(i)=2;
    end
    


    t1=GetSecs;
    [KeyIsDown,secs,keyCode]=KbCheck;
    while keyCode(my_key.space)==0 && keyCode(my_key.escape)==0
        [KeyisDown,secs,keyCode]=KbCheck;
    end
    
    
    
 progvec=round(linspace(1,scr.scr_sizeX,length(Trialevents.stripmat)));
progbar=[0 7 progvec(i) 17];
Screen('FillRect', scr.main, const.blue, progbar);   
 
    
 Screen('Flip',scr.main,[],[])
    
    if keyCode(my_key.space)==1;

    config.scr = scr; config.const = const; config.Trialevents = Trialevents; config.my_key = my_key;config.text = text;
    log_txt=sprintf(text.formatSpecSave,num2str(clock));
    fprintf(const.log_text_fid,'%s\n',log_txt);
    save(const.filename,'config');

    elseif keyCode(my_key.escape)==1

    config.scr = scr; config.const = const; config.Trialevents = Trialevents; config.my_key = my_key;config.text = text;
        log_txt=sprintf(text.formatSpecQuit,num2str(clock));
        fprintf(const.log_text_fid,'%s\n',log_txt);
        save(const.filename,'config');

        log_txt=sprintf(text.formatSpecSave,num2str(clock));
        fprintf(const.log_text_fid,'%s\n',log_txt);
        ShowCursor(1);
        Screen('CloseAll')
    end


 
Screen('Close')

