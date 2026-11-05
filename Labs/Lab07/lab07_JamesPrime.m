% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 7: Matrix Operations and Contour Plotting
% Lab Goal: analyze and visualize data using matrix operations and contour plotting techniques.
% INPUT: No Input required from the user
% OUTPUT: Plot 2D contour plots with color bar, and output analysis to console.

% Setup Lab
clear; clc;

% Setup Variables
x = linspace(-1, 1, 101);
y = linspace(-0.8, 0.8, 81);

k = 10;
a = 0.3;
b = 0.08;

% Nested for loop to calculate electric potential at each point in the grid
V = zeros(length(y), length(x)); % Preallocate V for efficiency

for i = 1:length(y)
    for j = 1:length(x)
        % Calculate the electric potential at each point (x(j), y(i))
        root1 = sqrt((x(j) + a)^2 + y(i)^2 + b^2);
        root2 = sqrt((x(j) - a)^2 + y(i)^2 + b^2);

        V(i, j) = k * (1/root1 - 1/root2);
    end
end

% analyze the matrix V to find the maximum, minimum, mean, and standard deviation values
% flatten the matrix V into a vector for analysis
V_max = max(V(:)); 
V_min = min(V(:));
V_mean = mean(V(:));
V_std = std(V(:));

% Display the matrix dimensions
fprintf('The dimensions of the matrix V are: %d rows and %d columns\n\n', size(V, 1), size(V, 2));

% Display the analyzed values
fprintf('Maximum value: %.2f\n', V_max);
fprintf('Minimum value: %.2f\n', V_min);
fprintf('Mean value: %.2f\n', V_mean);
fprintf('Standard deviation: %.2f\n\n', V_std);

% Determine the col/row indices and x, y coordinates of all global maxima and minima in the matrix V
[maxRow, maxCol] = find(V == V_max);
[minRow, minCol] = find(V == V_min);

% Display the indices and coordinates of the global maxima and minima
fprintf('Index of global maximum: Row %d, Column %d\n', maxRow, maxCol);
fprintf('Index of global minimum: Row %d, Column %d\n', minRow, minCol);
fprintf('Coordinates of global maximum: x = %.2f, y = %.2f\n', x(maxCol), y(maxRow));
fprintf('Coordinates of global minimum: x = %.2f, y = %.2f\n', x(minCol), y(minRow));

% Create a contour plot of the electric potential with contourf
figure;
contourf(x, y, V, 20); % 20 contour levels

% Add labels and title to the contour plot
xlabel('x (m)');
ylabel('y (m)');
title('Electric Potential Contour Plot');
colorbar; % Add a color bar to show the potential values

% mark extrema
hold on;
plot(x(maxCol), y(maxRow), 'r*', 'MarkerSize', 10, 'LineWidth', 2); % Mark global maximum
plot(x(minCol), y(minRow), 'b*', 'MarkerSize', 10, 'LineWidth', 2); % Mark global minimum
hold off;
