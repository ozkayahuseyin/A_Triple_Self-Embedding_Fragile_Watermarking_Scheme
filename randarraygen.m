function [outputArg1,outputArg2] = randarraygen(inputArg1)
%UNTİTLED Summary of this function goes here
%   Detailed explanation goes here

inputimgsize = inputArg1;


array_s = (((inputimgsize(1)/4))*((inputimgsize(2)/4)))/25;

% rng(5)
rand11 = randperm(array_s);

%rand11 = (1:16384);

rand22 = zeros(16900/(2*5*5),1);
for i = 1 : 2 : 16900/(5*5)
 k1 = 5*(floor(rand11(i)/((inputimgsize(1))/(20))+1))-4;
 k2 = mod(5*(rem(rand11(i),(inputimgsize(2))/(20)))-1,(inputimgsize(2))/(4))-3;
 
 k3 = 5*(floor(rand11(i+1)/((inputimgsize(1))/(20))+1))-4;
 k4 = mod(5*(rem(rand11(i+1),(inputimgsize(2))/(20)))-1,(inputimgsize(2))/(4))-3;

 rand22(round(i/2),1) = k1;
 rand22(round(i/2),2) = k2;
 rand22(round(i/2),3) = k3;
 rand22(round(i/2),4) = k4;
 

 
end

rand22(find(rand22==131)) = 1;

 rand33 = rand22(:,1:2);
 rand33 = [rand33;rand22(:,3:4)];
 rand22 = rand33;
 rand22(:,3:4)=rand22;
 
 l=1;
 for i = 1 : 5 : 130
     for j = 1 : 5 : 130
         rand33(l,1) = i;
         rand33(l,2) = j;
         l = l + 1;
     end
     
 end
 
 rand22(:,1:2)=rand33;
 rand44 = rand22(:,3:4);
 xx =randperm(676);
 rand22(:,5:6)=rand44(xx,1:2);
 xx =randperm(676);
 rand22(:,7:8)=rand44(xx,1:2);
 xx =randperm(676);
 rand22(:,1:2)=rand44(xx,1:2);
 
 k = 1;

    for i = 1 : 5 : 519
        for j = 1 : 5 : 519
            rand55(k,1) = i;
            rand55(k,2) = j; 
            k = k + 1;
        end
     end


outputArg1 = rand22;
outputArg2 = rand55;


end

