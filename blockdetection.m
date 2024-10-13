function [outputArg1,outputArg2] = blockdetection(X1,X2,X3,X4,rand1,rand2,rand3,rand4)
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

x1boyut = size(X1);
km_b = [];
k_b = [];
j = 1;
k = 1;

for i = 1  : x1boyut(1)
  
 
 if (isempty(find(X2(:,1)==rand2(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),1) & X2(:,2) == rand2(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),2))))
     k_b(k,1) = X1(i,1);
     k_b(k,2) = X1(i,2);   
     k_b(k,3) = 1;
     k = k + 1;
 else
     if (isempty(find(X3(:,1)==rand3(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),1) & X3(:,2) == rand3(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),2))))   
     k_b(k,1) = X1(i,1);
     k_b(k,2) = X1(i,2);   
     k_b(k,3) = 2;
     k = k + 1;
     else    
         if (isempty(find(X4(:,1)==rand4(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),1) & X4(:,2) == rand4(find(rand1(:,1) == X1(i,1) & rand1(:,2) == X1(i,2)),2))))
     k_b(k,1) = X1(i,1);
     k_b(k,2) = X1(i,2);   
     k_b(k,3) = 3;
     k = k + 1;
         else
     km_b(j,1) = X1(i,1);
     km_b(j,2) = X1(i,2);   
     j = j + 1;
         end
     end
 end
  
    
end


outputArg1 = km_b;
outputArg2 = k_b;


end

