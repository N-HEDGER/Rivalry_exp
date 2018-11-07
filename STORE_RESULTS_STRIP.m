
results=horzcat(config.Trialevents.stripmat,config.Trialevents.congresp',config.Trialevents.rt',config.Trialevents.elapsed');

dlmwrite(const.sumfilename,results);

