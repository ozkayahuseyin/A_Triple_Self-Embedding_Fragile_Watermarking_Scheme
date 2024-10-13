function [outputArg1] = blockrecover(k_b,X1,X2,rand1,rand2,i,t)
%UNT�TLED Summary of this function goes here
%   Detailed explanation goes here

      index3 = rand1(find(rand1(:,1) == k_b(i,1) & rand1(:,2) == k_b(i,2)),1); 
      index4 = rand1(find(rand1(:,1) == k_b(i,1) & rand1(:,2) == k_b(i,2)),2);

      index1 = rand2(find(k_b(i,1)==rand1(:,1)& k_b(i,2)==rand1(:,2)),1);
      index2 = rand2(find(k_b(i,1)==rand1(:,1)& k_b(i,2)==rand1(:,2)),2);
      
        
      bA = [X2(index1,index2), X2(index1,index2+1),X2(index1,index2+2), X2(index1,index2+3), X2(index1,index2+4); 
                X2(index1+1,index2), X2(index1+1,index2+1),X2(index1+1,index2+2) X2(index1+1,index2+3), X2(index1+1,index2+4);
                X2(index1+2,index2), X2(index1+2,index2+1),X2(index1+2,index2+2) X2(index1+2,index2+3), X2(index1+2,index2+4);
                X2(index1+3,index2), X2(index1+3,index2+1),X2(index1+3,index2+2), X2(index1+3,index2+3), X2(index1+3,index2+4);
                X2(index1+4,index2), X2(index1+4,index2+1),X2(index1+4,index2+2), X2(index1+4,index2+3), X2(index1+4,index2+4);               
               ];  
           
      
      for k = 1 : 21   
      bAbinary = decimalToBinaryVector(uint8(abs(bA(k))), 8, 'MSBFirst');  
      watermark2(:,3*k-2) = bAbinary(:,6);
      watermark2(:,3*k-1) = bAbinary(:,7);
      watermark2(:,3*k) = bAbinary(:,8);    
      end
    
      
      switch(t)
          case 1
              ext_watermark = watermark2(:,1:21);
          case 2
              if(k_b(i,3)==1)
                  ext_watermark = watermark2(:,1:21);
              else
                  ext_watermark = watermark2(:,22:42);
              end
          case 3
              if(k_b(i,3)==3)
                  ext_watermark = watermark2(:,43:63);
              else
                  ext_watermark = watermark2(:,22:42);
              end
              case 4
              ext_watermark = watermark2(:,43:63);
      end


      direction1 = binaryVectorToDecimal(ext_watermark(:,1:4));
      direction2 = binaryVectorToDecimal(ext_watermark(:,5:7));
      difference1 = binaryVectorToDecimal([ext_watermark(:,8:12) 0  ]);
      ext_mean = binaryVectorToDecimal([ext_watermark(:,13:18) 0 0  ]);
      diff2 = binaryVectorToDecimal(ext_watermark(:,19:21));
      difference2 = 0.25*(diff2+1)*difference1;
       
      b1 = zeros(2,2);
      b2 = zeros(2,2);
      b3 = zeros(2,2);
      b4 = zeros(2,2);

 
    switch(direction1)
          case 1
              b2(2,1) = ext_mean;
              b2(1,2) = ext_mean + difference1;
              b2(1,1) = ext_mean + difference1/4;
              b2(2,2) = ext_mean + difference1/4;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 9
              b2(1,2) = ext_mean - difference1;
              b2(2,1) = ext_mean;
              b2(1,1) = ext_mean - difference1/4;
              b2(2,2) = ext_mean - difference1/4;
              b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
          
          case 3
              b4(1,1) = ext_mean;
              b4(2,2) = ext_mean + difference1;
              b4(2,1) = ext_mean + difference1/4;
              b4(1,2) = ext_mean + difference1/4;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 11
              b4(2,2) = ext_mean - difference1;
              b4(1,1) = ext_mean;
              b4(2,1) = ext_mean - difference1/4;
              b4(1,2) = ext_mean - difference1/4;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
          
          case 5
              b3(1,2) = ext_mean;
              b3(2,1) = ext_mean + difference1;
              b3(1,1) = ext_mean + difference1/4;
              b3(2,2) = ext_mean + difference1/4;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];

          case 13
              b3(2,1) = ext_mean - difference1;
              b3(1,2) = ext_mean;
              b3(1,1) = ext_mean - difference1/4;
              b3(2,2) = ext_mean - difference1/4;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];

          case 7
              b1(2,2) = ext_mean;
              b1(1,1) = ext_mean + difference1;
              b1(1,2) = ext_mean + difference1/4;
              b1(2,1) = ext_mean + difference1/4;
			  b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
            
          case 15
              b1(1,1) = ext_mean - difference1;
              b1(2,2) = ext_mean;
              b1(1,2) = ext_mean - difference1/4;
              b1(2,1) = ext_mean - difference1/4;
			  b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];			  
              
          case 2
              b2(2,1) = ext_mean;
              b4(1,1) = ext_mean;
              b2(2,2) = ext_mean + difference1;
              b4(1,2) = ext_mean + difference1;
              b2(1,:) = ext_mean;
              b4(2,:) = ext_mean;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 10
              b2(2,2) = ext_mean - difference1;
              b4(1,2) = ext_mean - difference1;
              b2(2,1) = ext_mean;
              b4(1,1) = ext_mean;
              b2(1,:) = ext_mean;
              b4(2,:) = ext_mean;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
          
          case 4
              b3(1,2) = ext_mean;
              b4(1,1) = ext_mean;
              b3(2,2) = ext_mean + difference1;
              b4(2,1) = ext_mean + difference1;
              b3(:,1) = ext_mean;
              b4(:,2) = ext_mean;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
			  
          case 12
              b3(2,2) = ext_mean - difference1;
              b4(2,1) = ext_mean - difference1;
              b3(1,2) = ext_mean;
              b4(1,1) = ext_mean;
              b3(:,1) = ext_mean;
              b4(:,2) = ext_mean;
			  b1 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 6
              b1(2,2) = ext_mean;
              b3(1,2) = ext_mean;
              b1(2,1) = ext_mean + difference1;
              b3(1,1) = ext_mean + difference1;
              b1(1,:) = ext_mean;
              b3(2,:) = ext_mean;
			  b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 14
              b1(2,1) = ext_mean - difference1;
              b3(1,1) = ext_mean - difference1;
              b1(2,2) = ext_mean;
              b3(1,2) = ext_mean;
              b1(1,:) = ext_mean;
              b3(2,:) = ext_mean;  
			  b2 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 8
              b1(2,2) = ext_mean;
              b2(2,1) = ext_mean;
              b1(1,2) = ext_mean + difference1;
              b2(1,1) = ext_mean + difference1;
              b1(:,1) = ext_mean;
              b2(:,2) = ext_mean;
			  b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
          case 0
              b1(1,2) = ext_mean - difference1;
              b2(1,1) = ext_mean - difference1;
              b1(2,2) = ext_mean;
              b2(2,1) = ext_mean;
              b1(:,1) = ext_mean;
              b2(:,2) = ext_mean;  
			  b3 = [ ext_mean ext_mean ; ext_mean ext_mean];
              b4 = [ ext_mean ext_mean ; ext_mean ext_mean];
              
    end    
	  
    b1 = round(b1);
    b2 = round(b2);
    b3 = round(b3);
    b4 = round(b4);
	switch direction2
                  case 1
                      b2 = b2 + 3*difference2/2;
					  b1 = b1 - difference2/4;
                      b3 = b3 - difference2;
                      b4 = b4 - difference2/4;
                  case 5
                      b2 = b2 - 3*difference2/2; 
					  b1 = b1 + difference2/4;
                      b3 = b3 + difference2;
                      b4 = b4 + difference2/4;
                  case 2
                      b4 = b4 + 3*difference2/2;
                      b1 = b1 - difference2;
                      b2 = b2 - difference2/4;
					  b3 = b3 - difference2/4;
                  case 6
                      b4 = b4 - 3*difference2/2;
                      b1 = b1 + difference2;
                      b2 = b2 + difference2/4;
					  b3 = b3 + difference2/4;
                  case 3
                      b3 = b3 + 3*difference2/2;
                      b1 = b1 - difference2/4;
                      b2 = b2 - difference2;
					  b4 = b4 - difference2/4;
                  case 7
                      b3 = b3 - 3*difference2/2;
                      b1 = b1 + difference2/4;
                      b2 = b2 + difference2;
					  b4 = b4 + difference2/4;
                  case 4
                      b1 = b1 + 3*difference2/2;
                      b2 = b2 - difference2/4;
                      b3 = b3 - difference2/4;
					  b4 = b4 - difference2; 
                  case 0
                      b1 = b1 - 3*difference2/2;
                      b2 = b2 + difference2/4;
                      b3 = b3 + difference2/4;
					  b4 = b4 + difference2; 
              
              end
	  

      kblok = [b1, b2 ; b3, b4];
      kblok = round(kblok);
      
                 X1(index3,index4)     = kblok(1);
                 X1(index3,index4+1)   = kblok(5);
                 X1(index3,index4+3)   = kblok(9);
                 X1(index3,index4+4)   = kblok(13);
               
                 X1(index3+1,index4)   = kblok(2);
                 X1(index3+1,index4+1) = kblok(6) ;
                 X1(index3+1,index4+3) = kblok(10) ;
                 X1(index3+1,index4+4) = kblok(14);
               
                 X1(index3+3,index4)   = kblok(3);
                 X1(index3+3,index4+1) = kblok(7); 
                 X1(index3+3,index4+3) = kblok(11) ; 
                 X1(index3+3,index4+4) = kblok(15);
               
                 X1(index3+4,index4)   = kblok(4) ;
                 X1(index3+4,index4+1) = kblok(8) ;
                 X1(index3+4,index4+3) = kblok(12) ;
                 X1(index3+4,index4+4) = kblok(16)  ; 
                 
                 X1(index3+2,index4)   = mean([kblok(2) kblok(3)]);
                 X1(index3+2,index4+1) = mean([kblok(6) kblok(7)]);
                 X1(index3,index4+2)   = mean([kblok(5) kblok(9)]);
                 X1(index3+1,index4+2) = mean([kblok(6) kblok(10)]);
                 X1(index3+2,index4+3) = mean([kblok(10) kblok(11)]);
                 X1(index3+2,index4+4) = mean([kblok(14) kblok(15)]);
                 X1(index3+3,index4+2) = mean([kblok(7) kblok(11)]);
                 X1(index3+4,index4+2) = mean([kblok(8) kblok(12)]);
                 X1(index3+2,index4+2) = mean([kblok(6) kblok(10) kblok(7) kblok(11)]);

outputArg1 = X1;
end

