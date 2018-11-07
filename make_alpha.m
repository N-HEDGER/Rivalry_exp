function [alpha]=make_alpha(im,gaussize,gaussSD,Nbubbles,transitiontype,isplot);

v=size(im);

Mask=repmat(0,v(1),v(2));
Gfilt=Gausenv(gaussize,gaussSD,gaussSD);
Randim=filter2(Gfilt,Mask,'same');

Mask=repmat(0,v(1),v(2));


if transitiontype==1

    img2=im(:,:,2);
    
[row,column]=ind2sub(size(img2),find(img2>0));

if max(column)<(v(2)/2);
%         for i=1:Nbubbles
%         
%         Mask(randi(v(1)),randi([1, floor(v(2)/2)]))=1;
%         end


 Mask(:,1:floor(v(2)/2))=1;

        
        [row,column]=ind2sub(size(Mask),find(Mask==1));
alpha=filter2(Gfilt,Mask,'same');
alpha(alpha>1)=1;

alpha(:,floor(v(2)/2):v(2))=0;

else
   
    
%         for i=1:Nbubbles
%         
%         Mask(randi(v(1)),randi([floor(v(2)/2), floor(v(2))]))=1;
%         end

Mask(:,floor(v(2)/2):floor(v(2)))=1;
    
[row,column]=ind2sub(size(Mask),find(Mask==1));
alpha=filter2(Gfilt,Mask,'same');
alpha(alpha>1)=1;

alpha(:,1:floor(v(2)/2))=0;
    
end
    
   
    

    
elseif transitiontype==2
   
        img2=im(:,:,2);
    
[row,column]=ind2sub(size(img2),find(img2>0));
    if max(column)<(v(2)/2);
%           for i=1:Nbubbles
%         
%         Mask(randi(v(1)),randi([floor(v(2)/2), floor(v(2))]))=1;
%           end

Mask(:,floor(v(2)/2): floor(v(2)))=1;

          
          [row,column]=ind2sub(size(Mask),find(Mask==1));
alpha=filter2(Gfilt,Mask,'same');
alpha(alpha>1)=1;
alpha(:,1:floor(v(2)/2))=0;
        
  
else
     
    
%     for i=1:Nbubbles
%         
%         Mask(randi(v(1)),randi([1, floor(v(2)/2)]))=1;
%     end


Mask(:,1:floor(v(2)/2))=1;
    
    [row,column]=ind2sub(size(Mask),find(Mask==1));
alpha=filter2(Gfilt,Mask,'same');
alpha(alpha>1)=1;
    alpha(:,floor(v(2)/2):v(2))=0;
      
    
end
    
  

    
elseif transitiontype==3
    
    for i=1:Nbubbles
    
    Mask=repmat(1,v(1),v(2));
    end
    
    
    [row,column]=ind2sub(size(Mask),find(Mask==1));
    alpha=filter2(Gfilt,Mask,'same');
    alpha(alpha>1)=1;
    
    
elseif transitiontype==4;



for i=1:Nbubbles
    
    Mask(randi(v(1)),randi(floor(v(2))))=1;
end

[row,column]=ind2sub(size(Mask),find(Mask==1));
alpha=filter2(Gfilt,Mask,'same');
alpha(alpha>1)=1;

end

% [row,column]=ind2sub(size(Mask),find(Mask==1));
% alpha=filter2(Gfilt,Mask,'same');
% alpha(alpha>1)=1;


% if isplot
% subplot(1,2,1)
% imshow(im);
% subplot(1,2,2)
% imshow(alpha);
% else

end


