
listing = dir('data/Test image/');
listsize = size(listing);
        i = 10;                            j = 28;
%%%%%%%%%%%%%%%%%%%%%%%%%       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i = 3  ->  Barbara 	%       % j = 0     -> No attack     %
%     4  ->  Trucks     %       %     1-6   -> 75% attack    %
%     5  ->  Cameraman  %       %     7-12  -> 50% attack    %
%     6  ->  Sailboat   %       %     13-18 -> 25% attack    %
%     7  ->  Goldhill   %       %     19-26 -> 10-75% attack %
%     8  ->  House      %       %     27    -> /             %
%     9  ->  Lake      	%       %     28    -> Spiral        %
%     10 ->  Mandril    %       %     29    -> X             %
%     11 ->  Peppers    %       %     30    -> \             %
%     12 ->  Pirate     %   	%                            %
%     13 ->  Plane      %       %                            %
%     14 ->  Blonde     %       %                            %
%%%%%%%%%%%%%%%%%%%%%%%%%       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[filepath,name,ext] = fileparts(listing(i).name);
disp("The " + name + " image selected");
h_img = imread(['data/Test image/' name ext]);                       %Reads the Host image 
h_img = imresize(h_img,[520 520]);
imgsize = size(h_img);
imwrite(uint8(h_img), ['results/' '1_resized_img_' name  ext ])
resized_img = uint8(h_img);
figure('Name','Resized Image');
imshow(resized_img)

%% Generate parts

T_L = h_img(1:260,1:260);           %Extracts the top-left quadrant of the image
T_R = h_img(1:260,261:520);         %Extracts the top-right quadrant of the image
B_L = h_img(261:520,1:260);         %Extracts the bottom-left quadrant of the image
B_R = h_img(261:520,261:520);       %Extracts the bottom-right quadrant of the image

% 16 parts of the original image
A1 = T_L(1:130,1:130); C1 = T_L(1:130,131:260); D1 = T_L(131:260,1:130); B1 = T_L(131:260,131:260);
D2 = T_R(1:130,1:130); B2 = T_R(1:130,131:260); A2 = T_R(131:260,1:130); C2 = T_R(131:260,131:260);
B3 = B_L(1:130,1:130); D3 = B_L(1:130,131:260); C3 = B_L(131:260,1:130); A3 = B_L(131:260,131:260);
C4 = B_R(1:130,1:130); A4 = B_R(1:130,131:260); B4 = B_R(131:260,1:130); D4 = B_R(131:260,131:260);


%% Generate block map

[blockmap,blockindex] = randarraygen(imgsize);    % Block map generate with rand array


%% Watermark generation and embedding process

%X1 = rb_embed(X1,X2,X3,X4,r1,r2,r3,r4,size) -> Embed recovery bits of regions X2,X3,X4 into X1 

%For A
A1 = rb_embed(A1,A2,A3,A4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),imgsize); 
A2 = rb_embed(A2,A1,A3,A4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),imgsize);
A3 = rb_embed(A3,A1,A2,A4,blockmap(:,5:6),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,7:8),imgsize);
A4 = rb_embed(A4,A1,A2,A3,blockmap(:,7:8),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),imgsize);

%For B
B1 = rb_embed(B1,B2,B3,B4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),imgsize);
B2 = rb_embed(B2,B1,B3,B4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),imgsize);
B3 = rb_embed(B3,B1,B2,B4,blockmap(:,5:6),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,7:8),imgsize);
B4 = rb_embed(B4,B1,B2,B3,blockmap(:,7:8),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),imgsize);

%For C
C1 = rb_embed(C1,C2,C3,C4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),imgsize);
C2 = rb_embed(C2,C1,C3,C4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),imgsize);
C3 = rb_embed(C3,C1,C2,C4,blockmap(:,5:6),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,7:8),imgsize);
C4 = rb_embed(C4,C1,C2,C3,blockmap(:,7:8),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),imgsize);

%For D
D1 = rb_embed(D1,D2,D3,D4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),imgsize);
D2 = rb_embed(D2,D1,D3,D4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),imgsize);
D3 = rb_embed(D3,D1,D2,D4,blockmap(:,5:6),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,7:8),imgsize);
D4 = rb_embed(D4,D1,D2,D3,blockmap(:,7:8),blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),imgsize);

r_bits_added_img = [A1,C1,D2,B2;D1,B1,A2,C2;B3,D3,C4,A4;C3,A3,B4,D4];

disp("rbits psnr: " + psnr(r_bits_added_img,resized_img) );

%% Embed Authentication

[wt_marked_img] = ab_embed(r_bits_added_img,blockindex,imgsize); %Embed authentication bits

imwrite(uint8(wt_marked_img), ['results/' name   '_watermarked' ext])  %Save Watermarked image
figure('Name','Watermarked Image');
imshow(uint8(wt_marked_img))

