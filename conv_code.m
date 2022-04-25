function encoded = conv_code(b)
N=length(b);
A= 5;
Rb= 500;
k= 20;
Tb= 1/Rb;
f= 5*Rb;
Fs= k*Rb;
Ts= 1/Fs;

present_state= [0 0];
encoded= [ ];

for i= 1:N
    
    next_state= [b(i) present_state(1)];
    output_state= out_func([b(i) present_state]);
    present_state= next_state;
    
    encoded= [encoded output_state];
    
end
end

