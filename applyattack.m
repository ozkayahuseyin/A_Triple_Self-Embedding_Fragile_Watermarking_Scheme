function [outputArg1] = applyattack(t,i)
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

kk = i;



    if (kk<27)

kbolge  = [1    , 520    ,  1   ,  390  ; 1       , 1         , 1    , 1           ; %75
           1    , 0      ,  1   ,  0    ; 131     , 520       , 1    , 520         ;
           1    , 0      ,  1   ,  0    ; 1       , 520       , 131  , 520         ;
           1    , 0      ,  1   ,  0    ; 1       , 390       , 1    , 520         ;
           1    , 520    ,  131 ,  390  ; 131     , 390       , 1    , 520         ;
           1    , 520    ,  1   ,  130  ; 391     , 520       , 1    , 520         ; %75
           1    , 0      ,  1   ,  0    ; 1       , 260       , 1    , 520         ; %50
           1    , 0      ,  1   ,  0    ; 1       , 520       , 1    , 260         ;
           1    , 0      ,  1   ,  0    ; 1       , 520       , 131  , 390         ;
           1    , 0      ,  1   ,  0    ; 131     , 390       , 1    , 520         ;
           1    , 520    ,  391 ,  520  ; 1       , 520       , 1    , 130         ;
           1    , 260    ,  1   ,  260  ; 261     , 520       , 261  , 520         ; %50
           1    , 0      ,  1   ,  0    ; 131     , 390       , 131  , 390         ; %25
           1    , 0      ,  1   ,  0    ; 1       , 260       , 1    , 260         ;
           1    , 0      ,  1   ,  0    ; 131     , 390       , 261  , 520         ;
           1    , 0      ,  1   ,  0    ; 1       , 260       , 131  , 390         ;
           131  , 260    ,  1   ,  130  ; 131     , 260       , 391  , 520         ;
           1    , 130    ,  1   ,  130  ; 1       , 130       , 391  , 520         ; %25
           1    , 1      ,  1   ,  1    ; 1       , 52        , 1    , 520         ; %10           
           1    , 1      ,  1   ,  1    ; 1       , 104       , 1    , 520         ; %20 
           1    , 1      ,  1   ,  1    ; 1       , 156       , 1    , 520         ; %30           
           1    , 1      ,  1   ,  1    ; 1       , 208       , 1    , 520         ; %40           
           1    , 1      ,  1   ,  1    ; 1       , 260       , 1    , 520         ; %50           
           1    , 1      ,  1   ,  1    ; 1       , 312       , 1    , 520         ; %60           
           1    , 1      ,  1   ,  1    ; 1       , 364       , 1    , 520         ; %70           
           1    , 1      ,  1   ,  1    ; 1       , 390       , 1    , 520         ; %75          
           ];
        
 bas1 = kbolge(2*kk-1,1); 
 bit1 = kbolge(2*kk-1,2);
 bas2 = kbolge(2*kk-1,3);
 bit2 = kbolge(2*kk-1,4);
 bas3 = kbolge(2*kk,1);
 bit3 = kbolge(2*kk,2);
 bas4 = kbolge(2*kk,3);
 bit4 = kbolge(2*kk,4);
 
if(kk==6)
t(1:130,1:520) = 0;
t(1:520,391:520) = 0;
end

if(kk==17)
t(391:520,131:390) = 0;
end
if(kk==18)
t(261:390,1:130) = 0;
t(261:390,391:520) = 0;
end

t(bas1:bit1,bas2:bit2) = 0;
t(bas3:bit3,bas4:bit4) = 0;

    end
    
switch kk
        case 27
iii = [1:520];
jjj = [1:520];

for iii = 1 : 520
   for jjj = 1 : 520
      if(  420>iii+jjj || 620<jjj+iii)
          t(iii,jjj)=0;
      end       
   end    
end

    case 28
        
    
imageSize = 520;
img = ones(imageSize, imageSize); 

% Spiral 
numTurns = 5; 
numPoints = 10000;
theta = linspace(0, 2*pi*numTurns, numPoints);


radius = linspace(10, 250, numPoints); 
thickness = linspace(5, 15, numPoints); 


for i = 1:numPoints
    xCoord = round(imageSize / 2 + radius(i) * cos(theta(i)));
    yCoord = round(imageSize / 2 + radius(i) * sin(theta(i)));
    
 
    startIdx = max(1, xCoord - round(thickness(i)));
    endIdx = min(imageSize, xCoord + round(thickness(i)));
    
 
    if yCoord > 0 && yCoord <= imageSize
        img(yCoord, startIdx:endIdx) = 0; 
    end
end


t = double(t).*double(img);

    case 29 
        
        for iii = 1 : 520
   for jjj = 1 : 520
      if((iii>jjj+50 || jjj>iii+50)&&(470>iii+jjj || 570<jjj+iii) )
          t(iii,jjj)=0;
      end       
   end    
        end
        
    case 30
        
        iii = [1:520];
jjj = [1:520];

for iii = 1 : 520
   for jjj = 1 : 520
      if(iii>jjj+100 || jjj>iii+100 )
          t(iii,jjj)=0;
      end       
   end    
end
        
 
end

 

outputArg1 = uint8(t);

end

