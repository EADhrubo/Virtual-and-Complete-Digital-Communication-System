function output_state = out_func( in_bits )

g1= in_bits(1);
g2= mod(sum([in_bits(1) in_bits(3)]),2);
g3= mod(sum(in_bits),2);
output_state= [g1 g2 g3];

end

