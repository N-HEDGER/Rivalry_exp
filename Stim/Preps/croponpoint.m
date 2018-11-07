function[im2]=croponpoint(im,midpoint,xval,asp)

im2=imcrop(im,[midpoint(1)-xval/2 midpoint(2)-xval*asp/2 xval xval*asp]);
subplot(1,3,1)
imshow(im)
subplot(1,3,2)
imshow(im2)

subplot(1,3,3)





