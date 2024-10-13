function [outputArg1] = ab_embed(X1,rand22,inputimgsize)
%UNT�TLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1  : (inputimgsize(1)) * (inputimgsize(2)) / 25
              
       blok2 = [X1(rand22(i,1),rand22(i,2)), X1(rand22(i,1),rand22(i,2)+1),X1(rand22(i,1),rand22(i,2)+2), X1(rand22(i,1),rand22(i,2)+3), X1(rand22(i,1),rand22(i,2)+4); 
                X1(rand22(i,1)+1,rand22(i,2)), X1(rand22(i,1)+1,rand22(i,2)+1),X1(rand22(i,1)+1,rand22(i,2)+2) X1(rand22(i,1)+1,rand22(i,2)+3), X1(rand22(i,1)+1,rand22(i,2)+4);
                X1(rand22(i,1)+2,rand22(i,2)), X1(rand22(i,1)+2,rand22(i,2)+1),X1(rand22(i,1)+2,rand22(i,2)+2) X1(rand22(i,1)+2,rand22(i,2)+3), X1(rand22(i,1)+2,rand22(i,2)+4);
                X1(rand22(i,1)+3,rand22(i,2)), X1(rand22(i,1)+3,rand22(i,2)+1),X1(rand22(i,1)+3,rand22(i,2)+2), X1(rand22(i,1)+3,rand22(i,2)+3), X1(rand22(i,1)+3,rand22(i,2)+4);
                X1(rand22(i,1)+4,rand22(i,2)), X1(rand22(i,1)+4,rand22(i,2)+1),X1(rand22(i,1)+4,rand22(i,2)+2), X1(rand22(i,1)+4,rand22(i,2)+3), X1(rand22(i,1)+4,rand22(i,2)+4);               
               ];
       blok2(22:25)= blok2(22:25)-rem(blok2(22:25),8);  
      
      blok2 = double(blok2); 
     
      m1 = mean([blok2(1,1) blok2(1,2) blok2(2,1) blok2(2,2)]);
      m2 = mean([blok2(1,4) blok2(1,5) blok2(2,4) blok2(2,5)]);
      m3 = mean([blok2(4,1) blok2(4,2) blok2(5,1) blok2(5,2)]);
      m4 = mean([blok2(4,4) blok2(4,5) blok2(5,4) blok2(5,5)]);
      

      binaryauthen = decimalToBinaryVector(uint16(abs(sum(svd([m1 m2 ; m3 m4])))), 12, 'MSBFirst');
      rng(i)
      randarr = randperm(12);
      binaryauthen2 = binaryauthen(randarr);
      binaryauthen(:,64:75) =  binaryauthen2(:,1:12);
            
      for k = 22 : 25
      blok2binary = decimalToBinaryVector(uint8(abs(blok2(k))), 8, 'MSBFirst'); 
      blok2binary(:,6) = binaryauthen(:,3*k-2);
      blok2binary(:,7) = binaryauthen(:,3*k-1);
      blok2binary(:,8) = binaryauthen(:,3*k);
      blok2(k) = binaryVectorToDecimal(blok2binary);
      end
   
                 X1(rand22(i,1)+1,rand22(i,2)+4)     = blok2(22);
                 X1(rand22(i,1)+2,rand22(i,2)+4)     = blok2(23);
                 X1(rand22(i,1)+3,rand22(i,2)+4)     = blok2(24);
                 X1(rand22(i,1)+4,rand22(i,2)+4)     = blok2(25);
       
end

outputArg1 = X1;
end

