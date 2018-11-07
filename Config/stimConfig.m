function [Stim]=stimConfig(const,scr,Trialevents)


if exist(const.prefilename)
    load(const.prefilename)

    pretestval=mean(luminance);
    
else
   pretestval=0.49; 
end


PSF = fspecial('gaussian',70,20);
kl=Spiral2D(floor(const.element_size),5);
kl2=Sinusoid2D(floor(const.element_size),90,16,0);

klf=fliplr(kl);

centrestim=croponpoint(klf,const.element_size*const.diff,1);
centrestimf=croponpoint(klf,const.element_size*const.diff,1);

Stim.Ltexm=Screen('MakeTexture',scr.main,im2uint8(centrestim));
Stim.Rtexm=Screen('MakeTexture',scr.main,im2uint8(centrestimf));


Stim.Ltex=Screen('MakeTexture',scr.main,im2uint8(kl));
Stim.Rtex=Screen('MakeTexture',scr.main,im2uint8(klf));


initcell=cell(2,1);

initcell{1}=im2uint8(kl);
initcell{2}=im2uint8(kl2);

matchedcell=lumMatch(initcell);



Stim.imcellL=cell(2,2);
Stim.imcellR=cell(2,2);

[Stim.imcellL{1,1},Stim.imcellR{1,1}]=PATCHWORK(matchedcell{1},matchedcell{2},30,10,1,1,1,0,1,pretestval);
[Stim.imcellL{1,2},Stim.imcellR{1,2}]=PATCHWORK(matchedcell{2},matchedcell{1},30,10,1,1,1,0,1,pretestval);
[Stim.imcellL{2,1},Stim.imcellR{2,1}]=PATCHWORK(matchedcell{1},matchedcell{2},30,10,1,2,1,0,1,pretestval);
[Stim.imcellL{2,2},Stim.imcellR{2,2}]=PATCHWORK(matchedcell{2},matchedcell{1},30,10,1,2,1,0,1,pretestval);


Stim.Frame=im2uint8(imread('voronoi.jpg'));


Graytex=im2uint8(repmat(0.5,round(const.element_size*const.asp),const.element_size));




for i=1:2
    for j=1:2
Stim.imcellLtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellL{i,j}));
Stim.imcellRtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellR{i,j}));
    end
end



filelist = dir(['Stim/' filesep 'HouseNew*.jpg']);
fileshouse = {filelist.name}';
filelist = dir(['Stim/' filesep 'nu*.jpg']);
filesface = {filelist.name}';

facecell=cell(1,length(filesface));
housecell=cell(1,length(fileshouse));

for i=1:length(fileshouse)
    Stim.imcell{1,i}=imread(filesface{i});
    Stim.imcell{2,i}=rgb2gray(imread(fileshouse{i}));
end

dims=size(Stim.imcell);
Stim.imcell2=reshape(Stim.imcell,1,dims(1)*dims(2));

for i=1:length(Stim.imcell2)
    Stim.imcell2{i}=edgetaper(Stim.imcell2{i},PSF);
end

Stim.imcell3=lumMatch(Stim.imcell2);
matchedcell=reshape(Stim.imcell3,dims(1),dims(2));

PSF = fspecial('gaussian',90,30);




    
    

Stim.imcellL2=cell(8,2,2);
Stim.imcellR2=cell(8,2,2);


%% Make patchworks

