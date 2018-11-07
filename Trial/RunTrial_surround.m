
trial.asp=1;
   
    
StimTexL=Stim.centrecelltex{Trialevents.trialmat(i,2),Trialevents.trialmat(i,3)};


StimTexR=Stim.centrecelltex{2/Trialevents.trialmat(i,2),2/Trialevents.trialmat(i,3)};


if Trialevents.trialmat(i,4)==1
    surroundtex=Stim.surroundcelltex{Trialevents.trialmat(i,2)}
else
     surroundtex=Stim.surroundcelltex{2/Trialevents.trialmat(i,2)}
end





[trial.framerectl] = CenterRect([0 0  const.element_size round(const.element_size*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.framerectr] = CenterRect([0 0 const.element_size round(const.element_size*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];

[trial.stimrectl] = CenterRect([0 0 round(const.element_size*const.diff) round((const.element_size*const.diff)*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.stimrectr] = CenterRect([0 0 round(const.element_size*const.diff) round((const.element_size*const.diff)*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];


[trial.bigstimrectl] = CenterRect([0 0  const.element_size round(const.element_size*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.bigstimrectr] = CenterRect([0 0 const.element_size round(const.element_size*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];





%Screen('DrawLine',scr.main,[],0.1,0.1,0.5,0.4,[])



Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);

Screen('DrawTexture',scr.main,Stim.Graytex,[],[trial.stimrectl]);
Screen('DrawTexture',scr.main,Stim.Graytex,[],[trial.stimrectr]);



Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);






Screen('Flip', scr.main);
WaitSecs(0.5)


Screen('DrawLine',scr.main,[255],(trial.framerectr(3)+trial.framerectr(1))/2,trial.framerectr(2)-const.lineextend, (trial.framerectr(3)+trial.framerectr(1))/2, trial.framerectr(4)+const.lineextend,[5])
Screen('DrawLine',scr.main,[255],(trial.framerectl(3)+trial.framerectl(1))/2,trial.framerectl(2)-const.lineextend, (trial.framerectl(3)+trial.framerectl(1))/2, trial.framerectl(4)+const.lineextend,[5])

Screen('DrawLine',scr.main,[255],trial.framerectr(1)-const.lineextend,(trial.framerectr(2)+trial.framerectr(4))/2,trial.framerectr(3)+const.lineextend ,(trial.framerectr(2)+trial.framerectr(4))/2 ,[5])
Screen('DrawLine',scr.main,[255],trial.framerectl(1)-const.lineextend,(trial.framerectl(2)+trial.framerectl(4))/2,trial.framerectl(3)+const.lineextend ,(trial.framerectl(2)+trial.framerectl(4))/2 ,[5])




Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);


Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);

Screen('DrawTexture',scr.main,surroundtex,[],[trial.bigstimrectl]);
Screen('DrawTexture',scr.main,surroundtex,[],[trial.bigstimrectr]);

Screen('DrawTexture',scr.main,StimTexL,[],[trial.stimrectl]);
Screen('DrawTexture',scr.main,StimTexR,[],[trial.stimrectr]);





Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);


Screen('Flip', scr.main);
Trialevents.imagecell{i}=Screen('GetImage',scr.main,[scr.rect]);



Trialevents.vec{1,i}=[];
Trialevents.vec{2,i}=[];
t=1;
tic
t1=GetSecs;
while toc<const.triallength
    
    pass=0;
    [keyIsDown, ~, keyCode] = KbCheck(min(GetKeyboardIndices));
    if keyIsDown
        
        if keyCode(my_key.red)
            Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 1];
            t2=GetSecs;
           
            Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
        elseif keyCode(my_key.green)
            Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 2];
            t2=GetSecs;
           
            Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
            
        elseif keyCode(my_key.mixed)
            Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 3];
            t2=GetSecs;
           
            Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
        end
    else
           Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 0];
            t2=GetSecs;
            Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
        
    end


end



Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);
Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);

Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);



progvec=round(linspace(1,const.stimright,length(Trialevents.trialmat)));
progbar=[0 7 progvec(const.trialsdone) 17];
Screen('FillRect', scr.main, const.blue, progbar);


Screen('Flip', scr.main);


    t1=GetSecs;
    [KeyIsDown,secs,keyCode]=KbCheck;
    while keyCode(my_key.space)==0 && keyCode(my_key.escape)==0
        [KeyisDown,secs,keyCode]=KbCheck;
    end
    
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






