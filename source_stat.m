function [P, Symbol]= source_stat(name)

[fid, message]= fopen(name, 'r');

if fid== -1
    disp(message);
    return;
end
no=10e5;
count= zeros(1,no);

while ~feof(fid)
    
    str= fread(fid,1);
    a= str+1;
    count(a)= count(a)+1;
    
end

num= no;
k= 1;

for i= 1:num
    
    if count(i)
        disp([char(i-1) ' : ' num2str(count(i))]);
        Symbol(k)= char(i-1);
        P(k)= count(i);
        k= k+1;
    end
    
end

P= P/sum(P);

for i= 1:length(P)
    
    disp([Symbol(i) ' : ' num2str(P(i))]);
    
end

fclose(fid);

end

