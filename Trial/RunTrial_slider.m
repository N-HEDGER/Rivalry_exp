

Trialevents.vec{1,i}=[];
Trialevents.vec{2,i}=[];
t=1;

if Trialevents.trialmat(i,2)==1
    %     const.asp=1;
    % StimTexL=Stim.imcellLtex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    % StimTexR=Stim.imcellRtex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
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
    
end






[trial.framerectl] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*const.asp)+const.framewidth], scr.rect)-[const.sep 0 const.sep 0];
[trial.framerectr] = CenterRect([0 0 const.element_size+const.framewidth round(const.element_size*const.asp)+const.framewidth], scr.rect)+[const.sep 0 const.sep 0];

[trial.stimrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*const.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.stimrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*const.asp)], scr.rect)+[const.sep 0 const.sep 0];


SetMouse((const.awrect1(1)+const.awrect1(3))/2, const.awrect1(2), scr.main);
%Screen('DrawLine',scr.main,[],0.1,0.1,0.5,0.4,[])
tic
t1=GetSecs;
while toc<const.triallength

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


% Screen('Flip', scr.main);
% WaitSecs(0.5)


Screen('DrawLine',scr.main,[255],(trial.framerectr(3)+trial.framerectr(1))/2,trial.framerectr(2)-const.lineextend, (trial.framerectr(3)+trial.framerectr(1))/2, trial.framerectr(4)+const.lineextend,[5])
Screen('DrawLine',scr.main,[255],(trial.framerectl(3)+trial.framerectl(1))/2,trial.framerectl(2)-const.lineextend, (trial.framerectl(3)+trial.framerectl(1))/2, trial.framerectl(4)+const.lineextend,[5])

Screen('DrawLine',scr.main,[255],trial.framerectr(1)-const.lineextend,(trial.framerectr(2)+trial.framerectr(4))/2,trial.framerectr(3)+const.lineextend ,(trial.framerectr(2)+trial.framerectr(4))/2 ,[5])
Screen('DrawLine',scr.main,[255],trial.framerectl(1)-const.lineextend,(trial.framerectl(2)+trial.framerectl(4))/2,trial.framerectl(3)+const.lineextend ,(trial.framerectl(2)+trial.framerectl(4))/2 ,[5])




Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectl]);


Screen('DrawTexture',scr.main,Stim.Frametex,[],[trial.framerectr]);

Screen('DrawTexture',scr.main,StimTexL,[],[trial.stimrectl]);
Screen('DrawTexture',scr.main,StimTexR,[],[trial.stimrectr]);

Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid+[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);

Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.main,scr.mid-[const.sep 0],const.smallerfixsize,const.smallerfixcol,[],1);



vect=round(linspace(const.awrect1(1),const.awrect1(3),4));
vect2=round(linspace(const.awrect2(1),const.awrect2(3),4));

range=const.awrect1(3)-const.awrect1(1);
rescaled=linspace(1,100,range);




%         Draw tickmarks

for tick=vect
    for tick2=vect2
    tick_offset = OffsetRect(const.tick, tick, const.awrect1(2)-2);
    Screen('FillRect', scr.main, const.rectColor, tick_offset);
    tick_offset = OffsetRect(const.tick, tick2, const.awrect2(2)-2);
    Screen('FillRect', scr.main, const.rectColor, tick_offset);
    end
end

%     Draw PAS labels and numbers.
for txt=1:4
    %DrawFormattedText(scr.main, text.PASlabel{txt},vect(txt)-(0.3*(vect(2)-vect(1))), const.awrect1(2)-150, WhiteIndex(scr.main),[],[]);
    DrawFormattedText(scr.main, num2str(txt),vect(txt), const.awrect1(2)+40, WhiteIndex(scr.main),[],[]);
    DrawFormattedText(scr.main, num2str(txt),vect2(txt), const.awrect2(2)+40, WhiteIndex(scr.main),[],[]);
end




%    Draw the response bar
Screen('FillRect', scr.main, const.rectColor, const.awrect1);
Screen('FillRect', scr.main, const.rectColor, const.awrect2);
Screen('FillRect', scr.main, [255 0 0], const.awrect1r);
Screen('FillRect', scr.main, [0 255 0], const.awrect1g);
Screen('FillRect', scr.main, [255 0 0], const.awrect2r);
Screen('FillRect', scr.main, [0 255 0], const.awrect2g);




Screen('Flip', scr.main,[],[1]);




    %     Get mouse position and determine whether or not it is in the bar.
    [mx, my, buttons] = GetMouse(scr.main);
    
    inside_bar = IsInRect(mx, my+1, const.awrect1);
    resprect = CenterRectOnPointd(const.selectRect, mx, const.awrect1(2)+1);
    
    mirdist=scr.x_mid-mx;
    resprect2 = CenterRectOnPointd(const.selectRect, const.awrect2(3)-(const.awrect1(3)-mx), const.awrect2(2)+1);
   
    
    %    Draw slider at new location
    Screen('FillRect', scr.main, const.rectColor, const.awrect1);
    Screen('FillRect', scr.main, const.rectColor, const.awrect2);
   
    
    
    
    
    %    Mouse must be clicked, spacebar must be pressed and slider must be
    %    within response bar range.
    
    
    Screen('Flip', scr.main,[],[1]);
    t2=GetSecs;
    
    
    if mx> const.awrect1(3)
        mx=const.awrect1(3);
        
        
    elseif mx< const.awrect1(1)
        mx=const.awrect1(1)+1;
        
    else
%      Screen('FillRect', scr.main, const.blue, resprect);
%       Screen('FillRect', scr.main, const.blue, resprect2);
       Screen('DrawDots', scr.main, [mx const.awrect1(4)], 10, [0 0 255], [], 2);
       Screen('DrawDots', scr.main, [const.awrect2(3)-(const.awrect1(3)-mx) const.awrect2(4)], 10, [0 0 255], [], 2);
      Screen('Flip', scr.main,[],[]);
      
    end
    
    Trialevents.vec{1,i}=[Trialevents.vec{1,i}; rescaled(round(mx)-const.awrect1(1))];
    
    Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
    
    
end

Screen('Flip', scr.main)

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






