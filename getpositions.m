function [offsetlistx, offsetlisty] = getpositions(const)

    offsetlistx(1) = randn*const.imagesize/8 + const.imagesize/2;
    offsetlisty(1) = randn*const.imagesize/8 + const.imagesize/2;

    for n = 2:const.nelements
       exitcode = 0;
      while exitcode==0         % check the distance between all gaussians
              offsetlistx(n) = randn*const.imagesize/8 + const.imagesize/2;
              offsetlisty(n) = randn*const.imagesize/8 + const.imagesize/2;

          for m = 1:n-1
            xdiff = offsetlistx(n) - offsetlistx(m);
            ydiff = offsetlisty(n) - offsetlisty(m);
            dist = sqrt(xdiff^2 + ydiff^2);      % distance between points
            if dist>const.passlevel
            passlist(m) = 1;
            else
            passlist(m) = 0;
            end
          end
          if sum(passlist)==length(passlist)
              exitcode = 1;
          end
          
      end
    
    end
end
   