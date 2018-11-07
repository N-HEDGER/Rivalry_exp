function [spiral]=Spiral2D(xysize,val)

Boundx=xysize(1)/2;
if length(xysize) == 2
   Boundy=xysize(2);
else
   Boundy=Boundx;
end


[x, y] = meshgrid(-Boundx:1:Boundx-1, -Boundx:1:Boundx-1);
[th, r] = cart2pol(x, y);
spiral = 0.5 + 0.5 .* cos(r / val + th * val);