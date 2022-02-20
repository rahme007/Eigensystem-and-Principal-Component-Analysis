close all;
im1 = imread('14NOV27004452-M2AS-054191978040_01_P001-BROWSE.jpg');
im2 = imread('14NOV27004452-M2AS-054191978040_01_P001.tif');
%figure,imshow(im1)
[r,c,b] = size(im2);
im_r = im1(:,:,1);
im2 = double(im2);
im_c = reshape(im2(:,:,1),r*c,1);
I = [im_c reshape(im2(:,:,2),r*c,1) reshape(im2(:,:,3),r*c,1)...
    reshape(im2(:,:,4),r*c,1) reshape(im2(:,:,5),r*c,1) ...
    reshape(im2(:,:,6),r*c,1) reshape(im2(:,:,7),r*c,1)...
    reshape(im2(:,:,8),r*c,1)];
%I = reshape(im2,[],8);
%figure, imshow(im2)
m = mean(I);
cx = cov(I); %(I'*I)/size(I,1) - (m'*m); 
[v d] = eig(cx);
pcaRes = pca(I);
pcaComp = I * pcaRes;
pca1=uint8((pcaComp(:,1)-min(pcaComp(:,1)))*255/(max(pcaComp(:,1))-min(pcaComp(:,1))));
pca2=uint8((pcaComp(:,2)-min(pcaComp(:,2)))*255/(max(pcaComp(:,2))-min(pcaComp(:,2))));
pca3=uint8((pcaComp(:,3)-min(pcaComp(:,3)))*255/(max(pcaComp(:,3))-min(pcaComp(:,3))));
pca4=uint8((pcaComp(:,4)-min(pcaComp(:,4)))*255/(max(pcaComp(:,4))-min(pcaComp(:,4))));
pca5=uint8((pcaComp(:,5)-min(pcaComp(:,5)))*255/(max(pcaComp(:,5))-min(pcaComp(:,5))));
pca6=uint8((pcaComp(:,6)-min(pcaComp(:,6)))*255/(max(pcaComp(:,6))-min(pcaComp(:,6))));
pca7=uint8((pcaComp(:,7)-min(pcaComp(:,7)))*255/(max(pcaComp(:,7))-min(pcaComp(:,7))));
pca8=uint8((pcaComp(:,8)-min(pcaComp(:,8)))*255/(max(pcaComp(:,8))-min(pcaComp(:,8))));

%% Reconstruction of Image
pcaColor = pcaComp*inv(pcaRes);

pcaC1=uint8(pcaColor(:,1)*255/(max(pcaColor(:,1))-min(pcaColor(:,1))));
pcaC2=uint8(pcaColor(:,2)*255/(max(pcaColor(:,2))-min(pcaColor(:,2))));
pcaC3=uint8(pcaColor(:,3)*255/(max(pcaColor(:,3))-min(pcaColor(:,3))));
pcaC4=uint8(pcaColor(:,4)*255/(max(pcaColor(:,4))-min(pcaColor(:,4))));
pcaC5=uint8(pcaColor(:,5)*255/(max(pcaColor(:,5))-min(pcaColor(:,5))));
pcaC6=uint8(pcaColor(:,6)*255/(max(pcaColor(:,6))-min(pcaColor(:,6))));
pcaC7=uint8(pcaColor(:,7)*255/(max(pcaColor(:,7))-min(pcaColor(:,7))));
pcaC8=uint8(pcaColor(:,8)*255/(max(pcaColor(:,8))-min(pcaColor(:,8))));

%pcaFullColor = reshape([pcaC1;pcaC2;pcaC3], r,c,b);

%One Component at a time

%First Component at a time
pcaRec = zeros(size(pcaComp));
pcaRec(:,1) = pcaComp(:,1);
pcaColor = pcaRec/(pcaRes);
pcaFullColor = uint8((pcaColor-min(pcaColor(:)))*255/(max(pcaColor(:))-min(pcaColor(:))));

