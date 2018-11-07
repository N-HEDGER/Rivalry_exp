function [Stim]=stimConfig_surround(const,scr)


kl=Spiral2D(floor(const.element_size),5);


klf=fliplr(kl);


centrestim=croponpoint(kl,const.element_size/2,1);
centrestimf=croponpoint(klf,const.element_size/2,1);


centrecell{1,1}=gray2rgb(centrestim);
centrecell{1,2}=gray2rgb(centrestim);

centrecell{2,1}=gray2rgb(centrestimf);
centrecell{2,2}=gray2rgb(centrestimf);

centrecell{1,1}(:,:,2)=0;
centrecell{1,1}(:,:,3)=0;
centrecell{1,2}(:,:,1)=0;
centrecell{1,2}(:,:,3)=0;
centrecell{2,1}(:,:,2)=0;
centrecell{2,1}(:,:,3)=0;
centrecell{2,2}(:,:,1)=0;
centrecell{2,2}(:,:,3)=0;


surroundcell{1}=kl;
surroundcell{2}=klf;



for i=1:2
    for j=1:2
Stim.centrecelltex{j,i}=Screen('MakeTexture',scr.main,im2uint8(centrecell{i,j}));
Stim.surroundcelltex{i}=Screen('MakeTexture',scr.main,im2uint8(surroundcell{i}));
    end
end

Frame=im2uint8(randn(round(const.element_size*const.asp)+const.framewidth,const.element_size+const.framewidth));


Graytex=im2uint8(repmat(0.5,round(const.element_size*const.asp),const.element_size));

Stim.Frametex=Screen('MakeTexture',scr.main,Frame);

Stim.Graytex=Screen('MakeTexture',scr.main,Frame);




end