[Stim.imcell0LM1{1,1},Stim.imcell0RM1{1,1}]=PATCHWORK(matchedcell{1,1},matchedcell{2,1},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM1{1,2},Stim.imcell0RM1{1,2}]=PATCHWORK(matchedcell{2,1},matchedcell{1,1},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM1{2,1},Stim.imcell0RM1{2,1}]=PATCHWORK(matchedcell{1,1},matchedcell{2,1},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM1{2,2},Stim.imcell0RM1{2,2}]=PATCHWORK(matchedcell{2,1},matchedcell{1,1},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM2{1,1},Stim.imcell0RM2{1,1}]=PATCHWORK(matchedcell{1,2},matchedcell{2,2},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM2{1,2},Stim.imcell0RM2{1,2}]=PATCHWORK(matchedcell{2,2},matchedcell{1,2},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM2{2,1},Stim.imcell0RM2{2,1}]=PATCHWORK(matchedcell{1,2},matchedcell{2,2},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM2{2,2},Stim.imcell0RM2{2,2}]=PATCHWORK(matchedcell{2,2},matchedcell{1,2},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM3{1,1},Stim.imcell0RM3{1,1}]=PATCHWORK(matchedcell{1,3},matchedcell{2,3},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM3{1,2},Stim.imcell0RM3{1,2}]=PATCHWORK(matchedcell{2,3},matchedcell{1,3},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM3{2,1},Stim.imcell0RM3{2,1}]=PATCHWORK(matchedcell{1,3},matchedcell{2,3},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM3{2,2},Stim.imcell0RM3{2,2}]=PATCHWORK(matchedcell{2,3},matchedcell{1,3},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM4{1,1},Stim.imcell0RM4{1,1}]=PATCHWORK(matchedcell{1,4},matchedcell{2,4},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM4{1,2},Stim.imcell0RM4{1,2}]=PATCHWORK(matchedcell{2,4},matchedcell{1,4},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM4{2,1},Stim.imcell0RM4{2,1}]=PATCHWORK(matchedcell{1,4},matchedcell{2,4},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM4{2,2},Stim.imcell0RM4{2,2}]=PATCHWORK(matchedcell{2,4},matchedcell{1,4},30,10,1,2,1,0,1,pretestval);


[Stim.imcell0LM5{1,1},Stim.imcell0RM5{1,1}]=PATCHWORK(matchedcell{1,5},matchedcell{2,5},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM5{1,2},Stim.imcell0RM5{1,2}]=PATCHWORK(matchedcell{2,5},matchedcell{1,5},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM5{2,1},Stim.imcell0RM5{2,1}]=PATCHWORK(matchedcell{1,5},matchedcell{2,5},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM5{2,2},Stim.imcell0RM5{2,2}]=PATCHWORK(matchedcell{2,5},matchedcell{1,5},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM6{1,1},Stim.imcell0RM6{1,1}]=PATCHWORK(matchedcell{1,6},matchedcell{2,6},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM6{1,2},Stim.imcell0RM6{1,2}]=PATCHWORK(matchedcell{2,6},matchedcell{1,6},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM6{2,1},Stim.imcell0RM6{2,1}]=PATCHWORK(matchedcell{1,6},matchedcell{2,6},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM6{2,2},Stim.imcell0RM6{2,2}]=PATCHWORK(matchedcell{2,6},matchedcell{1,6},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM7{1,1},Stim.imcell0RM7{1,1}]=PATCHWORK(matchedcell{1,7},matchedcell{2,7},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM7{1,2},Stim.imcell0RM7{1,2}]=PATCHWORK(matchedcell{2,7},matchedcell{1,7},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM7{2,1},Stim.imcell0RM7{2,1}]=PATCHWORK(matchedcell{1,7},matchedcell{2,7},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM7{2,2},Stim.imcell0RM7{2,2}]=PATCHWORK(matchedcell{2,7},matchedcell{1,7},30,10,1,2,1,0,1,pretestval);

[Stim.imcell0LM8{1,1},Stim.imcell0RM8{1,1}]=PATCHWORK(matchedcell{1,8},matchedcell{2,8},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM8{1,2},Stim.imcell0RM8{1,2}]=PATCHWORK(matchedcell{2,8},matchedcell{1,8},30,10,1,1,1,0,1,pretestval);
[Stim.imcell0LM8{2,1},Stim.imcell0RM8{2,1}]=PATCHWORK(matchedcell{1,8},matchedcell{2,8},30,10,1,2,1,0,1,pretestval);
[Stim.imcell0LM8{2,2},Stim.imcell0RM8{2,2}]=PATCHWORK(matchedcell{2,8},matchedcell{1,8},30,10,1,2,1,0,1,pretestval);



