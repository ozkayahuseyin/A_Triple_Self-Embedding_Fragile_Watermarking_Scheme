function [outputArg1] = medyanblockrecovery(km_b_A1,km_b_A2,km_b_A3,km_b_A4,km_b_B1,km_b_B2,km_b_B3,km_b_B4,km_b_C1,km_b_C2,km_b_C3,km_b_C4,km_b_D1,km_b_D2,km_b_D3,km_b_D4,inputArg1)
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here

uretilenresim = inputArg1;

km_b_A1;
                       if isempty(km_b_C1)
                       else
                           km_b_C1=km_b_C1()+[0,130];
                       end
                       if isempty(km_b_D2)
                       else
                           km_b_D2=km_b_D2()+[0,260];
                       end                      
                       if isempty(km_b_B2)
                       else
                           km_b_B2=km_b_B2()+[0,390];
                       end   
                       if isempty(km_b_B1)
                       else
                           km_b_B1=km_b_B1()+[130,130];
                       end 
                       if isempty(km_b_D1)
                       else
                           km_b_D1=km_b_D1()+[130,0];
                       end 
                       if isempty(km_b_C2)
                       else
                           km_b_C2=km_b_C2()+[130,390];
                       end 
                       if isempty(km_b_A2)
                       else
                           km_b_A2=km_b_A2()+[130,260];
                       end 
                       if isempty(km_b_D3)
                       else
                           km_b_D3=km_b_D3()+[260,130];
                       end 
                       if isempty(km_b_B3)
                       else
                           km_b_B3=km_b_B3()+[260,0];
                       end 
                       if isempty(km_b_A4)
                       else
                           km_b_A4=km_b_A4()+[260,390];
                       end 
                       if isempty(km_b_C4)
                       else
                           km_b_C4=km_b_C4()+[260,260];
                       end 
                       if isempty(km_b_C3)
                       else
                           km_b_C3=km_b_C3()+[390,0];
                       end 
                       if isempty(km_b_A3)
                       else
                           km_b_A3=km_b_A3()+[390,130];
                       end 
                       if isempty(km_b_B4)
                       else
                           km_b_B4=km_b_B4()+[390,260];
                       end 
                       if isempty(km_b_D4)
                       else
                           km_b_D4=km_b_D4()+[390,390];
                       end 
                       


kurtarilamayan_blok = [km_b_A1;
                       km_b_C1;
                       km_b_D2;
                       km_b_B2;
                       km_b_B1;
                       km_b_D1;
                       km_b_C2;
                       km_b_A2;
                       km_b_D3;
                       km_b_B3;
                       km_b_A4;
                       km_b_C4;
                       km_b_C3;
                       km_b_A3;
                       km_b_B4;
                       km_b_D4];
kurtarilamayan_blok_s = size(kurtarilamayan_blok);                   
                   
k_bloklar_resim = ones(520)*255;
for i = 1 : kurtarilamayan_blok_s(1)
        
        k_bloklar_resim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+1) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+2) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+3) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+4) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+1) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+2) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+3) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+4) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+1) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+2) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+3) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+4) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+1) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+2) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+3) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+4) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+1) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+2) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+3) = 0;
        k_bloklar_resim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+4) = 0;
            
end
             
% figure
% imshow(k_bloklar_resim)

uretilenresim2 = zeros(530);
uretilenresim2(6:525,6:525) = uretilenresim;
uretilenresim2(1:5,6:525) = uretilenresim(1:5,:);
uretilenresim2(6:525,1:5) = uretilenresim(:,1:5);
uretilenresim2(526:530,6:525) = uretilenresim(516:520,:);
uretilenresim2(6:525,526:530) = uretilenresim(:,516:520);
% figure
% imshow(uint8(uretilenresim2))

                       if isempty(kurtarilamayan_blok)
                       else
                          kurtarilamayan_blok2 = kurtarilamayan_blok + [5,5];
                       end 


% kurtarilamayan_blok2 = kurtarilamayan_blok + [5,5];

for i = 1 : kurtarilamayan_blok_s(1)
    

        blokmedyan2 = median([mean(uretilenresim2(kurtarilamayan_blok2(i,1)-5:kurtarilamayan_blok2(i,1)+4-5,kurtarilamayan_blok2(i,2):kurtarilamayan_blok2(i,2)+4))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1):kurtarilamayan_blok2(i,1)+4,kurtarilamayan_blok2(i,2)-5:kurtarilamayan_blok2(i,2)+4-5))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1)-5:kurtarilamayan_blok2(i,1)+4-5,kurtarilamayan_blok2(i,2)-5:kurtarilamayan_blok2(i,2)+4-5))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1)+5:kurtarilamayan_blok2(i,1)+4+5,kurtarilamayan_blok2(i,2):kurtarilamayan_blok2(i,2)+4))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1):kurtarilamayan_blok2(i,1)+4,kurtarilamayan_blok2(i,2)+5:kurtarilamayan_blok2(i,2)+4+5))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1)+5:kurtarilamayan_blok2(i,1)+4+5,kurtarilamayan_blok2(i,2)+5:kurtarilamayan_blok2(i,2)+4+5))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1)+5:kurtarilamayan_blok2(i,1)+4+5,kurtarilamayan_blok2(i,2)-5:kurtarilamayan_blok2(i,2)+4-5))
                             mean(uretilenresim2(kurtarilamayan_blok2(i,1)-5:kurtarilamayan_blok2(i,1)+4-5,kurtarilamayan_blok2(i,2)+5:kurtarilamayan_blok2(i,2)+4+5))
                    ]');
                
        blokmedyan = [];
        for jj = 1 : 8 
            if(blokmedyan2(jj)~=0)
                blokmedyan = [ blokmedyan blokmedyan2(jj)];
            end
        end
        
            blokmedyan = median(blokmedyan);
                
 
        uretilenresim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+1) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+2) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+3) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1),kurtarilamayan_blok(i,2)+4) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+1) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+2) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+3) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+1,kurtarilamayan_blok(i,2)+4) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+1) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+2) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+3) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+2,kurtarilamayan_blok(i,2)+4) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+1) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+2) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+3) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+3,kurtarilamayan_blok(i,2)+4) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+1) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+2) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+3) = blokmedyan;
        uretilenresim(kurtarilamayan_blok(i,1)+4,kurtarilamayan_blok(i,2)+4) = blokmedyan;
    
    
    
end

outputArg1 = uretilenresim;
end

