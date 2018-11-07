function [hybrid1,hybrid2] = PATCHWORK (im,im2,gaussize,gaussSD,halffield,orient,colcong,blur,taper,pretestval)


im=imadjust(im,stretchlim(im),[]);
im=im2double(im);

im2=imadjust(im2,stretchlim(im2),[]);
im2=im2double(im2);


v=size(im);
% create mask of the same size
Mask=repmat(0,v(1),v(2));
% create gaussian envelope of size and sd specified.


Gfilt=Gausenv(gaussize,gaussSD,gaussSD);

Nbubbles=1;

Randim=filter2(Gfilt,Mask,'same');

dims=size(Randim);
if halffield
    if orient ==1
    Randim(:,1:floor(dims(2)/2))=1;
    elseif orient ==2
    Randim(1:floor(dims(1)/2),:)=1;
    end
    

else



while (sum(Randim(:)>0.5)) < numel(Randim)/2
    
Nbubbles=Nbubbles+1;
 for i=1:Nbubbles
    
   
    Mask(randi(v(1)),randi(floor(v(2)/2)))=1;
 end
 
[row,column]=ind2sub(size(Mask),find(Mask==1));
Randim=filter2(Gfilt,Mask,'same');
Randim(Randim>1)=1;

end



figure
imshow(Randim)
drawnow()
    
end

Randim2=imcomplement(Randim);
[x,y]=meshgrid([1:(v(1)+1)],[1:(v(2)+1)]);

% subplot(1,4,1)
% imshow(im);
varargout=5;




ima=gray2rgb(im)*pretestval;
ima(:,:,1)=0;
ima(:,:,3)=0;
imb=gray2rgb(im2);
imb(:,:,2)=0;
imb(:,:,3)=0;

 
imc=gray2rgb(im);
imc(:,:,2)=0;
imc(:,:,3)=0;
imd=gray2rgb(im2)*pretestval;
imd(:,:,1)=0;
imd(:,:,3)=0;

 
 % Randim left
 % Randim2 right
 
 % ima image 1 green.
 % imb image 2 red.
 % imc image 1 red.
 % imb image 2 green.
 
 
if colcong
bubim=ima.*(gray2rgb(Randim));
bubim2=imb.*(gray2rgb(Randim2));

bubim3=imb.*(gray2rgb(Randim));
bubim4=ima.*(gray2rgb(Randim2));

else
    bubim=ima.*(gray2rgb(Randim));
    bubim2=imb.*(gray2rgb(Randim2));
    
    bubim3=imc.*(gray2rgb(Randim));
    bubim4=imd.*(gray2rgb(Randim2));
    
end

hybrid1=(bubim+bubim2);
%imshow(bubim3)

hybrid2=(bubim3+bubim4);


if blur && orient ==1
    hybrid1=blurcent(hybrid1,40,12,0,1);
     hybrid2=blurcent(hybrid2,40,12,0,1);
elseif blur && orient ==2    
    hybrid1=blurcent(hybrid1,35,40,0,2);
    hybrid2=blurcent(hybrid2,35,40,0,2);
end


if taper
    
% PSF = fspecial('gaussian',90,30);
% 
%     hybrid1=edgetaper(hybrid1,PSF);
%     
%     hybrid2=edgetaper(hybrid2,PSF);
%     
else
    
end


% figure
subplot(1,2,1)
imshow(hybrid1)
subplot(1,2,2)
imshow(hybrid2)


