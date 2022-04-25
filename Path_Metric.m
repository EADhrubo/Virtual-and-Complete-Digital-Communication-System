function [ a ] = Path_Metric( path_init, rcv )

a(1)= min(sum(abs([0 0 0]- rcv))+path_init(1), sum(abs([0 1 1]- rcv))+path_init(2));
a(2)= min(sum(abs([0 0 1]- rcv))+path_init(3), sum(abs([0 1 0]- rcv))+path_init(4));

a(3)= min(sum(abs([1 1 1]- rcv))+path_init(1), sum(abs([1 0 0]- rcv))+path_init(2));
a(4)= min(sum(abs([1 1 0]- rcv))+path_init(3), sum(abs([1 0 1]- rcv))+path_init(4));

a= a';

end

