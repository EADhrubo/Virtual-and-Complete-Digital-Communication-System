function [code,b]= huffman_code(P , Symbol)

N=length(P);
X=zeros(N,N);
prob=zeros(N,N);
code=cell(1,N);
prob(:,1)=P;
X(:,1)=1:N;

for i=2:N
    temp=P;
    min1=min(temp);
    for u=1:N
        if temp(u)==min1
            min1=u;
            break;
        end
        
    end
    temp(min1)=100;
    min2=min(temp);
    for u=1:N
        if temp(u)==min2
            min2=u;
            break;
        end
        
    end
    P(min1)=P(min1)+P(min2);
    P(min2)=100;
    
    prob(:,i)=P;
    X(:,i)=X(:,(i-1));
    
    for j=1:N
        if X(j,i)==min2
            X(j,i)=min1;
            code(j)=strcat('1',code(j));
        elseif X(j,i)==min1
            code(j)=strcat('0',code(j));
        end
    end
end
for i=1:N
    disp([Symbol(i) ' : '  char(code(i))]);
end

H=-sum(prob(:,1).*log2(prob(:,1)));
disp(['Shannon Entropy:  ', num2str(H)]);
l=0;
for i=1:N
    l=l+length(char(code(i)))*prob(i,1);
end
disp(['Average code length: ', num2str(l)]);
e=H/l;
disp(['Efficiency: ', num2str(e)]);

[fid, message]= fopen('msg1.txt', 'r');
if fid== -1
    disp(message);
    return;
end
message=fread(fid,'*char')';
N=length(P);

bn=[];
for i=1:length(message)
    for j=1:N
        if strcmp(Symbol(j),message(i))
            bn=strcat(bn,char(code(j)));
            break;
        end
    end
end
n=length(bn);
for i=1:n
    b(1,i)=str2double(bn(i));
end

end