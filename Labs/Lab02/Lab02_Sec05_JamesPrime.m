% Name: James Prime
% Student ID: 215028657
% Lab 02, Section 05

% Lab Objectives: Mastering Plotting and Data Visualization in MATLAB

% Initializing the workspace
clear; clc;
x = 0:pi/12:2*pi;
y1 = 2*sin(2*x);
y2 = cos(x)-1;

% Plotting both functions
hold on;
grid on;

plot(x, y1, 'b-*', LineWidth=2, MarkerSize=7);
plot(x, y2, 'p--r', LineWidth=1.5, MarkerSize=8);
xlabel('x (radians)');
ylabel('Function Value');
title('Trigonometric Functions');
legend('y_1 = 2sin(2x)', 'y_2 = cos(x) - 1', 'Location','best');

hold off;