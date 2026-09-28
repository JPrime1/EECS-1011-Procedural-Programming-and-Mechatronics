clear; clc;
disp("This program calculates the kinetic energy and momentum " + ...
    "of a moving object and saves the results to an external text file.")
% Given data
mass = input("Enter the object mass in kg: ");            
initialVelocity = input("Enter the object initial velocity in m/s: ");
acceleration = input("Enter the object acceleration in m/s^2: ");

% Call the first local function
[KE, p] = motionCalc(mass, initialVelocity, acceleration);

% Call the second local function
saveResults(KE, p);

% Local Function 1
function [KE, p] = motionCalc(mass, initialVelocity, acceleration)
    t = 5;
    % Calculate velocity
    v = initialVelocity + acceleration * t;
    % Calculate kinetic energy
    KE = 0.5 * mass * v^2;
    % Calculate momentum
    p = mass * v;
end

% Local Function 2
function saveResults(KE, p)
    % Open an external text file
    fileID = fopen('results.txt', 'w');
    % Write the results in scientific notation
    fprintf(fileID, 'Kinetic Energy = %.4e J\n', KE);
    fprintf(fileID, 'Momentum = %.4e kg*m/s\n', p);
    % Close the file
    fclose(fileID);
end