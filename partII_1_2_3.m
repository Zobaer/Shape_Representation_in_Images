clc; clear; close all; f = 20;
I = imread("em1embryo.bmp");
s = size(I);
figure(1); imshow(I);title("Original image",fontsize=f);
J = imbinarize(I,0.5);
figure(2); imshow(J);title("Binarized image",fontsize=f);
E = strel("disk",3);
B = imerode(J,E);C = imdilate(B,E);
figure(3); imshow(C);
title("Binarized image after morphological processing",fontsize=f);
[L,num]=bwlabel(C,8);num
B = bwboundaries(C);
Bm = cell2mat(B);
figure(4);imshow(C);hold on;
boundary_im = zeros(s(1),s(2));
figure(4);plot(Bm(:,2),Bm(:,1),'r.',LineWidth=2);title('Boundaries marked',fontsize=f);
figure(5);imshow(C);hold on;title('Ellipse approximation',fontsize=f);
area = zeros(1,num);
pixcount = zeros(1,num);
for ii = 1:num
    A = zeros(s); A(find(L==ii))=1;
    pixcount(ii) = sum(A(:));
    B = bwboundaries(A);
    Bm = cell2mat(B);
    boundary_im = zeros(s(1),s(2));
    [Z, A, B, alpha]=fitellipse(Bm','linear');
    T(1,1)=Z(2,1);
    T(2,1)=Z(1,1);
    plotellipse(T,B,A,-alpha); hold on;
    area(ii) = pi*A*B;
end
area
avg_area_ellipse = mean(area)
pixcount
avg_area_pixel = mean(pixcount)


