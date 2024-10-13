function [outputArg1] = recovery(k_b,X1,X2,X3,X4,rand1,rand2,rand3,rand4,t)

size_k_b = size(k_b);

for i = 1 : size_k_b(1)
 
switch(k_b(i,3))
    case 1   
           X1 = blockrecover(k_b,X1,X2,rand1,rand2,i,t);  
       
    case 2
           X1 = blockrecover(k_b,X1,X3,rand1,rand3,i,t);    
      
    case 3
           X1 = blockrecover(k_b,X1,X4,rand1,rand4,i,t);      
 
end

end

outputArg1 = X1;

end


