function data_out=read_clim(fName) 
    
% this is a github test
    data = readtable(fName, ...
        'FileType','text', ...
        'Delimiter','tab');
    
    tt = datetime(num2str(data.Date),'InputFormat','uuuuDDD');
    hrs = hours(data.Time);
    date_time = tt+hrs;
    
    % fixing time 
    data_out = [array2table(date_time), data(:,3:end-1)];

%     fclose(fid);
end
