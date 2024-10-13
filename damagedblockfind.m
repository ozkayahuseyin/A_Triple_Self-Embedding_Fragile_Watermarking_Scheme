function [h_b_A1,h_b_A2,h_b_A3,h_b_A4,h_b_B1,h_b_B2,h_b_B3,h_b_B4,h_b_C1,h_b_C2,h_b_C3,h_b_C4,h_b_D1,h_b_D2,h_b_D3,h_b_D4] = damagedblockfind(inputArg1)
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

tampered_blocks = inputArg1;

h_b_A1 = [];h_b_A2 = [];h_b_A3 = [];h_b_A4 = [];h_b_B1 = [];h_b_B2 = [];h_b_B3 = [];h_b_B4 = [];h_b_C1 = [];h_b_C2 = [];h_b_C3 = [];h_b_C4 = [];h_b_D1 = [];h_b_D2 = [];h_b_D3 = [];h_b_D4 = [];

h_b_A1(:,1) = tampered_blocks(find(tampered_blocks(:,1)<130 & tampered_blocks(:,2)<130),1);
h_b_A1(:,2) = tampered_blocks(find(tampered_blocks(:,1)<130 & tampered_blocks(:,2)<130),2);
h_b_C2(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),1);
h_b_C2(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),2);
h_b_A3(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),1);
h_b_A3(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),2);
h_b_C4(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),1);
h_b_C4(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),2);

h_b_C1(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),1);
h_b_C1(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),2);
h_b_A2(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),1);
h_b_A2(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),2);
h_b_C3(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=0 & tampered_blocks(:,2)<130),1);
h_b_C3(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=0 & tampered_blocks(:,2)<130),2);
h_b_A4(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),1);
h_b_A4(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),2);

h_b_D1(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=0 & tampered_blocks(:,2)<130),1);
h_b_D1(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=0 & tampered_blocks(:,2)<130),2);
h_b_B2(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),1);
h_b_B2(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),2);
h_b_D3(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),1);
h_b_D3(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),2);
h_b_B4(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),1);
h_b_B4(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),2);

h_b_B1(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),1);
h_b_B1(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=130 & tampered_blocks(:,1)<260 & tampered_blocks(:,2)>=130 & tampered_blocks(:,2)<260),2);
h_b_D2(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),1);
h_b_D2(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=0 & tampered_blocks(:,1)<130 & tampered_blocks(:,2)>=260 & tampered_blocks(:,2)<390),2);
h_b_B3(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)<130),1);
h_b_B3(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=260 & tampered_blocks(:,1)<390 & tampered_blocks(:,2)<130),2);
h_b_D4(:,1) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),1);
h_b_D4(:,2) = tampered_blocks(find(tampered_blocks(:,1)>=390 & tampered_blocks(:,1)<520 & tampered_blocks(:,2)>=390 & tampered_blocks(:,2)<520),2);

h_b_D1(:,1) = h_b_D1(:,1) - 130;
h_b_D2(:,2) = h_b_D2(:,2) - 260;
h_b_A2(:,1) = h_b_A2(:,1) - 130;
h_b_A2(:,2) = h_b_A2(:,2) - 260;
h_b_C1(:,2) = h_b_C1(:,2) - 130;
h_b_B1(:,1) = h_b_B1(:,1) - 130;
h_b_B1(:,2) = h_b_B1(:,2) - 130;
h_b_B2(:,2) = h_b_B2(:,2) - 390;
h_b_C2(:,1) = h_b_C2(:,1) - 130;
h_b_C2(:,2) = h_b_C2(:,2) - 390;
h_b_B3(:,1) = h_b_B3(:,1) - 260;
h_b_C3(:,1) = h_b_C3(:,1) - 390;

h_b_C4(:,1) = h_b_C4(:,1) - 260;
h_b_C4(:,2) = h_b_C4(:,2) - 260;
h_b_B4(:,1) = h_b_B4(:,1) - 390;
h_b_B4(:,2) = h_b_B4(:,2) - 260;
h_b_D3(:,1) = h_b_D3(:,1) - 260;
h_b_D3(:,2) = h_b_D3(:,2) - 130;
h_b_A3(:,1) = h_b_A3(:,1) - 390;
h_b_A3(:,2) = h_b_A3(:,2) - 130;
h_b_A4(:,1) = h_b_A4(:,1) - 260;
h_b_A4(:,2) = h_b_A4(:,2) - 390;
h_b_D4(:,1) = h_b_D4(:,1) - 390;
h_b_D4(:,2) = h_b_D4(:,2) - 390;

end

