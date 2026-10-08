% Name: James Prime
% Student ID: 215028657
% Assignment 3: Isometric Drawing in MATLAB

% Goal: To create an isometric drawing of a 3D object using MATLAB.
% Procedure:
%   1. Define the vertices of the 3D object.
%   2. Apply isometric transformation to the vertices.
%   3. Connect the transformed vertices to form the isometric drawing.

% Challenges:
%   1. Understanding how to define the vertices of a 3D object in MATLAB.
%   2. Ordering the vertices correctly to form the faces of the object.

% Clear the workspace and command window
clear; clc;

% Define the vertices of Object 3
% Read the vertices from the CSV file
% modeled in blender, and exported to a CSV file
vTable = readtable("vertices.csv");

% With 3 seperate forloops, we can plot the 3D object in isometric view

% xyPlane : going from the bottom of the object, to the top of the object
for z = 0:max(vTable.Z)
    % Get the vertices at the current z level
    xyVertices = vTable(vTable.Z == z, :);

    % Due to ordering problems, we need to sort the vertices with boundary points
    % Due to convex hull removing the inner points
    k = boundary(xyVertices.X, xyVertices.Y,0.5);
    xyVertices = xyVertices(k, :);

    % Plot the vertices in the xy-plane
    patch(xyVertices.X, xyVertices.Y, xyVertices.Z, 'b', 'FaceAlpha', 0.5); 
end

% xzPlane : going from the front of the object, to the back of the object
for y = 0:max(vTable.Y)
    % Get the vertices at the current y level
    xzVertices = vTable(vTable.Y == y, :);

    % Due to ordering problems, we need to sort the vertices with boundary points
    % Due to convex hull removing the inner points
    k = boundary(xzVertices.X, xzVertices.Z,0.5);
    xzVertices = xzVertices(k, :);

    % Plot the vertices in the xz-plane
    patch(xzVertices.X, xzVertices.Y, xzVertices.Z, 'r', 'FaceAlpha', 0.5); 
end

% yzPlane : going from the left of the object, to the right of the object
for x = 0:max(vTable.X)
    % Get the vertices at the current x level
    yzVertices = vTable(vTable.X == x, :);

    % Due to ordering problems, we need to sort the vertices with boundary points
    % Due to convex hull removing the inner points
    k = boundary(yzVertices.Y, yzVertices.Z,0.5);
    yzVertices = yzVertices(k, :);

    % Plot the vertices in the yz-plane
    patch(yzVertices.X, yzVertices.Y, yzVertices.Z, 'g', 'FaceAlpha', 0.5); 
end

% Alters the view of the 3D plot to isometric
axis equal;
view(3);