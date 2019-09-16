function table_out = dailySum(table_in)
    
    t=table_in{:,1}; 
    d=table_in{:,2:end}; 
    vNames=table_in.Properties.VariableNames;
    
    t1=t(1); 
    tn=t(end);
    
    % strip only dates from vector
    tD=datetime(t.Year, t.Month, t.Day);
    
    tOut=t1:days(1):tn;
    
    d_init=nan(size(d));
    t_init=NaT(size(t)); 
    table_out=[table(t_init), array2table(d_init)];
    table_out.Properties.VariableNames=vNames;
    
    for i=1:numel(tOut)
        ii=tD==tOut(i); 
        table_out{i,1}=tOut(i); 
        table_out{i,2:end}=nansum(d(ii)); 
    end
end
