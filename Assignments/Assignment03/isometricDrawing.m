% Name: James Prime
% Student ID: 215028657
% Assignment 3: Isometric Drawing in MATLAB

% Goal: To create an isometric drawing of a 3D object using MATLAB.
% Procedure:
%   1. Define the vertices of the 3D object.
%   2. Apply isometric transformation to the vertices.
%   3. Connect the transformed vertices to form the isometric drawing.

% Clear the workspace and command window
clear; clc;

% Define Top Wall Vertices
topWallA =  [0 1 1 0; 
             0 0 3 3;
             1 1 1 1;];
topWallB =  [1 2 2 1;
             0 0 1 1;
             4 4 4 4;];
topWallC =  [1 2 2 1;
             1 1 2 2;
             3 3 3 3;];
topWallD =  [1 2 2 1;
             2 2 3 3;
             2 2 2 2;];

% Define XZ-Plane Wall Vertices
xzWallA =  [0 2 2 0; 
            0 0 0 0;
            0 0 1 1;];
xzWallB =  [1 2 2 1;
            0 0 0 0;
            1 1 4 4;];

xzWall  =  [0 2 2 1 1 0;
            0 0 0 0 0 0;
            0 0 4 4 1 1;];            

% Define YZ-Plane Wall Vertices
yzWallA =  [0 0 0 0;
            0 0 3 3;
            0 1 1 0;];
yzWallB =  [1 1 1 1;
            0 0 3 3;
            1 2 2 1;];
yzWallC =  [1 1 1 1;
            0 0 2 2;
            2 3 3 2;];
yzWallD =  [1 1 1 1;
            0 0 1 1;
            3 4 4 3;];

yzWallBCD = [1 1 1 1 1 1 1 1;
             0 0 1 1 2 2 3 3;
             1 4 4 3 3 2 2 1;];

% Draw the isometric drawing
hold on;
% TOP WALLS
patch(topWallA(1,:), topWallA(2,:), topWallA(3,:), 'y', 'FaceAlpha', 0.5);
patch(topWallB(1,:), topWallB(2,:), topWallB(3,:), 'y', 'FaceAlpha', 0.5);
patch(topWallC(1,:), topWallC(2,:), topWallC(3,:), 'y', 'FaceAlpha', 0.5);
patch(topWallD(1,:), topWallD(2,:), topWallD(3,:), 'y', 'FaceAlpha', 0.5);

% XZ-PLANE WALLS
% patch(xzWallA(1,:), xzWallA(2,:), xzWallA(3,:), 'c', 'FaceAlpha', 0.5);
% patch(xzWallB(1,:), xzWallB(2,:), xzWallB(3,:), 'c', 'FaceAlpha', 0.5);
patch(xzWall(1,:), xzWall(2,:), xzWall(3,:), 'c', 'FaceAlpha', 0.5);

% YZ-PLANE WALLS
patch(yzWallA(1,:), yzWallA(2,:), yzWallA(3,:), 'r', 'FaceAlpha', 0.5);
patch(yzWallBCD(1,:), yzWallBCD(2,:), yzWallBCD(3,:), 'r', 'FaceAlpha', 0.5);
% patch(yzWallB(1,:), yzWallB(2,:), yzWallB(3,:), 'r', 'FaceAlpha', 0.5);
% patch(yzWallC(1,:), yzWallC(2,:), yzWallC(3,:), 'r', 'FaceAlpha', 0.5);
% patch(yzWallD(1,:), yzWallD(2,:), yzWallD(3,:), 'r', 'FaceAlpha', 0.5);

% Alters the view of the 3D plot to isometric
axis equal;
view(3);