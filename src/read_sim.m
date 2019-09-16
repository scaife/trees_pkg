function data_out=read_sim(fName) 

    % fixing time 
    fid = fopen(fName);
    d = textscan(fid, '%s %*[^\n]','HeaderLines',1);
    t1 = d{1,1};
    t2 = datetime(t1,'InputFormat','u:D:H:mm');
    iT2 = isnat(t2); 
    mins = minute(t2);
    t3 = t2 - minutes(mins); 
    time = t3 + minutes(mins/100*60);
    
    % BUG: last day of year, turns to NaT
    ii = isnat(time); 
    yrs_t1 = unique(year(time(~ii)));
    hrs_t1 = 0:0.5:23.5;
    hrs_t2 = repmat(hrs_t1',numel(yrs_t1),1);
    hrs = hours(hrs_t2); 
    
    yrs_t2 = repmat(yrs_t1',48,1);
    yrs = reshape(yrs_t2,numel(yrs_t2),1);
    dt = datetime(yrs,12,31)+hrs; 
    
    time(ii) = dt; 
    
    data_out = readtable(fName, ...
        'FileType','text', ...
        'Delimiter','tab');
    data_out = data_out(:,1:end-1); 
    
    data_out.ti = time;
    fclose(fid);
end
