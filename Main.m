const.nblock=1;                                                                                                                                                                                                                                                  
nblock=const.nblock ;                                       
                                                                                                                                                                                                                                 
Screen ('Preference','SkipSyncTests', 1); 
sca      
  % Add paths                            
          
addpath('Config','Data','Stim','Conditions','Conversion','Hardware','Misc','Trial','GUI');
     
const.bla=1;
   
[const,config] = sbjConfig(const);
         
   
  if  const.oldsub==0
 %  Is this an old subject?
     
% Screen configurations
% ---------------------
[scr] = scrConfig(const);

% Keyboard configurations
% -----------------------
[my_key] = keyConfig;  

     % Text configurat ions
% -----------------------
[text] = textConfig;  
  
 %  Experimental constant
%  -------------------- -
[const] = constConfig(scr,const);
   
% Experimental design
 % ------------------ -
% if surr==0
[Trialevents] = designConfig(const);
% elseif surr ==1;
%     [Trialevents] = designConfig_surround(const);
% end


else
    scr=config.scr;
     my_key=config. my_key;
    text=config.text;
    const=const;
    Trialevents=config.Trialevents;
  end


 
 
 if nblock ==0
      MinimumMotionExp2
      
 else
% Open screen window
 const.log_text_fid=fopen(const.txtfilename,'a+');

 % ------------------ 
Screen('Preference', 'SkipSyncTests', 1) ;   

[scr.main,scr.rect] = Screen('OpenWindow',scr.scr_num,const.background_color, [], scr.clr_depth,2);
Screen(scr.main,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);    
%const.awrect=CenterRect(const.baseBar, scr.rect);


const.awrect1 = CenterRect(const.baseBar, scr.rect)-[const.sep 0 const.sep 0]+[0 const.barsepval 0 const.barsepval];
const.awrect2 = CenterRect(const.baseBar, scr.rect)+[const.sep 0 const.sep 0]+[0 const.barsepval 0 const.barsepval];

 
% rect, side, perc
const.awrect1r = bitofrect(const.awrect1,1,const.barbit);
const.awrect1g = bitofrect(const.awrect1,2,const.barbit);
const.awrect2r = bitofrect(const.awrect2,1,const.barbit);
const.awrect2g = bitofrect(const.awrect2,2,const.barbit);


%  if surr==0
 Stim =stimConfig(const,scr,Trialevents);
% elseif surr==1
%       Stim=stimConfig_surround(const,scr,Trialevents);
%  end  
  
         
  Screen('DrawTexture',scr.main,Stim.instructscreen,[],[]);
  
 Screen('Flip', scr.main); 
 KbWait
        
 if const.oldsub==0
  Trialevents.elapsedvec=cell(1,length(Trialevents.trialmat));
Trialevents.vec=cell(2,length(Trialevents.trialmat));
Trialevents.imagecell=cell(1,length(Trialevents.trialmat));
Trialevents.congresp=zeros(1,length(Trialevents.stripmat));
Trialevents.rt=zeros(1,length(Trialevents.stripmat));
Trialevents.elapsed=zeros(1,length(Trialevents.stripmat));
const.trialsdone=1; 
 end  
             
      
            
if nblock==1
    ctrialmat=Trialevents.trialmat;
elseif nblock==2
    ctrialmat=Trialevents.stripmat;
elseif nblock==3
    ctrialmat=Trialevents.trialmat
    elseif nblock==0
   
end
       


 for  i=const.starttrial:length(ctrialmat)
    if nblock==1 && Trialevents.trialmat(i,6)==1
log_txt=sprintf(text.formatSpecTrial,num2str(i),text.triallabels{Trialevents.trialmat(i,6)},text.conglabels{Trialevents.trialmat(i,2)},text.colabels{Trialevents.trialmat(i,5)},text.orientlabels{Trialevents.trialmat(i,4)});
fprintf(const.log_text_fid,'%s\n',log_txt);   
        fprintf(log_txt); 
    RunTrial
    elseif nblock==1 && Trialevents.trialmat(i,6)==2
     log_txt=sprintf(text.formatSpecTrial,num2str(i),text.triallabels{Trialevents.trialmat(i,6)},text.conglabels{Trialevents.trialmat(i,2)},text.colabels{Trialevents.trialmat(i,5)},text.orientlabels{Trialevents.trialmat(i,4)});
fprintf(const.log_text_fid,'%s\n',log_txt);      
        fprintf(log_txt); 
        
     runReplay
     
        elseif nblock==2
          Run_trial_strip
          
            STORE_RESULTS_STRIP

     end
    const.trialsdone=i;
    WaitSecs(const.ITI)
 end
   

 

 end

sca

sca
  
   
  
   
  
   
   
  
                                                                                                                                                                                                                                                                              