watermarkpsnr = psnr(uint8(wt_marked_img),resized_img);
watermarkssim = ssim(uint8(wt_marked_img),resized_img);

disp("The watermarked image PSNR : " + watermarkpsnr );
disp("The watermarked image SSIM : " + watermarkssim );


%% attack process

r_wt_marked_img = imread(['results/' name  '_watermarked' ext]);       %Read Watermarked image

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% j = 0     -> No attack
%     1-6   -> 75% attack
%     7-12  -> 50% attack
%     13-18 -> 25% attack
%     19-26 -> 10-75% attack
%     27    -> /
%     28    -> Spiral
%     29    -> X
%     30    -> \
%%%%%%%%%%%%%%%%%%%%%%%%%%%
attacked_img = applyattack(r_wt_marked_img,j);                         %Apply attack
imwrite(uint8(attacked_img), ['results/' name   '_attacked' ext])      %Write attacked image
figure('Name','Attacked Image');
imshow(uint8(attacked_img))
% figure
% imshow(uint8(attacked_img))


%% Detection of areas attacked in the image

r_attacked_img = imread(['results/' name  '_attacked' ext]);           %Read attacked image

r_TL = r_attacked_img(1:260,1:260);             %Extracts the top-left quadrant of the attacked image
r_TR = r_attacked_img(1:260,261:520);           %Extracts the top-right quadrant of the attacked image
r_BL = r_attacked_img(261:520,1:260);           %Extracts the bottom-left quadrant of the attacked image
r_BR = r_attacked_img(261:520,261:520);         %Extracts the bottom-right quadrant of the attacked image

% 16 parts of the attacked image
r_TL1 = r_TL(1:130,1:130); r_BL1 = r_TL(1:130,131:260); r_BR1 = r_TL(131:260,1:130); r_TR1 = r_TL(131:260,131:260);
r_BR2 = r_TR(1:130,1:130); r_TR2 = r_TR(1:130,131:260); r_TL2 = r_TR(131:260,1:130); r_BL2 = r_TR(131:260,131:260);
r_TR3 = r_BL(1:130,1:130); r_BR3 = r_BL(1:130,131:260); r_BL3 = r_BL(131:260,1:130); r_TL3 = r_BL(131:260,131:260);
r_BL4 = r_BR(1:130,1:130); r_TL4 = r_BR(1:130,131:260); r_TR4 = r_BR(131:260,1:130); r_BR4 = r_BR(131:260,131:260);


[tmpr_det_img,tampered_blocks] = tamperdetection(r_attacked_img,blockindex,imgsize);  %Tamper detected image

whitepixs = size(find(tmpr_det_img == 255));
blackpixs = size(find(tmpr_det_img == 0));
attackrate = blackpixs(1)/(blackpixs(1)+whitepixs(1))*100;                        %Calculation of attack rate

imwrite(uint8(tmpr_det_img), ['results/' name   '_tamper_detected' ext])          %Write tamper detected image 
figure('Name','Tamper Detected Image');
imshow(uint8(tmpr_det_img))
disp("The attack rate : " + attackrate + "%");

%Detection of tampered blocks
[t_b_A1 t_b_A2 t_b_A3 t_b_A4 t_b_B1 t_b_B2 t_b_B3 t_b_B4 t_b_C1 t_b_C2 t_b_C3 t_b_C4 t_b_D1 t_b_D2 t_b_D3 t_b_D4] = damagedblockfind(tampered_blocks);

%Detection of unrecoverable/recoverable tampered blocks
[ur_b_A1,r_b_A1] = blockdetection(t_b_A1,t_b_A2,t_b_A3,t_b_A4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_A2,r_b_A2] = blockdetection(t_b_A2,t_b_A1,t_b_A3,t_b_A4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_A3,r_b_A3] = blockdetection(t_b_A3,t_b_A2,t_b_A1,t_b_A4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8));
[ur_b_A4,r_b_A4] = blockdetection(t_b_A4,t_b_A2,t_b_A3,t_b_A1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2));
[ur_b_B1,r_b_B1] = blockdetection(t_b_B1,t_b_B2,t_b_B3,t_b_B4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_B2,r_b_B2] = blockdetection(t_b_B2,t_b_B1,t_b_B3,t_b_B4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_B3,r_b_B3] = blockdetection(t_b_B3,t_b_B2,t_b_B1,t_b_B4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8));
[ur_b_B4,r_b_B4] = blockdetection(t_b_B4,t_b_B2,t_b_B3,t_b_B1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2));
[ur_b_C1,r_b_C1] = blockdetection(t_b_C1,t_b_C2,t_b_C3,t_b_C4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_C2,r_b_C2] = blockdetection(t_b_C2,t_b_C1,t_b_C3,t_b_C4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_C3,r_b_C3] = blockdetection(t_b_C3,t_b_C2,t_b_C1,t_b_C4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8));
[ur_b_C4,r_b_C4] = blockdetection(t_b_C4,t_b_C2,t_b_C3,t_b_C1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2));
[ur_b_D1,r_b_D1] = blockdetection(t_b_D1,t_b_D2,t_b_D3,t_b_D4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_D2,r_b_D2] = blockdetection(t_b_D2,t_b_D1,t_b_D3,t_b_D4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8));
[ur_b_D3,r_b_D3] = blockdetection(t_b_D3,t_b_D2,t_b_D1,t_b_D4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8));
[ur_b_D4,r_b_D4] = blockdetection(t_b_D4,t_b_D2,t_b_D3,t_b_D1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2));

