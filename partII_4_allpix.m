clc; clear; close all; f = 20;
I = imread("em4embryo.bmp");
s = size(I);
J = imbinarize(I,0.5);
E = strel("disk",1);
B = imerode(J,E);C = imdilate(B,E);
[L,num]=bwlabel(C,8);
B = bwboundaries(C);
Bm = cell2mat(B);
boundary_im = zeros(s(1),s(2));

figure(2);imshow(boundary_im);hold on;
for ii=1:num
    A = zeros(s); A(find(L==ii))=1;
    [xx yy] = find(L==ii);
    x = yy; y = xx;
    xm = mean(x); ym = mean(y);
    cm = [xm, ym]; %centroid
    c = [x, y];
    cc = c - cm; %divergence
    Cx = cov(cc); %covariance
    [V, Cy] = eig(Cx);
    AA = V'; 
    Y = (AA * cc')';
    Y = Y+cm; %offset
    figure(2); plot(Y(:,1),Y(:,2),'w',LineWidth=2);title('Vertically aligned',fontsize=f);
end






