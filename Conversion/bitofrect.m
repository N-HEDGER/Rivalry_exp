function [newrect]=bitofrect(rect,side,prop)


propbit=floor((rect(3)-rect(1))*prop);

if side==1
    
    newrect=rect;
    
    newrect(3)=newrect(1)+propbit;
    
elseif side==2
    newrect=rect;
    newrect(1)=newrect(3)-propbit;
    
end

    
    
    

