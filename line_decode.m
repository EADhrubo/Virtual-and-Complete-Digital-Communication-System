function md = line_decode(mc,b,choose)
N=length(b);
A= 5;
Rb= 500;
k= 20;
Tb= 1/Rb;
f= 5*Rb;
Fs= k*Rb;
Ts= 1/Fs;
t= 0:Ts:3*N*Tb-Ts;
c= A*sin(2*pi*f*t);
p=sin(2*pi*f*t);
car1= sin(2*pi*f*t);
car2= cos(2*pi*f*t);
f1= 5*Rb;
f2= 8*Rb;
car11= sin(2*pi*f1*t);
car22= sin(2*pi*f2*t);
A0= 5;
A1= 10;
if choose ==1
    p1= mc.*car1;
    p2= mc.*car2;
    LPF= fir1(50, f/Fs);
    I= filter(LPF, 1, p1);
    Q= filter(LPF, 1, p2);
    phi_prime= unwrap(atan2(Q, I));
    operator= [1 -1];
    der= conv(phi_prime, operator, 'same');
    der= der/Ts;
    md= [ ];
    for i= 1:k:length(der)
        
        md= [md sum(der(i:i+k-1))];
        
    end
    
    
    md(md>0)= 1;
    md(md<0)= 0;
elseif choose ==2
    mc= mc.*p;
    Vth= (A0+A1)/4;
    for j= 1:3*N
        
        md(j)= sum(mc(k*(j-1)+1:k*j))/k;
        
    end
    
    md(md>Vth)= 1;
    md(md<Vth)= 0;
elseif choose == 3
    mc1= mc.*car11;
    mc2= mc.*car22;
    for j= 1:3*N
        
        md1(j)= sum(mc1(k*(j-1)+1:k*j))/k;
        md2(j)= sum(mc2(k*(j-1)+1:k*j))/k;
    end
    for n= 1:length(md1)
        
        if md1(n)>=md2(n)
            md(n)= 1;
        elseif md1(n)<md2(n)
            md(n)= 0;
        end
        
    end
    
else
    mc= mc.*c;
    
    for j= 1:3*N
        
        md(j)= sum(mc(k*(j-1)+1:k*j))/k;
        
    end
    
    md(md>0)= 1;
    md(md<0)= 0;
end
end