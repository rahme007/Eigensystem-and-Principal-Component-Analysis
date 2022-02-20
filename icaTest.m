% demo for selecting one component at a time from the color image
[h,w,c]=size(img);

r=img(:,:,1); g=img(:,:,2); b=img(:,:,3);

imgVec = [reshape(r,1,[])', reshape(g,1,[])', reshape(b,1,[])'];

[icaA, icaW] = fastica(imgVec');
indComp = icaW*double(imgVec');

ica1=uint8((indComp(1,:)-min(indComp(1,:)))*255/(max(indComp(1,:))-min(indComp(1,:))));
ica2=uint8((indComp(2,:)-min(indComp(2,:)))*255/(max(indComp(2,:))-min(indComp(2,:))));
ica3=uint8((indComp(3,:)-min(indComp(3,:)))*255/(max(indComp(3,:))-min(indComp(3,:))));

figure;imshow(img)
figure;imshow(reshape(ica1,h,w))
figure;imshow(reshape(ica2,h,w))
figure;imshow(reshape(ica3,h,w))

%Reconstruct on color

icaColor = icaA*indComp;

icaC1=uint8(icaColor(1,:)*255/(max(icaColor(1,:))-min(icaColor(1,:))));
icaC2=uint8(icaColor(2,:)*255/(max(icaColor(2,:))-min(icaColor(2,:))));
icaC3=uint8(icaColor(3,:)*255/(max(icaColor(3,:))-min(icaColor(3,:))));

icaFullColor = reshape([icaC1';icaC2';icaC3'], h,w,c);
figure;imshow(icaFullColor);

%icaFullColor = uint8((icaColor-min(icaColor(:)))*255/(max(icaColor(:))-min(icaColor(:))));
%imshow(reshape(icaFullColor', h,w,c));

%One Component at a time
icaRec = zeros(size(indComp));
icaRec(1,:) = indComp(1,:);
icaColor = icaA*icaRec;
icaFullColor = uint8((icaColor-min(icaColor(:)))*255/(max(icaColor(:))-min(icaColor(:))));
figure;imshow(reshape(icaFullColor', h,w,c));
