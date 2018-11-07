kl=rgb2gray(imread('HouseNew1.jpg'));

kl2=imread('nu1.jpg');


[f,g]=PATCHWORK(kl,kl2,30,10,1,1,1);



    screenNumber=max(Screen('Screens'));
	
	% Open a double buffered fullscreen window and draw a gray background
	% and front and back buffers.
    
    
    figure
	[w, wRect]=Screen('OpenWindow',screenNumber, 0.5, [0 0 1920 600], 32, 2);
	
	%This is our alpha blending mode
	Screen(w,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    
    
stableframes=20;

upframes=35;

downframes=35;

    
trans=[linspace(0.2,1,upframes),linspace(1,1,stableframes),linspace(1,0,downframes)]
 
trans=smooth(trans);

plot(trans);
    
    tic
    
ntransitions=10;
waitval=(0.01);


transitiontext=cell(1,4);

transitiontext{1}='all green';
transitiontext{2}='all red';
transitiontext{3}='halffield';
transitiontext{4}='random';

    
  for j=1:ntransitions
      
 transition=randi(4);     
      
 Randim=make_alpha(f,540,80,17,transition,1);
 Randim2=make_alpha(f,540,80,17,transition,1);
t=1;


 DrawFormattedText(w,transitiontext{transition}, 'justifytomax', 100, WhiteIndex(w));
 Screen('Flip',w)
  KbWait;
 

while t<length(trans)
    WaitSecs(waitval);
    
    t1=GetSecs;
t=t+1
newim=f;


%     Randim=make_alpha(f,240,80,8,1);
     
  
    newim(:,:,4)=Randim*trans(t);

    
   
Screen('MakeTexture',w,imresize(im2uint8(newim),0.5));

texalph=Screen('MakeTexture',w,imresize(im2uint8(newim),0.5));
texnalph=Screen('MakeTexture',w,imresize(im2uint8(g),0.5));
Screen('DrawTexture',w,texnalph);
Screen('DrawTexture',w,texalph);
   
Screen('Flip',w)
t2=GetSecs;  
  
end

j=j+1;
  end
    





