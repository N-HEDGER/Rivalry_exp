

folder=uigetdir();


filelist = dir([folder filesep '_replay_*.mat']);
files = {filelist.name}';


B=regexp(files,'\d*','Match');

for ii=1:length(B)
    if ~isempty(B{ii})
        Num(ii,1)=str2double(B{ii}(end));
    else
        Num(ii,1)=NaN;
        
    end
end

trial=cell(1,length(files));

for i=1:length(Num)
    trial{Num(i)}=load(strcat(folder,'/',files{i}));
end



for t=1:4

    mkdir(strcat(folder,'/trial_',num2str(Num(t))))
    
fg=trial{Num(t)};
fg2=load(strcat(folder,'/','_replay.mat'));


alphacell=cell(1,length(fg.R.timecourse));

Mi = repmat(1:fg2.config.const.imagesize, fg2.config.const.imagesize, 1);
Mj = rot90(Mi);
 
gausmask = zeros(floor(fg2.config.const.imagesize*fg2.config.const.asp),fg2.config.const.imagesize);

offsetlistx=fg.R.windowlocations(1,:);
offsetlisty=fg.R.windowlocations(2,:);

% Here I recreate the alpha layers that were used. 

for i=1:length(alphacell)
    alphacell{i}=gausmask;
    for g=1:length(fg.R.windowlocations)
        
    alphacell{i} = alphacell{i} + 0.975*fg.R.timecourse(g,i)*exp(-(((Mi-offsetlistx(g)).^2) ./ (2 .* fg2.config.const.gausstd.^2)) - (((Mj-offsetlisty(g)).^2) ./ (2 .* fg2.config.const.gausstd.^2)));

    end
    
   
    
end

composite = im2uint8(fg.R.toplayer);

for i=1:length(alphacell)
    
compositecell{i}=imresize(composite,[fg2.config.const.element_size,fg2.config.const.element_size]);
compositecell{i}(:,:,4) = round(255*(alphacell{i}+1)/2);
end 



% Here I re-create reference images, so that I now how to compare the
% proportions
refgimage=fg.R.toplayer;
refrimage=fg.R.botlayer;

refrimage(:,:,1)=fg.R.toplayer(:,:,1)+fg.R.botlayer(:,:,1);
refrimage(:,:,2)=0;


refgimage(:,:,2)=fg.R.toplayer(:,:,2)+fg.R.botlayer(:,:,2);
refgimage(:,:,1)=0;


Screen('Preference', 'SkipSyncTests', 1);
[scr.main,scr.rect] = Screen('OpenWindow',0,128, [0 0 1920 800] ,[],2);
Screen(scr.main,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


% Now replay this, so you can get what was presented on each frame.

for i=1:length(compositecell)
    
toplayer = Screen('MakeTexture', scr.main, compositecell{i});
bottomlayer = Screen('MakeTexture', scr.main, im2uint8(fg.R.botlayer));

Screen('DrawTexture', scr.main, bottomlayer,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
Screen('DrawTexture', scr.main, toplayer,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);

Screen('Flip',scr.main)
 imagecell{i}=Screen('GetImage',scr.main,[CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
end


refr = Screen('MakeTexture', scr.main, im2uint8(refrimage));

refg = Screen('MakeTexture', scr.main, im2uint8(refgimage));

Screen('DrawTexture', scr.main, refr,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
Screen('Flip',scr.main)
refrim=Screen('GetImage',scr.main,[CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);


Screen('DrawTexture', scr.main, refg,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
Screen('Flip',scr.main)
refgim=Screen('GetImage',scr.main,[CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);


sca


for i=1:length(imagecell)
    
rlev(i)=(mean2(imagecell{i}(:,:,1))/mean2(refrim(:,:,1)))*100;
glev(i)=(mean2(imagecell{i}(:,:,2))/mean2(refgim(:,:,2)))*100;

[rmaxval,Irmaxval] = max(rlev);
[gmaxval,Igmaxval] = max(glev);

end




plot(rlev/max(rlev))
hold on
plot((fg.R.resps==1))
plot(rlev)



j=0;
j2=0;
for i=1:length(fg.R.resps)
    
    if fg.R.resps(i)==1
         j=j+1;
    
    tempim{j}=compositecell{i}(:,:,4);
    tempim2{j}=imagecell{i};
    elseif fg.R.resps(i)==2
          j2=j2+1;
     tempim22{j2}=imagecell{i};
        
    end
   
end


if exist('tempim2')
    for i=1:length(tempim2)
      imwrite(tempim2{i},strcat(folder,'/trial_',num2str(Num(t)),'/gresp_',num2str(i),'.jpg'))  
    end
else
end


if exist('tempim22')
    for i=1:length(tempim22)
      imwrite(tempim22{i},strcat(folder,'/trial_',num2str(Num(t)),'/rresp_',num2str(i),'.jpg'))  
    end
    
else
end
   

% hj=double(tempim{1});
% for j=2:length(tempim)
%     hj=hj+double(tempim{j});
% end
% 
% hj2=normalise(hj);
% 
% 
% 
% for i=1:length(alphacell)
%     
% compositef=imresize(composite,[fg2.config.const.element_size,fg2.config.const.element_size]);
% compositef(:,:,4) = round(255*(hj2));
% end 
% 
% 
% [scr.main,scr.rect] = Screen('OpenWindow',0,128, [0 0 1920 800] ,[],2);
% Screen(scr.main,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
% 
% 
% toplayer = Screen('MakeTexture', scr.main, compositef);
% bottomlayer = Screen('MakeTexture', scr.main, im2uint8(fg.R.botlayer));
% 
% Screen('DrawTexture', scr.main, bottomlayer,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
% Screen('DrawTexture', scr.main, toplayer,[], [CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
% 
% Screen('Flip',scr.main)
% fimage=Screen('GetImage',scr.main,[CenterRect([0 0 round(fg2.config.const.element_size) round(fg2.config.const.element_size*1.27)], scr.rect)]);
% 
% 
% sca
% 
% 
% subplot(1,4,1)
% imagesc(imresize(hj2,[439 345]))
% colormap hot
% subplot(1,4,2)
% imshow(fg.R.botlayer)
% subplot(1,4,3)
% imshow(fg.R.toplayer)
% subplot(1,4,4)
% imshow(fimage)

clear('tempim2','tempim22')
end

% Then apply this to toplayer. 
    