% Instructions
% Press z to zoom in
% Press x to zoom out
% Press up down, left and right to change the centre of the image.
% Images are saved in '/scaledims'



% addpath('ims');

p = which('diffrace1.jpg');
filelist = dir([fileparts(p) filesep 'diff*']);
images = {filelist.name}';
nimages=length(images);

p2 = which('nu1.jpg');
filelist2 = dir([fileparts(p2) filesep 'nu*']);
images2 = {filelist2.name}';
nimages2=length(images2);



KbName('UnifyKeyNames');                 
my_key.space    =   KbName('Space');
my_key.left    =   KbName('LeftArrow');
my_key.right    =   KbName('RightArrow');
my_key.up    =   KbName('UpArrow');
my_key.down    =   KbName('DownArrow');
my_key.z    =   KbName('z');
my_key.x    =   KbName('x');



mkdir('scaledims');

for i=1:nimages
    
kik=imread(images2{i});
kik=imresize(kik,[439 345]);

k=imread(images{i});
sizek=size(k);

    
isdone=0;

inc=100; 
inc2=floor(sizek(1)/2);
inc3=floor(sizek(2)/2);
 k2=croponpoint(k,[inc3,inc2],inc,1.27);
 k2=imresize(k2,[439 345]);
 imshow(imfuse(k2,kik,'falsecolor'));
 
 drawnow
[KeyIsDown,secs,keyCode]=KbCheck;
    while isdone==0
        [KeyisDown,secs,keyCode]=KbCheck;
   
    
    if keyCode(my_key.z)==1;
    inc=inc-2;
   k2=croponpoint(k,[inc3,inc2],inc,1.27);
    k2=imresize(k2,[439 345]);
    imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
    elseif keyCode(my_key.x)==1;
          inc=inc+2;
    k2=croponpoint(k,[inc3,inc2],inc,1.27);
     k2=imresize(k2,[439 345]);
    imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
      elseif keyCode(my_key.up)==1;
          inc2=inc2-2;
    k2=croponpoint(k,[inc3,inc2],inc,1.27);
     k2=imresize(k2,[439 345]);
      imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
         elseif keyCode(my_key.down)==1;
          inc2=inc2+2;
    k2=croponpoint(k,[inc3,inc2],inc,1.27);
     k2=imresize(k2,[439 345]);
      imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
    
          elseif keyCode(my_key.left)==1;
          inc3=inc3-2;
    k2=croponpoint(k,[inc3,inc2],inc,1.27);
     k2=imresize(k2,[439 345]);
      imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
         elseif keyCode(my_key.right)==1;
          inc3=inc3+2;
    k2=croponpoint(k,[inc3,inc2],inc,1.27);
     k2=imresize(k2,[439 345]);
      imshow(imfuse(k2,kik,'falsecolor'));
    drawnow
    
    
    
    elseif keyCode(my_key.space)==1;
        isdone=1
    end
    end
    close
    imwrite(k2,strcat('scaledims/',images{i}));
    
    
end
    