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

% Alters the view of the 3D plot to isometric
axis equal;
view(3);

% Define the vertices of Object 3
% Read the vertices from the CSV file
% modeled in blender, and exported to a CSV file
% vTable = readtable("vertices.csv");

% Convert csv to table manually, as the csv file can not be submitted
vTable = table( ...
    [0; 2; 0; 2; 0; 1; 0; 1; 1; 2; 2; 1; 2; 2; 1; 1; 1; 1; 2; 2], ...
    [0; 0; 3; 3; 0; 3; 3; 0; 0; 0; 1; 1; 1; 2; 1; 2; 2; 3; 3; 2], ...
    [0; 0; 0; 0; 1; 1; 1; 1; 4; 4; 4; 4; 3; 3; 3; 3; 2; 2; 2; 2], ...
    'VariableNames', {'X', 'Y', 'Z'} ...
);

% Define the faces of the 3D object using the vertex indices
% Using cell array to store the faces, as each face can have a different number of vertices
faces = {...
    [0 1 3 2];...
    [16 19 18 17];...
    [14 12 13 15];...
    [8 9 10 11];...
    [0 1 9 8 7 4];...
    [10 11 14 12];...
    [13 15 16 19];...
    [18 17 5 6 2 3];...
    [0 4 6 2];...
    [5 7 8 11 14 15 16 17];...
    [1 3 18 19 13 12 10 9]...
};

% Draw the isometric drawing
for f = 1:length(faces)
    % Get the current face vertices
    faceVertices = faces{f} + 1; % Add 1 to convert from 0-based to 1-based indexing

    % Get the coordinates of the current face vertices
    x = vTable.X(faceVertices);
    y = vTable.Y(faceVertices);
    z = vTable.Z(faceVertices);

    % Plot the current face
    patch(x, y, z, 'b', 'FaceAlpha', 0.5); 
end