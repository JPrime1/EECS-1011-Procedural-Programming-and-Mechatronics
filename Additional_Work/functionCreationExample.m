% in class example on learning function creation in MATLAB

% find x and y location and displacement of a particle moving in 2D space
% using initial velocity and angle of projection at some time t
function [x, y, r] = particlePosition(v0, theta,t)
    % Define the motion equations for x and y
    x = v0 * cos(theta) * t; % x position as a function of time
    y = v0 * sin(theta) * t - 0.5 * 9.81 * t.^2; % y position as a function of time
    
    % Calculate the displacement from the origin
    r = sqrt(x.^2 + y.^2);
end

% find volume and lateral surface area of a cone given radius and height
function [V, A] = coneProperties(r, h)
    % Calculate the volume of the cone
    V = (1/3) * pi * r^2 * h;
    
    % Calculate the lateral surface area of the cone
    l = sqrt(r^2 + h^2); % slant height
    A = pi * r * l;
end