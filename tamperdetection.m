function [outputArg1,outputArg2] = tamperdetection(X1,rand22,inputimgsize)
%UNT�TLED Summary of this function goes here
%   Detailed explanation goes here


 bn = 1;
 h_b_number = zeros(1,2);
for i = 1  : (inputimgsize(1)) * (inputimgsize(2)) / 25
             
       blok2 = [X1(rand22(i,1),rand22(i,2)), X1(rand22(i,1),rand22(i,2)+1),X1(rand22(i,1),rand22(i,2)+2), X1(rand22(i,1),rand22(i,2)+3), X1(rand22(i,1),rand22(i,2)+4); 
                X1(rand22(i,1)+1,rand22(i,2)), X1(rand22(i,1)+1,rand22(i,2)+1),X1(rand22(i,1)+1,rand22(i,2)+2) X1(rand22(i,1)+1,rand22(i,2)+3), X1(rand22(i,1)+1,rand22(i,2)+4);
                X1(rand22(i,1)+2,rand22(i,2)), X1(rand22(i,1)+2,rand22(i,2)+1),X1(rand22(i,1)+2,rand22(i,2)+2) X1(rand22(i,1)+2,rand22(i,2)+3), X1(rand22(i,1)+2,rand22(i,2)+4);
                X1(rand22(i,1)+3,rand22(i,2)), X1(rand22(i,1)+3,rand22(i,2)+1),X1(rand22(i,1)+3,rand22(i,2)+2), X1(rand22(i,1)+3,rand22(i,2)+3), X1(rand22(i,1)+3,rand22(i,2)+4);
                X1(rand22(i,1)+4,rand22(i,2)), X1(rand22(i,1)+4,rand22(i,2)+1),X1(rand22(i,1)+4,rand22(i,2)+2), X1(rand22(i,1)+4,rand22(i,2)+3), X1(rand22(i,1)+4,rand22(i,2)+4);               
               ];
           
      for k = 22 : 25   
      bAbinary = decimalToBinaryVector(uint8(abs(blok2(k))), 8, 'MSBFirst');
      authen2(:,3*k-2) = bAbinary(:,6);
      authen2(:,3*k-1) = bAbinary(:,7);
      authen2(:,3*k) = bAbinary(:,8);    
      end
           
      blok2(22:25)= blok2(22:25)-rem(blok2(22:25),8);  
      
      blok2 = double(blok2); 
     
      m1 = mean([blok2(1,1) blok2(1,2) blok2(2,1) blok2(2,2)]);
      m2 = mean([blok2(1,4) blok2(1,5) blok2(2,4) blok2(2,5)]);
      m3 = mean([blok2(4,1) blok2(4,2) blok2(5,1) blok2(5,2)]);
      m4 = mean([blok2(4,4) blok2(4,5) blok2(5,4) blok2(5,5)]);
 
      binaryauthen = decimalToBinaryVector(uint16(abs(sum(svd([m1 m2 ; m3 m4])))), 12, 'MSBFirst');
      rng(i)
      randarry = randperm(12);
      binaryauthen2 = binaryauthen(randarry);
      
      generate_aut = binaryVectorToDecimal(binaryauthen2(:,1:12));
      extract_aut = binaryVectorToDecimal(authen2(:,64:75));

     if(extract_aut == generate_aut && extract_aut ~= 0)
        
     
                 y(rand22(i,1),rand22(i,2))     = 255;
                 y(rand22(i,1),rand22(i,2)+1)   = 255;
                 y(rand22(i,1),rand22(i,2)+2)   = 255;
                 y(rand22(i,1),rand22(i,2)+3)   = 255;
                 y(rand22(i,1),rand22(i,2)+4)   = 255;
              
                 y(rand22(i,1)+1,rand22(i,2))   = 255;
                 y(rand22(i,1)+1,rand22(i,2)+1) = 255 ;
                 y(rand22(i,1)+1,rand22(i,2)+2) = 255 ;
                 y(rand22(i,1)+1,rand22(i,2)+3) = 255;
                 y(rand22(i,1)+1,rand22(i,2)+4) = 255;
                
                 y(rand22(i,1)+2,rand22(i,2))   = 255;
                 y(rand22(i,1)+2,rand22(i,2)+1) = 255; 
                 y(rand22(i,1)+2,rand22(i,2)+2) = 255 ; 
                 y(rand22(i,1)+2,rand22(i,2)+3) = 255;
                 y(rand22(i,1)+2,rand22(i,2)+4) = 255;
               
                 y(rand22(i,1)+3,rand22(i,2))   = 255 ;
                 y(rand22(i,1)+3,rand22(i,2)+1) = 255 ;
                 y(rand22(i,1)+3,rand22(i,2)+2) = 255;
                 y(rand22(i,1)+3,rand22(i,2)+3) = 255  ;   
                 y(rand22(i,1)+3,rand22(i,2)+4) = 255  ; 
                 
                 y(rand22(i,1)+4,rand22(i,2))   = 255 ;
                 y(rand22(i,1)+4,rand22(i,2)+1) = 255 ;
                 y(rand22(i,1)+4,rand22(i,2)+2) = 255;
                 y(rand22(i,1)+4,rand22(i,2)+3) = 255  ;   
                 y(rand22(i,1)+4,rand22(i,2)+4) = 255  ; 
                 
     else
                 
                 y(rand22(i,1),rand22(i,2))     = 0;
                 y(rand22(i,1),rand22(i,2)+1)   = 0;
                 y(rand22(i,1),rand22(i,2)+2)   = 0;
                 y(rand22(i,1),rand22(i,2)+3)   = 0;
                 y(rand22(i,1),rand22(i,2)+4)   = 0;
              
                 y(rand22(i,1)+1,rand22(i,2))   = 0;
                 y(rand22(i,1)+1,rand22(i,2)+1) = 0 ;
                 y(rand22(i,1)+1,rand22(i,2)+2) = 0 ;
                 y(rand22(i,1)+1,rand22(i,2)+3) = 0;
                 y(rand22(i,1)+1,rand22(i,2)+4) = 0;
                
                 y(rand22(i,1)+2,rand22(i,2))   = 0;
                 y(rand22(i,1)+2,rand22(i,2)+1) = 0; 
                 y(rand22(i,1)+2,rand22(i,2)+2) = 0 ; 
                 y(rand22(i,1)+2,rand22(i,2)+3) = 0;
                 y(rand22(i,1)+2,rand22(i,2)+4) = 0;
               
                 y(rand22(i,1)+3,rand22(i,2))   = 0 ;
                 y(rand22(i,1)+3,rand22(i,2)+1) = 0 ;
                 y(rand22(i,1)+3,rand22(i,2)+2) = 0;
                 y(rand22(i,1)+3,rand22(i,2)+3) = 0  ;   
                 y(rand22(i,1)+3,rand22(i,2)+4) = 0  ; 
                 
                 y(rand22(i,1)+4,rand22(i,2))   = 0 ;
                 y(rand22(i,1)+4,rand22(i,2)+1) = 0 ;
                 y(rand22(i,1)+4,rand22(i,2)+2) = 0;
                 y(rand22(i,1)+4,rand22(i,2)+3) = 0  ;   
                 y(rand22(i,1)+4,rand22(i,2)+4) = 0  ; 
         
                 h_b_number(bn,1) = rand22(i,1);
                 h_b_number(bn,2) = rand22(i,2);
                 bn = bn + 1;
      end

                 
             
      
end


 outputArg1 = y;
 outputArg2 = h_b_number;
 
end

