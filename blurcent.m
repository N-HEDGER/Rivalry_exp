function [blurredim] = blurcent (origim,width,sd,isplot,or)

im=origim;
val=floor(width/2);
sizer=size(im);



if or==1
midpoint=floor(sizer(2)/2);
% im(:,(midpoint-val):(midpoint+val),:)=imgaussfilt(im(:,(midpoint-val):(midpoint+val),:),sd,'FilterDomain','spatial');
im((midpoint-val):(midpoint+val),:,:)=im((midpoint-val):(midpoint+val),:,:);

else
midpoint=floor(sizer(1)/2);
% im((midpoint-val):(midpoint+val),:,:)=imgaussfilt(im((midpoint-val):(midpoint+val),:,:),sd,'FilterDomain','spatial');

im((midpoint-val):(midpoint+val),:,:)=im((midpoint-val):(midpoint+val),:,:);

end

blurredim=im;
if isplot
  subplot(1,2,1)
  imshow(origim)
  subplot(1,2,2)
  imshow(blurredim)
  
    
else
    
    
end


end