% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 10: Function Handles
% Lab Goal: Understanding and using function handles in MATLAB.
%           Process numerical data stored in a provided cell array
% Output: display and provide dataset after analysis

% Setup Lab
clear; clc;

% ask user for input: mathematical function
inputFunction = input('Enter a mathematical function (e.g., @(x,y) x.^2 + 2*x + y + 1): ', 's');

% convert input to function handle
functionHandle = str2func(['@(x,y)', inputFunction]);

% load in measurement data from provided cell array
data = load('QuestionB_measurements.mat');
measurements = data.measurements;

% examine contents: collect numeric vectors with atleast 20 elements into matrix
dataMatrix = [];
for i = 1:numel(measurements)
    if isvector(measurements{i}) && isnumeric(measurements{i}) && numel(measurements{i}) >= 20
        dataMatrix = [dataMatrix, measurements{i}(:)];
    end
end

% apply function handle to each pair of vectors n and n+1 and inc by 2 and store results
results = [];
for i = 1:2:size(dataMatrix, 2)-1
    results(:, end+1) = feval(functionHandle, dataMatrix(:,i), dataMatrix(:,i+1));
end

% alter and display resulting matrix with scientific notation with 2 decimal places and 12 char field limit
for i = 1:size(results, 1)
    fprintf('row %d: %s', i, sprintf('%12.2e', results(i,:)));
    fprintf('\n');
end

% using writematrix to form output txt file with results
outputFileName = 'results.txt';
fileID = fopen(outputFileName, 'w');
writematrix(results, outputFileName);
fclose(fileID);

% display number of proccessed vector pairs and dimensions of the resulting matrix
fprintf('Number of processed vector pairs: %d\n', size(results,2));
fprintf('Dimensions of the resulting matrix: %d x %d\n', size(results, 1), size(results, 2));