function m =line_code(encoded,b,choose)

N=length(b);
A= 5;
Rb= 500;
k= 20;
Tb= 1/Rb;
f= 5*Rb;
Fs= k*Rb;
Ts= 1/Fs;
B= 0.3/Tb;
t= 0:Ts:3*N*Tb-Ts;
A0= 5;
A1= 10;
p=sin(2*pi*f*t);
f1= 5*Rb;
f2= 8*Rb;
bit_stream= [ ];
for i= 1:length(encoded)
    
    bit_stream= [bit_stream encoded(i)*ones(1,k)];
    
end


if choose ==1
    bit_stream(bit_stream==0)= -1;
    tg= -(1.5*Tb-Ts):Ts:1.5*Tb;
    h= sqrt(2*pi/log(2))*B*exp(-2*pi^2*B^2*tg.^2/log(2));
    x= cumsum(bit_stream);
    x=x*Ts;
    y= conv(x, h, 'same');
    phi= y;
    z1= cos(phi);
    z2= sin(phi);
    car1= sin(2*pi*f*t);
    car2= cos(2*pi*f*t);
    s1= car1.*z1;
    s2= car2.*z2;
    m= s1+s2;
elseif choose ==2
    for i=1:length(t)
        if bit_stream
            m(i)= p(i)*A1;
            
        else
            
            m(i)= p(i)*A0;
            
        end
        
        
    end
elseif choose ==3
    for i=1:length(t)
        if bit_stream
            m(i)= A1*sin(2*pi*f1*t(i));
            
        else
            
            m(i)= A1*sin(2*pi*f2*t(i));
            
        end
        
        
    end
else
    bit_stream(bit_stream==0)= -1;
    c= A*sin(2*pi*f*t);
    m= c.*bit_stream;
end

end
