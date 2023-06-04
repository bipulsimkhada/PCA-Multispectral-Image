% Reading hyperspectrial image 
image = '8band.tif';
img = imread(image);


% Coastal band [400–450 nm], 
% Blue [450–510 nm], 
% Green (510–580 nm)
% Yellow [585–625 nm], 
% Red [630–690 nm]
% Red-edge [705–745 nm] 
% Near-infrared 1, NIR1 [770–895 nm]
% Near-infrared 2, NIR2 [860–1040 nm] 

wl = [425, 480,  545, 605, 660, 725, 832.5, 950];

hcube = hypercube(img, wl);
img_rgb = (colorize(hcube,"Method","rgb"));
imshow(img_rgb)
title('RGB mapping of Spectrial Image');

%Reshaping 3D to 2D (flattern height and weight)
[h,w,d]=size(img);
M = double(reshape(img,h*w, d));
M_t = M.';


%Computing Covarance 
avg = double(mean(M));
avg_t= avg.';
cv = 1/(h*w)*(M_t*M)-(avg_t*avg);

%Computing eigan value and eigan vector
[V,D] = eig(cv);

%Sorting eiganvalue and eiganvector in decending order
[dd,ind] = sort(diag(D), 'descend');
Ds = D(ind,ind);
Vs = V(:,ind);

pc = M*Vs;
%Reconstruction of image from all 8 Principle Component 
re_pc = pc*Vs';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA');

%Reconstruction of image from 1st Principle Component 
re_pc = pc(:,1)*Vs(:,1)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 1');

%Reconstruction of image from 2nd Principle Component 
re_pc = pc(:,2)*Vs(:,2)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 2');

%Reconstruction of image from 3rd Principle Component 
re_pc = pc(:,3)*Vs(:,3)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 3');

%Reconstruction of image from 4th Principle Component 
re_pc = pc(:,4)*Vs(:,4)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 4');

%Reconstruction of image from 5th Principle Component 
re_pc = pc(:,5)*Vs(:,5)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 5');


%Reconstruction of image from 6th Principle Component 
re_pc = pc(:,6)*Vs(:,6)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 6');

%Reconstruction of image from 7th Principle Component 
re_pc = pc(:,7)*Vs(:,7)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 7');

%Reconstruction of image from 8th Principle Component 
re_pc = pc(:,8)*Vs(:,8)';
reimg_pc = int16(reshape(re_pc, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA 8');

%Reconstructing of image from highest 4 eigan values
re_pc1 = pc(:,[1:4])*Vs(:,[1:4])';
reimg_pc = int16(reshape(re_pc1, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA highest 4 Eigan value');

%Reconstructing of image from lowest 4 eigan values
re_pc2 = pc(:,[5:8])*Vs(:,[5:8])';
reimg_pc = int16(reshape(re_pc2, h,w,d));
re_hcube = hypercube(reimg_pc, wl);
reimg_rgb = colorize(re_hcube,"Method","rgb");
figure;imshow(reimg_rgb)
title('Reconstruction from PCA lowest 4 Eigan value');



