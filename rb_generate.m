function [outputArg1] =  rb_generate(inputArg1,inputArg2,inputArg3,inputArg4,i)
%UNT�TLED2 Summary of this function goes here
%   Detailed explanation goes here

X2 = inputArg1;
rand2 = inputArg2;
index = inputArg3;
binaryblokinf = inputArg4;

      blok1 = [X2(rand2(i,1),rand2(i,2)), X2(rand2(i,1),rand2(i,2)+1), X2(rand2(i,1),rand2(i,2)+3), X2(rand2(i,1),rand2(i,2)+4); 
               X2(rand2(i,1)+1,rand2(i,2)), X2(rand2(i,1)+1,rand2(i,2)+1), X2(rand2(i,1)+1,rand2(i,2)+3), X2(rand2(i,1)+1,rand2(i,2)+4);
               X2(rand2(i,1)+3,rand2(i,2)), X2(rand2(i,1)+3,rand2(i,2)+1), X2(rand2(i,1)+3,rand2(i,2)+3), X2(rand2(i,1)+3,rand2(i,2)+4);
               X2(rand2(i,1)+4,rand2(i,2)), X2(rand2(i,1)+4,rand2(i,2)+1), X2(rand2(i,1)+4,rand2(i,2)+3), X2(rand2(i,1)+4,rand2(i,2)+4);               
               ];
       
      blok1 = (rem(blok1,4)>2)*4+double(blok1-rem(blok1,4));
              
      blok1 = double(blok1); 
      d1 = blok1(1,4)-blok1(2,3);
      d2 = (blok1(2,4)+blok1(3,4)-(blok1(2,3)+blok1(3,3)))/2;
      d3 = blok1(4,4)-blok1(3,3);
      d4 = (blok1(4,3)+blok1(4,2)-(blok1(3,3)+blok1(3,2)))/2;
      d5 = blok1(4,1)-blok1(3,2);
      d6 = (blok1(3,1)+blok1(2,1)-(blok1(3,2)+blok1(2,2)))/2;
      d7 = blok1(1,1)-blok1(2,2);
      d8 = (blok1(1,2)+blok1(1,3)-(blok1(2,2)+blok1(2,3)))/2;
      d9 = -d1;
      d10 = -d2;
      d11 = -d3;
      d12 = -d4;
      d13 = -d5;
      d14 = -d6;
      d15 = -d7;
      d16 = -d8;
      
      d_array = [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16];
      
      d_array_max_number = find(d_array==max(d_array));
      difference1 = max(d_array);

      %When the direction with the max value is more than one, 
      %the direction with the maximum value for both sides is selected
      %for exp [9,10,11] choise 10
      %         [3,4,14] choise 4
      %         [1,4,12] choise 1
      d_array_size = size(d_array_max_number);
      ff = find(diff(find(diff(d_array_max_number)==1))==1)+1;
      fff = find(diff(d_array_max_number)==1)+1;
      if(d_array_size(2)>1  )
          if(isempty(ff)==1 )
              if(isempty(fff)==1)
                  direction1  = d_array_max_number(1);
              else
                  direction1  = d_array_max_number(fff(1));
              end          
          else
              direction1  = d_array_max_number(ff(1));
          end         
      else
          direction1  = find(d_array==max(d_array));
      end
      
      if (direction1  == 16)
          direction1  = 0;
      end
              
      meanblok = mean(mean(blok1));
      meanblok2 = (rem(meanblok,4)>2)*4+meanblok-rem(meanblok,4);
      mb = meanblok2;
      mb1 = mean([blok1(1,1) blok1(1,2) blok1(2,1) blok1(2,2)]);
      mb2 = mean([blok1(1,3) blok1(1,4) blok1(2,3) blok1(2,4)]);
      mb3 = mean([blok1(3,1) blok1(3,2) blok1(4,1) blok1(4,2)]);
      mb4 = mean([blok1(3,3) blok1(3,4) blok1(4,3) blok1(4,4)]);
      differences2 = [mb2-meanblok mb4-meanblok mb3-meanblok mb1-meanblok meanblok-mb2 meanblok-mb4 meanblok-mb3 meanblok-mb1   ];
      difference2 = max(differences2);
     
      if(difference1~=0)
          D2 = difference2 / difference1; 
      else
          D2 = difference2;
      end
      
      difference2coef = [ 0.25 0.5 0.75 1 1.25 1.5 1.75 2 ];  %% (30.63)
      Diff2 = (find(abs(difference2coef-D2) == min(abs(difference2coef-D2))));
      Diff2 = Diff2 - 1;
     
      Direction2 = find(max(differences2)==differences2);
      if Direction2 == 8
          Direction2 = 0;
      else
      end
      Direction2=Direction2(1);
      
      difference1 = (rem(difference1,4)>2)*4+double(difference1-rem(difference1,4));
      binarydirection1  = decimalToBinaryVector(uint8(abs(direction1 )), 4, 'MSBFirst');
      binaryDirection2 = decimalToBinaryVector(uint8(abs(Direction2)), 3, 'MSBFirst'); 
      binarydifference1 = decimalToBinaryVector(uint8(abs(difference1)), 8, 'MSBFirst');
      binarymean = decimalToBinaryVector(uint8(abs(mb)), 8, 'MSBFirst');
      binarydifference2 = decimalToBinaryVector(uint8(abs(Diff2(1))), 3, 'MSBFirst'); 
      
      binaryblokinf(:,index:index+3) = binarydirection1(:,1:4); 
      binaryblokinf(:,index+4:index+6) = binaryDirection2(:,1:3);
      binaryblokinf(:,index+7:index+11) = binarydifference1(:,2:6);
      binaryblokinf(:,index+12:index+17) = binarymean(:,1:6);
      binaryblokinf(:,index+18:index+20) = binarydifference2(:,1:3);


 outputArg1 = binaryblokinf;

end

