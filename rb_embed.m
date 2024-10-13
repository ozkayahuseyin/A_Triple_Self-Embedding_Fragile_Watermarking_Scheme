function [outputArg1] = rb_embed(X1,X2,X3,X4,rand1,rand2,rand3,rand4,inputimgsize)
%UNT�TLED Summary of this function goes here
%   Detailed explanation goes here


for i = 1  : (inputimgsize(1))/(2*2) * (inputimgsize(2))/4 / 25
    
       blok2 = [X1(rand1(i,1),rand1(i,2)), X1(rand1(i,1),rand1(i,2)+1),X1(rand1(i,1),rand1(i,2)+2), X1(rand1(i,1),rand1(i,2)+3), X1(rand1(i,1),rand1(i,2)+4); 
                X1(rand1(i,1)+1,rand1(i,2)), X1(rand1(i,1)+1,rand1(i,2)+1),X1(rand1(i,1)+1,rand1(i,2)+2) X1(rand1(i,1)+1,rand1(i,2)+3), X1(rand1(i,1)+1,rand1(i,2)+4);
                X1(rand1(i,1)+2,rand1(i,2)), X1(rand1(i,1)+2,rand1(i,2)+1),X1(rand1(i,1)+2,rand1(i,2)+2) X1(rand1(i,1)+2,rand1(i,2)+3), X1(rand1(i,1)+2,rand1(i,2)+4);
                X1(rand1(i,1)+3,rand1(i,2)), X1(rand1(i,1)+3,rand1(i,2)+1),X1(rand1(i,1)+3,rand1(i,2)+2), X1(rand1(i,1)+3,rand1(i,2)+3), X1(rand1(i,1)+3,rand1(i,2)+4);
                X1(rand1(i,1)+4,rand1(i,2)), X1(rand1(i,1)+4,rand1(i,2)+1),X1(rand1(i,1)+4,rand1(i,2)+2), X1(rand1(i,1)+4,rand1(i,2)+3), X1(rand1(i,1)+4,rand1(i,2)+4);               
               ];
       blok2(1:21)= blok2(1:21)-rem(blok2(1:21),8);      
    
       binaryblokinf(:,1:63) = 0;
    
       [binaryblokinf] = rb_generate(X2,rand2,1,binaryblokinf,i);  %generate recovery bits of X2
       [binaryblokinf] = rb_generate(X3,rand3,22,binaryblokinf,i); %generate recovery bits of X3
       [binaryblokinf] = rb_generate(X4,rand4,43,binaryblokinf,i); %generate recovery bits of X4
       
             
      for k = 1 : 21
      blok2binary = decimalToBinaryVector(uint8(abs(blok2(k))), 8, 'MSBFirst'); 
      blok2binary(:,6) = binaryblokinf(:,3*k-2);
      blok2binary(:,7) = binaryblokinf(:,3*k-1);
      blok2binary(:,8) = binaryblokinf(:,3*k);
      blok2(k) = binaryVectorToDecimal(blok2binary);
      end

             
                 X1(rand1(i,1),rand1(i,2))     = blok2(1);
                 X1(rand1(i,1)+4,rand1(i,2))    = blok2(5);
                 X1(rand1(i,1)+3,rand1(i,2)+1)   = blok2(9);
                 X1(rand1(i,1)+2,rand1(i,2)+2)   = blok2(13);
                
                 X1(rand1(i,1)+1,rand1(i,2))   = blok2(2);
                 X1(rand1(i,1),rand1(i,2)+1) = blok2(6) ;
                 X1(rand1(i,1)+4,rand1(i,2)+1) = blok2(10) ;
                 X1(rand1(i,1)+3,rand1(i,2)+2) = blok2(14);
                
                 X1(rand1(i,1)+2,rand1(i,2))   = blok2(3);
                 X1(rand1(i,1)+1,rand1(i,2)+1) = blok2(7); 
                 X1(rand1(i,1),rand1(i,2)+2) = blok2(11) ; 
                 X1(rand1(i,1)+4,rand1(i,2)+2) = blok2(15);
                
                 X1(rand1(i,1)+3,rand1(i,2))   = blok2(4) ;
                 X1(rand1(i,1)+2,rand1(i,2)+1) = blok2(8) ;
                 X1(rand1(i,1)+1,rand1(i,2)+2) = blok2(12) ;
                 X1(rand1(i,1),rand1(i,2)+3) = blok2(16)  ;   
                 
                 X1(rand1(i,1)+1,rand1(i,2)+3)   = blok2(17);
                 X1(rand1(i,1)+2,rand1(i,2)+3) = blok2(18) ;
                 
                 X1(rand1(i,1)+3,rand1(i,2)+3) = blok2(19) ;
                 X1(rand1(i,1)+4,rand1(i,2)+3) = blok2(20) ;
                 X1(rand1(i,1),rand1(i,2)+4) = blok2(21) ;
                    
      
end


outputArg1 = X1; 

end

