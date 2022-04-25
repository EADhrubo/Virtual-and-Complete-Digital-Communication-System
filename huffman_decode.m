function dec_msg = huffman_decode(decoded,Symbol,code)

l=length(decoded);
str=[];
for i=1:l
    c=num2str(decoded(1,i));
    str=strcat(str,c);
end

N=length(Symbol);
L=length(str);
dec_msg=cell(1,10);
l=1;
k=1;
maxl=1;
for i=1:N
    str1=code{i};
    m=length(str1);
    if m>maxl
        maxl=m;
    end
end


while l<=L
    temp=' ';
    found=0;
    for j=1:maxl
        temp=strcat(temp,str(l+j-1));
        for i=1:N
            if strcmp(code(i),temp)
                dec_msg{k}=Symbol(i);
                found=1;
                break;
            end
        end
        if found
            break;
        end
    end
    if found==0
        dec_msg{k}='Invalid';
    end
    k=k+1;
    l=l+j;
end

end