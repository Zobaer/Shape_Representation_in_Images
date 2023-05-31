clc; clear; close all; f=20;
I = imread('leaf.tif'); s = size(I);
y = importdata('c_leaf.mat');
P = [2 5 10 15 20 30 40 45 50 60 75 85 100 150 200];
yc = y(:,1) + 1i*y(:,2);
fd = fft(yc);
for k = 1:length(P)
    fs = fd;
    fs(P(k)+1:length(fs)-P(k)) = 0;
    Sc = ifft(fs);
    Z = zeros(size(y));
    Z(:,1) = real(Sc); Z(:,2) = imag(Sc);
    boundary_im = zeros(s(1),s(2));
    if k<=10
        figure(1); subplot(2,5,k);
    end
%     if k>=6 && k<=10
%         figure(2); subplot(1,5,k-5);
%     end
    if k>=11 && k<=15
        figure(3); subplot(1,5,k-10);
    end
    imshow(boundary_im);hold on;
    plot(Z(:,1),Z(:,2),'w',LineWidth=2);
    title(sprintf('P = %d',P(k)),FontSize=f);
end
