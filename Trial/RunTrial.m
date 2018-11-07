
Stim.Frametex=Screen('MakeTexture',scr.main,Stim.Frame);

Stim.Graytex=Screen('MakeTexture',scr.main,Stim.Frame);


Stim.instructtex=Screen('MakeTexture',scr.main,Stim.instructim);



if Trialevents.trialmat(i,2)==1
trial.asp=1.27;
        switch Trialevents.trialmat(i,3)
        case 1
           
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));

%     StimTexL=Stim.imcellLM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
            
%             StimTexL=Stim.imcellLM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%             StimTexR=Stim.imcellRM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
%     StimTexL=Stim.imcellLM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
         
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
%     StimTexL=Stim.imcellLM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
elseif Trialevents.trialmat(i,2)==2
    trial.asp=1.27;

    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
            
%             StimTexL=Stim.imcellLS1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%             StimTexR=Stim.imcellRS1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
                      StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
              
            
%     StimTexL=Stim.imcellLS2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRS2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
            
%     StimTexL=Stim.imcellLS3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRS3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
            
            
%     StimTexL=Stim.imcellLS4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRS4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end

    
    
    elseif Trialevents.trialmat(i,2)==3
    trial.asp=1.27;
    switch Trialevents.trialmat(i,3)
        case 1
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM1{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM5{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
     
            
            
%     StimTexL=Stim.imcellLM1tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM5tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
            
        case 2
            
            StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM2{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM6{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            
            
%     StimTexL=Stim.imcellLM2tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM6tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 3
            
                  StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM3{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM7{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));      
            
%     StimTexL=Stim.imcellLM3tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM7tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
        case 4
            
                              StimTexL= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM4{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));
            StimTexR= Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM8{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)}));   
            
%     StimTexL=Stim.imcellLM4tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
%     StimTexR=Stim.imcellRM8tex{Trialevents.trialmat(i,4),Trialevents.trialmat(i,5)};
    end
    
    
end


[trial.framerectl] = CenterRect([0 0  const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)-[const.sep 0 const.sep 0];
[trial.framerectr] = CenterRect([0 0 const.element_size+const.framewidth round(const.element_size*trial.asp)+const.framewidth], scr.rect)+[const.sep 0 const.sep 0];

[trial.stimrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)-[const.sep 0 const.sep 0];
[trial.stimrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*trial.asp)], scr.rect)+[const.sep 0 const.sep 0];


[trial.butrectl] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)-[const.sep 0 const.sep 0];
[trial.butrectr] = CenterRect([0 0 round(const.element_size) round(const.element_size*0.72)], scr.rect)+[const.sep 0 const.sep 0];


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


Screen('Flip', scr.main,[],[]);
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
            Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 2];
            t2=GetSecs;
           
            Trialevents.vec{2,i}=[Trialevents.vec{2,i}; t2-t1];
        elseif keyCode(my_key.green)
            Trialevents.vec{1,i}=[Trialevents.vec{1,i}; 1];
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
progbar=[0 7 progvec(i) 17];
Screen('FillRect', scr.main, const.blue, progbar);

Screen('DrawTexture',scr.main,Stim.instructtex,[],[trial.butrectl]);
Screen('DrawTexture',scr.main,Stim.instructtex,[],[trial.butrectr]);




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
    const.trialsdone=i;
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




