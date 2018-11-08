function timecourse = gettimes(triallength, gamparams, ifi, nelements)

% generate gamma distributions for replay conditions

tframes = 0:ifi:triallength+ifi;      % frames on which stim are displayed

mu = triallength/2;       % create gaussian for smoothing
sigma = 0.4;
gaus = exp(-(tframes-mu).^2./(2.*sigma^2));

for nels = 1:nelements
gamdurs = random('gam', gamparams(1,1), gamparams(1,2), triallength*2, 1);

currentstate = round(rand);   %0 or 1
currenttotal = 0;
counter = 1;

for n = 1:length(tframes)
    if tframes(n)>currenttotal
        currentstate = ~currentstate;
        currenttotal = currenttotal + gamdurs(counter);
        counter = counter + 1;
    end    
    tempcourse(n) = currentstate;
end

tempcourse = conv(tempcourse, gaus);        % smooth the timecourse
tempcourse = tempcourse(1, 1+round(length(tframes)/2):round(length(tframes)*3/2)); % cut out middle portion
timecourse(nels,:) = tempcourse;

clear tempcourse;

end

timecourse = timecourse/max(abs(timecourse(:)));
timecourse = (timecourse*2)-1;  
return % scale between -1 and 1 (for gaussians)
end