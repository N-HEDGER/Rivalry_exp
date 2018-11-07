function [alpha]=stripalpha(im,gaussize,gaussSD,idx,orient);


v=size(im);
Mask=repmat(0,v(1),v(2));


Gfilt=Gausenv(gaussize,gaussSD,gaussSD);
Randim=filter2(Gfilt,Mask,'same');


if orient==1
Mask(:,idx)=1;

else

Mask(idx,:)=1;
end

alpha=filter2(Gfilt,Mask,'same');

end











