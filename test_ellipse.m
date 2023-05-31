clc; clear; close all;

I=zeros(500,500);

I(50,300)=1;
I(50,50)=1;
I(450,450)=1;
I(300,50)=1;
%
st=strel('square',10);
J=imdilate(I,st);

figure(1),imshow(J);
hold on;

[xp yp]=find(J==1);

X(1,:)=xp;  
X(2,:)=yp;
[Sx Sy]=size(J);

[Z A B alpha]=fitellipse(X,'linear');
T(1,1)=Z(2,1);
T(2,1)=Z(1,1);

plotellipse(T,B,A,-alpha); 