% for i=1:2
%     for j=1:2
% Stim.imcellLM1tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM1{i,j}));
% Stim.imcellRM1tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM1{i,j}));
% Stim.imcellLM2tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM2{i,j}));
% Stim.imcellRM2tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM2{i,j}));
% Stim.imcellLM3tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM3{i,j}));
% Stim.imcellRM3tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM3{i,j}));
% Stim.imcellLM4tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM4{i,j}));
% Stim.imcellRM4tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM4{i,j}));
% 
% Stim.imcellLM5tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM5{i,j}));
% Stim.imcellRM5tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM5{i,j}));
% Stim.imcellLM6tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM6{i,j}));
% Stim.imcellRM6tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM6{i,j}));
% Stim.imcellLM7tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM7{i,j}));
% Stim.imcellRM7tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM7{i,j}));
% Stim.imcellLM8tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0LM8{i,j}));
% Stim.imcellRM8tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcell0RM8{i,j}));
% 
%     end
% end


    Stim.congcellL=cell(2,4);
    Stim.incongcellL=cell(2,4);
    Stim.congcellR=cell(2,4);
    Stim.incongcellR=cell(2,4);
    
    
    Stim.congcellLv=cell(2,4);
    Stim.incongcellLv=cell(2,4);
    Stim.congcellRv=cell(2,4);
    Stim.incongcellRv=cell(2,4);


for i=1:4; 
    
    [Stim.congcellL{1,i}, x]=PATCHWORK(matchedcell{1,i},matchedcell{1,i},30,10,1,1,1,1,1,pretestval);
    [Stim.incongcellL{1,i},x]=PATCHWORK(matchedcell{1,i},matchedcell{1,i+4},30,10,1,1,1,1,1,pretestval);
    [x, Stim.congcellR{1,i}]=PATCHWORK(matchedcell{1,i},matchedcell{1,i},30,10,1,1,1,1,1,pretestval);
    [x, Stim.incongcellR{1,i}]=PATCHWORK(matchedcell{1,i+4},matchedcell{1,i},30,10,1,1,1,1,1,pretestval);
    
    [Stim.congcellL{2,i}, x]=PATCHWORK(matchedcell{2,i},matchedcell{2,i},30,10,1,1,1,1,1,pretestval);
    [Stim.incongcellL{2,i}, x]=PATCHWORK(matchedcell{2,i},matchedcell{2,i+4},30,10,1,1,1,1,1,pretestval);
    [x, Stim.congcellR{2,i}]=PATCHWORK(matchedcell{2,i},matchedcell{2,i},30,10,1,1,1,1,1,pretestval);
    [x, Stim.incongcellR{2,i}]=PATCHWORK(matchedcell{2,i+4},matchedcell{2,i},30,10,1,1,1,1,1,pretestval);
    
end


for i=1:4; 
    
    [Stim.congcellLv{1,i}, x]=PATCHWORK(matchedcell{1,i},matchedcell{1,i},30,10,1,2,1,1,1,pretestval);
    [Stim.incongcellLv{1,i},x]=PATCHWORK(matchedcell{1,i},matchedcell{1,i+4},30,10,1,2,1,1,1,pretestval);
    [x, Stim.congcellRv{1,i}]=PATCHWORK(matchedcell{1,i},matchedcell{1,i},30,10,1,2,1,1,1,pretestval);
    [x, Stim.incongcellRv{1,i}]=PATCHWORK(matchedcell{1,i+4},matchedcell{1,i},30,10,1,2,1,1,1,pretestval);
    
    [Stim.congcellLv{2,i}, x]=PATCHWORK(matchedcell{2,i},matchedcell{2,i},30,10,1,2,1,1,1,pretestval);
    [Stim.incongcellLv{2,i}, x]=PATCHWORK(matchedcell{2,i},matchedcell{2,i+4},30,10,1,2,1,1,1,pretestval);
    [x, Stim.congcellRv{2,i}]=PATCHWORK(matchedcell{2,i},matchedcell{2,i},30,10,1,2,1,1,1,pretestval);
    [x, Stim.incongcellRv{2,i}]=PATCHWORK(matchedcell{2,i+4},matchedcell{2,i},30,10,1,2,1,1,1,pretestval);
    
end






for i=1:2
    for j=1:4
Stim.congcellLtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.congcellL{i,j}));
Stim.incongcellLtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.incongcellL{i,j}));
Stim.congcellRtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.congcellR{i,j}));
Stim.incongcellRtex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.incongcellR{i,j}));
    end 
end





filelist = dir(['Stim/' filesep 'Sc_house*.jpg']);
fileshouse = {filelist.name}';
filelist = dir(['Stim/' filesep 'Sc_face*.jpg']);
filesface = {filelist.name}';

facecell=cell(1,length(filesface));
housecell=cell(1,length(fileshouse));

for i=1:length(fileshouse)
    Stim.imcell{1,i}=imread(filesface{i});
    Stim.imcell{2,i}=imread(fileshouse{i});
end

