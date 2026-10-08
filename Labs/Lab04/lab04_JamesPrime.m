% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 4: Conditional Statements
% Lab Goal: Getting familiar with conditional statements in MATLAB.
% INPUT: Given mass m and distance d; assume positive values for both.
% OUTPUT: Calculate Cost given the following inputs 

% Setup Lab
clear; clc;

% inputs
m = input('Enter the mass m (kg): ');
d = input('Enter the distance d (km): ');

% Calculate and output cost
cost = calculateCost(m, d);
fprintf('Your package mass is %.2f kg and distance is %.2f km.\nThe calculated cost is: %.2f\n', m, d, cost);

function output = calculateCost(m, d)
    % confirm floating point inputs and positive values
    if ~isfloat(m) || ~isfloat(d)
        error('All inputs must be floating point numbers.');
    elseif m <= 0 || d <= 0
        error('Mass and distance must be positive values.');
    end

    % setup cost variable
    cost = 0;

    % Calculate cost based on mass and distance
    if m <= 5
        if d<=20
            cost = 5 + 0.5*m; 
        else
            cost = 5 + 0.5*m + 0.1*(d-20);
        end
    else
        if d<=20
            cost = 8 + 0.8*m; 
        else
            cost = 8 + 0.8*m + 0.15*(d-20);
        end
    end
    
    % output the cost
    output = cost;  
end