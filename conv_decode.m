function decoded = conv_decode(md)

N= length(md)/3;
path_metric= zeros(4,N+1);
path_metric(2:4,1)= inf;

rcv= reshape(md, 3,N)';

for j= 1:N
    path_metric( :,j+1)= Path_Metric( path_metric( :,j), rcv(j,: ) );
end

decoded= [ ];
[~,ind]= min(path_metric(:,end));

for i= N:-1:1
    
    if ind==1
        decoded= [decoded 0];
        
        if path_metric(1,i)+ sum(abs(rcv(i,: )- [0 0 0]))> path_metric(2,i)+ sum(abs(rcv(i,: )- [0 1 1]))
            prev_ind= 2;
        else
            prev_ind= 1;
        end
        
    elseif ind==2
        decoded= [decoded 0];
        
        if path_metric(3,i)+ sum(abs(rcv(i,: )- [0 0 1]))> path_metric(4,i)+ sum(abs(rcv(i,: )- [0 1 0]))
            prev_ind= 4;
        else
            prev_ind= 3;
        end
        
    elseif ind==3
        
        decoded= [decoded 1];
        
        if path_metric(1,i)+ sum(abs(rcv(i,: )- [1 1 1]))> path_metric(2,i)+ sum(abs(rcv(i,: )- [1 0 0]))
            prev_ind= 2;
        else
            prev_ind= 1;
        end
        
    else
        decoded= [decoded 1];
        
        if path_metric(3,i)+ sum(abs(rcv(i,: )- [1 1 0]))> path_metric(4,i)+ sum(abs(rcv(i,: )- [1 0 1]))
            prev_ind= 4;
        else
            prev_ind= 3;
        end
        
    end
    
    ind= prev_ind;
    
end

decoded= fliplr(decoded);

end