figure;imshow(reshape(pcaFullColor(:,1), r,c,1));

%One Component at a time
pcaRec = zeros(size(pcaComp));
pcaRec(:,2) = pcaComp(:,2);
pcaColor = pcaRec/(pcaRes);
pcaFullColor = uint8((pcaColor-min(pcaColor(:)))*255/(max(pcaColor(:))-min(pcaColor(:))));

figure;imshow(reshape(pcaFullColor(:,2), r,c,1));

%One Component at a time
pcaRec = zeros(size(pcaComp));
pcaRec(:,3) = pcaComp(:,3);
pcaColor = pcaRec/(pcaRes);
pcaFullColor = uint8((pcaColor-min(pcaColor(:)))*255/(max(pcaColor(:))-min(pcaColor(:))));

figure;imshow(reshape(pcaFullColor(:,3), r,c,1));


% eigenvectors with the highest 4 eigenvalues

% A_H = [v(:,8)'; v(:,7)'; v(:,6)'; v(:,5)'];
% %A_H = [v(:,8)'; v(:,7)'];
% %A_H = [v(:,8)'; v(:,7)'; v(:,6)'; v(:,5)'; v(:,1)'; v(:,2)'; v(:,3)'; v(:,4)'];
% Y_H =  A_H*(I - repmat(m,size(I,1),1))';  %A_H*(I - m)' ;
% I_recH = (A_H' *Y_H)'+repmat(m,size(I,1),1);  % (A_H' *Y_H)'+ m;
% Ir_H(:,:,1) = reshape(I_recH(:,1), r, c);
% Ir_H(:,:,2) = reshape(I_recH(:,2), r, c);
% Ir_H(:,:,3) = reshape(I_recH(:,3), r, c);
% Ir_H(:,:,4) = reshape(I_recH(:,4), r, c);
% Ir_H(:,:,5) = reshape(I_recH(:,5), r, c);
% Ir_H(:,:,6) = reshape(I_recH(:,6), r, c);
% Ir_H(:,:,7) = reshape(I_recH(:,7), r, c);
% Ir_H(:,:,8) = reshape(I_recH(:,8), r, c);
% figure,imshow(mat2gray(cat(3,Ir_H(:,:,5),Ir_H(:,:,3),Ir_H(:,:,2))))

% eigenvectors with the lowest 4 eigenvalues

A_L = [v(:,1)'; v(:,2)'; v(:,3)'; v(:,4)'];
A_L = [v(:,1)';v(:,2)'];
Y_L = A_L*(I - repmat(m,size(I,1),1))'; %A_L*(I - m)';
I_recL = (A_L' *Y_L)'+repmat(m,size(I,1),1); %(A_L' *Y_L)' + m;
Ir_L(:,:,1) = reshape(I_recL(:,1), r, c);
Ir_L(:,:,2) = reshape(I_recL(:,2), r, c);
Ir_L(:,:,3) = reshape(I_recL(:,3), r, c);
Ir_L(:,:,4) = reshape(I_recL(:,4), r, c);
Ir_L(:,:,5) = reshape(I_recL(:,5), r, c);
Ir_L(:,:,6) = reshape(I_recL(:,6), r, c);
Ir_L(:,:,7) = reshape(I_recL(:,7), r, c);
Ir_L(:,:,8) = reshape(I_recL(:,8), r, c);
%figure,imshow(mat2gray(Ir_L(:,:,1)))
figure,imshow(mat2gray(cat(3,Ir_L(:,:,5),Ir_L(:,:,3),Ir_L(:,:,2))))
% 
% %% Subtraction of Original Image
% I_subH = Ir_H - im2;
% I_subL = Ir_L - im2;
% figure, imshow(mat2gray(I_subH(:,:,1)))
% figure,imshow(mat2gray(I_subL(:,:,1)))