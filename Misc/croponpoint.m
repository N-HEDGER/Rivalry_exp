function[im2]=croponpoint(im,xval,asp)
x=size(im);
midpoint=[x(1)/2,x(2)/2] 

im2=imcrop(im,[midpoint(1)-xval/2 midpoint(2)-xval*asp/2 xval xval*asp]);
 subplot(1,2,1)
 imshow(im)
 subplot(1,2,2)
 imshow(im2)



