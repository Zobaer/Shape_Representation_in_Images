clc; clear; close all; f=18;
I = im2double(imread('leaf.tif')); s = size(I);
figure(1);imshow(I);hold on; 
title('Original Image, Boundary & Ellipse Approximation', fontsize=f);
y = importdata('c_leaf.mat');
yflip = fliplr(y);
[Z, A, B, alpha]=fitellipse(yflip','linear');
T(1,1)=Z(2,1);
T(2,1)=Z(1,1);
plot(y(:,1),y(:,2),'r',LineWidth=2.4);
plotellipse(T,B,A,-alpha); 

%aligned
yalign = importdata('y2_leaf.mat');
yalignflip = fliplr(yalign);
boundary_im = zeros(s(1),s(2));
figure(2);imshow(boundary_im);hold on;
plot(yalign(:,1),yalign(:,2),'r',LineWidth=2.4);
title('Aligned boundary & Ellipse Approximation', fontsize=f);
[Z, A, B, alpha]=fitellipse(yalignflip','linear');
T(1,1)=Z(2,1);
T(2,1)=Z(1,1);
plotellipse(T,B,A,-alpha); 