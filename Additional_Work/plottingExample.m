% lecture example for plotting and plotting parameters

clc, clear;
figure(1);
x = [1,2,3,4,5,6];
y = [12.5, 67, 2.8, 4.5, 7.8, 4.5];
plot(x,y,'r--o')

% learning to increment
figure(2);
a = [1:8];      % incrementing by 1
b = [1:2:15];   % incrementing by 2
plot(a,b,'g--o')

% plot sales data with years with dashed red line with markers
figure(3);
years = [1988:1994];
sales = [8,12,20,22,18,24,27]; % in millions
plot(years,sales,'r--o')

% more specific plotting parameters
figure(4);
c = [1:8];
d = [2,6,7,7,5,5,8,3];
plot(c,d,'r--o','LineWidth',2,'MarkerSize',12, 'MarkerFaceColor','y','MarkerEdgeColor','g')

% plot functions
figure(5);
x = [0:0.02:4];
y = exp(x);
plot(x,y);

figure(6);
y = 2*x.^2+3*x+5; % element-wise operations (think dot products)
plot(x,y);