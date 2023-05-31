clc; clear; close all;f = 18;
%I = imread('hand3.bmp');
I = imread('leaf.tif');
s = size(I);
B = bwboundaries(I);  Bm = cell2mat(B);
figure(1);imshow(I);title('Original binary Image', fontsize=f);
boundary_im = zeros(s(1),s(2));
figure(2);imshow(boundary_im);hold on;
plot(Bm(:,2),Bm(:,1),'w',LineWidth=2);title('Boundary (extracted through bwboundaries())',fontsize=f);
x = Bm(:,2); y = Bm(:,1);
xm = mean(x); ym = mean(y);
cm = [xm, ym]; %centroid
c = [x, y];
%save('c_leaf.mat','c'); %uncomment this line to save data
cc = c - cm; %divergence
Cx = cov(cc); %covariance
[V, Cy] = eig(Cx);
A = V';
rot = [-1 0; 0 1]; %rotation matrix to make the rotation anti-clockwise
Arot = rot*A; 
Y = (A * cc')';
Y = Y+cm; %offset
figure(3);imshow(boundary_im);hold on;
plot(Y(:,1),Y(:,2),'w',LineWidth=2);title('Vertically aligned boundary (clockwise rotation)',fontsize=f);
y2 = (Arot * cc')';
y2 = y2+cm; %offset
figure(4);imshow(boundary_im);hold on;
plot(y2(:,1),y2(:,2),'w',LineWidth=2);title('Vertically aligned boundary (anti-clockwise rotation)',fontsize=f);
%save('y2_leaf.mat','y2'); %uncomment this line to save data

