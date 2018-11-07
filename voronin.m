
ST.voronoisize=400;

[scr.main,scr.rect] = Screen('OpenWindow',0,[128 128 128], [], [],2);



width=1920;
height=1080;

    rect = [1 1 ST.voronoisize ST.voronoisize*1.27];
    rect = CenterRectOnPoint(rect, width/2, height/2);
    
x=(rand(4500,2)-0.5)*2; 
[v,c]=voronoin(x);

v(:,1) = (width/2)+(v(:,1) * (width/2));
v(:,2) = (height/2)+(v(:,2) * (height/2));

for i = 1:length(c) 
if all(c{i}~=1)   % If at least one of the indices is 1, 
                  % then it is an open region and we can't 
                  % patch that.
% patch(v(c{i},1),v(c{i},2),i); % use color i.

colourlist = (randi([1,100])/100)*255;


pointlist = [v(c{i},1) v(c{i},2)];
pointlist(:,1) = max(pointlist(:,1),rect(1));
pointlist(:,2) = max(pointlist(:,2),rect(2));
pointlist(:,1) = min(pointlist(:,1),rect(3));
pointlist(:,2) = min(pointlist(:,2),rect(4));

Screen('FillPoly', scr.main, [colourlist colourlist colourlist], pointlist);


% pointlist(:,1) = pointlist(:,1) + width/2;
% Screen('FillPoly', w, colourlist, pointlist);
end
end
Screen('Flip',scr.main)

vtex=Screen('GetImage',scr.main,[CenterRect([0 0 round(ST.voronoisize) round(ST.voronoisize*1.27)], scr.rect)]);

 
KbWait


sca

