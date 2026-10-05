% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 3: Projectile Motion Simulation
% Lab Goal: To simulate the motion of a projectile launched at an angle with an initial velocity.

v0 = input('Enter the initial velocity v0 (m/s): ');
theta = input('Enter the launch angle theta (degrees): ');
g = input('Enter the gravitational acceleration g (m/s^2): ');

function [t, x, y] = projectile_motion(v0, theta, g)
    % confirm floating point inputs
    if ~isfloat(v0) || ~isfloat(theta) || ~isfloat(g)
        error('All inputs must be floating point numbers.');
    end

    % Convert angle to radians
    theta_rad = deg2rad(theta);
    
    % Calculate time of flight
    t_flight = (2 * v0 * sin(theta_rad)) / g;
    
    % Time vector
    t = linspace(0, t_flight, 100);
    
    % Calculate x and y positions
    x = v0 * cos(theta_rad) .* t;
    y = (v0 * sin(theta_rad) .* t) - (0.5 * g * t.^2);
end

