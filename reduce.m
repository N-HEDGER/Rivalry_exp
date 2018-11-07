NAME={'VALEP'};
suffix='.mat';

for N=1:length(NAME)
    FILE=strcat(NAME(N),suffix);

load(char(FILE));

for i =1:length(config.Trialevents.vec)
    veclength=length(config.Trialevents.vec{1,i});
    
    trialcell{i,1}=repmat(N,veclength,1);
    trialcell{i,2}=repmat(config.Trialevents.trialmat(i,1),veclength,1);
    trialcell{i,3}=repmat(config.Trialevents.trialmat(i,2),veclength,1);
    trialcell{i,4}=repmat(config.Trialevents.trialmat(i,3),veclength,1);
    trialcell{i,5}=repmat(config.Trialevents.trialmat(i,4),veclength,1);
    trialcell{i,6}=repmat(config.Trialevents.trialmat(i,5),veclength,1);
    trialcell{i,7}=config.Trialevents.vec{1,i};
    trialcell{i,8}=config.Trialevents.vec{2,i};
    
end


BOYE=cell2mat(trialcell);

dlmwrite(char(strcat(NAME(N),'_sum.txt')),BOYE);

end

mkdir(strcat(NAME{1},'_ims'))

for i =1:length(config.Trialevents.imagecell)
   imwrite(imcrop(config.Trialevents.imagecell{i},[100 298 1000 271]),strcat(NAME{1},'_ims','/','Trial_',num2str(i),'.png'))
    
end