un_rec_blocks = [ur_b_A1; ur_b_A2; ur_b_A3; ur_b_A4; ur_b_B1; ur_b_B2; ur_b_B3; ur_b_B4; ur_b_C1; ur_b_C2; ur_b_C3; ur_b_C4; ur_b_D1; ur_b_D2; ur_b_D3; ur_b_D4];


%% Recovery
%X1 = recovery(r_b,X1,X2,X3,X4,r1,r2,r3,r4,t) -> Recovery X1 region from X2,X3,X4

%Recovery Process
rA1 = recovery(r_b_A1,r_TL1,r_TL2,r_TL3,r_TL4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),1);
rB1 = recovery(r_b_B1,r_TR1,r_TR2,r_TR3,r_TR4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),1);
rC1 = recovery(r_b_C1,r_BL1,r_BL2,r_BL3,r_BL4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),1);
rD1 = recovery(r_b_D1,r_BR1,r_BR2,r_BR3,r_BR4,blockmap(:,1:2),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,7:8),1);

rA2 = recovery(r_b_A2,r_TL2,r_TL1,r_TL3,r_TL4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),2);
rB2 = recovery(r_b_B2,r_TR2,r_TR1,r_TR3,r_TR4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),2);
rC2 = recovery(r_b_C2,r_BL2,r_BL1,r_BL3,r_BL4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),2);
rD2 = recovery(r_b_D2,r_BR2,r_BR1,r_BR3,r_BR4,blockmap(:,3:4),blockmap(:,1:2),blockmap(:,5:6),blockmap(:,7:8),2);

rA3 = recovery(r_b_A3,r_TL3,r_TL2,r_TL1,r_TL4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8),3);
rB3 = recovery(r_b_B3,r_TR3,r_TR2,r_TR1,r_TR4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8),3);
rC3 = recovery(r_b_C3,r_BL3,r_BL2,r_BL1,r_BL4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8),3);
rD3 = recovery(r_b_D3,r_BR3,r_BR2,r_BR1,r_BR4,blockmap(:,5:6),blockmap(:,3:4),blockmap(:,1:2),blockmap(:,7:8),3);

rA4 = recovery(r_b_A4,r_TL4,r_TL2,r_TL3,r_TL1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2),4);
rB4 = recovery(r_b_B4,r_TR4,r_TR2,r_TR3,r_TR1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2),4);
rC4 = recovery(r_b_C4,r_BL4,r_BL2,r_BL3,r_BL1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2),4);
rD4 = recovery(r_b_D4,r_BR4,r_BR2,r_BR3,r_BR1,blockmap(:,7:8),blockmap(:,3:4),blockmap(:,5:6),blockmap(:,1:2),4);

recovered_img = [rA1,rC1,rD2,rB2;rD1,rB1,rA2,rC2;rB3,rD3,rC4,rA4;rC3,rA3,rB4,rD4];

%If there ara unrecoverable blocks, calculate the median of blocks around this block
if (isempty(un_rec_blocks))

    imwrite(uint8(recovered_img), ['results/' name   '_recovered' ext])
    recovery_psnr = psnr(recovered_img,wt_marked_img);
    recovery_ssim = ssim(recovered_img,wt_marked_img); 
    figure('Name','Recovered Image');
    imshow(uint8(recovered_img))
   
else
    recovered_img2 = medyanblockrecovery(ur_b_A1,ur_b_A2,ur_b_A3,ur_b_A4,ur_b_B1,ur_b_B2,ur_b_B3,ur_b_B4,ur_b_C1,ur_b_C2,ur_b_C3,ur_b_C4,ur_b_D1,ur_b_D2,ur_b_D3,ur_b_D4,recovered_img);
    imwrite(uint8(recovered_img2), ['results/' name   '_recovered' ext])
    recovery_psnr = psnr(recovered_img2,wt_marked_img);
    recovery_ssim = ssim(recovered_img2,wt_marked_img); 
    figure('Name','Recovered Image');
    imshow(uint8(recovered_img2))
end


disp("The recovery PSNR : " + recovery_psnr );
disp("The recovery SSIM : " + recovery_ssim );
