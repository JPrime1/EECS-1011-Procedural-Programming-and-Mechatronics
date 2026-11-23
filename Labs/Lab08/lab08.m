% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 8: Quiz
% Lab Goal: using solve() to solve equations and analyze the results.
% Output: output.txt file with the answers to the quiz questions.

% Setup Lab
clear; clc;

% setup variables
syms m1 m2 u1 u2 v1 v2

m1 = 2.0; 
m2 = 3.0;
u1 = 5.0;
u2 = 0.0;

% Conservation of linear motion equations ... FINAL EQUATION
eq1 = 5 == v2-v1;
eq2 = m1*u1 + m2*u2 == m1*v1 + m2*v2;

% solve for v1 and v2
S = solve([eq1, eq2], [v1, v2]);

% output text file
name = "Student Name: James Prime";
studentID = "Student ID: 215028657";
% open file for writing
fileID = fopen('output.txt', 'w');
% write to file 
fprintf(fileID, '%s\n', name);
fprintf(fileID, '%s\n\n', studentID);

% write up initial variables and values to the file
fprintf(fileID, 'Initial mass and velocities:\n');
fprintf(fileID, 'm1 = %.2f kg, m2 = %.2f kg\n', m1, m2);
fprintf(fileID, 'u1 = %.2f m/s, u2 = %.2f m/s\n\n', u1, u2);

fprintf(fileID, 'Initial Equations: m1*u1 + m2*u2 = m1*v1 + m2*v2\n');
fprintf(fileID, 'u1 - u2 = v2 - v1\n\n');
fprintf(fileID, 'Substituting values: %.2f*%.2f + %.2f*%.2f = %.2f*v1 + %.2f*v2\n', m1, u1, m2, u2, m1, m2);
fprintf(fileID, '%.2f - %.2f = v2 - v1\n\n', u1, u2);
fprintf(fileID, 'Solution: v1 = %.2f, v2 = %.2f\n', double(S.v1), double(S.v2));

% Close file
fclose(fileID);