dims=size(Stim.imcell);
Stim.imcell2=reshape(Stim.imcell,1,dims(1)*dims(2));
for i=1:length(Stim.imcell2)
    Stim.imcell2{i}=edgetaper(Stim.imcell2{i},PSF);
end


Stim.imcell3=lumMatch(Stim.imcell2);
matchedcell=reshape(Stim.imcell3,dims(1),dims(2));

for i=1:length(matchedcell)
    matchedcell{i}=edgetaper(matchedcell{i},PSF);
end


Stim.imcellL2=cell(4,2,2);
Stim.imcellR2=cell(4,2,2);

for i = 1:length(fileshouse)

    
[Stim.imcellLM1{1,1},Stim.imcellRM1{1,1}]=PATCHWORK(matchedcell{1,1},matchedcell{2,1},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM1{1,2},Stim.imcellRM1{1,2}]=PATCHWORK(matchedcell{2,1},matchedcell{1,1},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM1{2,1},Stim.imcellRM1{2,1}]=PATCHWORK(matchedcell{1,1},matchedcell{2,1},30,10,1,2,1,0,1,pretestval);
[Stim.imcellLM1{2,2},Stim.imcellRM1{2,2}]=PATCHWORK(matchedcell{2,1},matchedcell{1,1},30,10,1,2,1,0,1,pretestval);

[Stim.imcellLM2{1,1},Stim.imcellRM2{1,1}]=PATCHWORK(matchedcell{1,2},matchedcell{2,2},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM2{1,2},Stim.imcellRM2{1,2}]=PATCHWORK(matchedcell{2,2},matchedcell{1,2},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM2{2,1},Stim.imcellRM2{2,1}]=PATCHWORK(matchedcell{1,2},matchedcell{2,2},30,10,1,2,1,0,1,pretestval);
[Stim.imcellLM2{2,2},Stim.imcellRM2{2,2}]=PATCHWORK(matchedcell{2,2},matchedcell{1,2},30,10,1,2,1,0,1,pretestval);

[Stim.imcellLM3{1,1},Stim.imcellRM3{1,1}]=PATCHWORK(matchedcell{1,3},matchedcell{2,3},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM3{1,2},Stim.imcellRM3{1,2}]=PATCHWORK(matchedcell{2,3},matchedcell{1,3},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM3{2,1},Stim.imcellRM3{2,1}]=PATCHWORK(matchedcell{1,3},matchedcell{2,3},30,10,1,2,1,0,1,pretestval);
[Stim.imcellLM3{2,2},Stim.imcellRM3{2,2}]=PATCHWORK(matchedcell{2,3},matchedcell{1,3},30,10,1,2,1,0,1,pretestval);

[Stim.imcellLM4{1,1},Stim.imcellRM4{1,1}]=PATCHWORK(matchedcell{1,4},matchedcell{2,4},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM4{1,2},Stim.imcellRM4{1,2}]=PATCHWORK(matchedcell{2,3},matchedcell{1,4},30,10,1,1,1,0,1,pretestval);
[Stim.imcellLM4{2,1},Stim.imcellRM4{2,1}]=PATCHWORK(matchedcell{1,4},matchedcell{2,4},30,10,1,2,1,0,1,pretestval);
[Stim.imcellLM4{2,2},Stim.imcellRM4{2,2}]=PATCHWORK(matchedcell{2,4},matchedcell{1,4},30,10,1,2,1,0,1,pretestval);



end





% for i=1:2
%     for j=1:2
% Stim.imcellLS1tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM1{i,j}));
% Stim.imcellRS1tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM1{i,j}));
% Stim.imcellLS2tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM2{i,j}));
% Stim.imcellRS2tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM2{i,j}));
% Stim.imcellLS3tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM3{i,j}));
% Stim.imcellRS3tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM3{i,j}));
% Stim.imcellLS4tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellLM4{i,j}));
% Stim.imcellRS4tex{i,j}=Screen('MakeTexture',scr.main,im2uint8(Stim.imcellRM4{i,j}));
%     end 
% end


instructscreen=imread('Instruction_riv.bmp');
instructim=imread('buttonmap.bmp');

Stim.instructim=imresize(instructim,[const.element_size NaN]);


Stim.instructscreen=Screen('MakeTexture',scr.main,instructscreen);

% Stim.instructim=Screen('MakeTexture',scr.main,instructim);





end

