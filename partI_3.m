clc; clear; close all; f=20;
I = imread('airplane.bmp'); s = size(I);
y = importdata('c.mat');
N = length(y);
K = 2; %downsampling factor
%M = N/50; %number of points
yc = y(:,1) + 1i*y(:,2);
fd = fft(yc);
fs = downsample(fd,K);
Sc = (1/K)*ifft(fs);
Z = zeros(length(Sc),2); Z(:,1) = real(Sc); Z(:,2) = imag(Sc);
boundary_im = zeros(s(1),s(2));figure(1);imshow(boundary_im);hold on;
plot(Z(:,1),Z(:,2),'w',LineWidth=2);title(sprintf('M = N/%d',K),FontSize=f);

