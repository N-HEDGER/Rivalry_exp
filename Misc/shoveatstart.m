function [newmat]=shoveatstart(mat,val)

vect=repmat(val,length(mat),1);
newmat=horzcat(vect,mat);
end
