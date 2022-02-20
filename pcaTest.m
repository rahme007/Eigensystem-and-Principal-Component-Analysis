%% PCA testing to check the image
img = imread('14NOV27004452-M2AS-054191978040_01_P001-BROWSE.jpg');
[h,w,c]=size(img);

r=img(:,:,1); g=img(:,:,2); b=img(:,:,3);

imgVec = [reshape(r,1,[])', reshape(g,1,[])', reshape(b,1,[])'];

pcaRes = pca(double(imgVec));

pcaComp = double(imgVec)*pcaRes;

pca1=uint8((pcaComp(:,1)-min(pcaComp(:,1)))*255/(max(pcaComp(:,1))-min(pcaComp(:,1))));
pca2=uint8((pcaComp(:,2)-min(pcaComp(:,2)))*255/(max(pcaComp(:,2))-min(pcaComp(:,2))));
pca3=uint8((pcaComp(:,3)-min(pcaComp(:,3)))*255/(max(pcaComp(:,3))-min(pcaComp(:,3))));

figure;imshow(img)
figure;imshow(reshape(pca1,h,w))
figure;imshow(reshape(pca2,h,w))
figure;imshow(reshape(pca3,h,w))

%Reconstruct on color

pcaColor = pcaComp*inv(pcaRes);

pcaC1=uint8(pcaColor(:,1)*255/(max(pcaColor(:,1))-min(pcaColor(:,1))));
pcaC2=uint8(pcaColor(:,2)*255/(max(pcaColor(:,2))-min(pcaColor(:,2))));
pcaC3=uint8(pcaColor(:,3)*255/(max(pcaColor(:,3))-min(pcaColor(:,3))));

pcaFullColor = reshape([pcaC1;pcaC2;pcaC3], h,w,c);
figure;imshow(pcaFullColor);

%pcaFullColor = uint8((pcaColor-min(pcaColor(:)))*255/(max(pcaColor(:))-min(pcaColor(:))));
%imshow(reshape(pcaFullColor, h,w,c));

%One Component at a time
pcaRec = zeros(size(pcaComp));
pcaRec(:,1) = pcaComp(:,1);
pcaColor = pcaRec/(pcaRes);
pcaFullColor = uint8((pcaColor-min(pcaColor(:)))*255/(max(pcaColor(:))-min(pcaColor(:))));
figure;imshow(reshape(pcaFullColor, h,w,c));
