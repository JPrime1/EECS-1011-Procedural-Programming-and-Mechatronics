% Name: James Prime
% Student ID: 215028657
% Assignment 9: Hydrometric Engineering Data

% Goal: To access, process, and analyze online hydrometric data
%       from four different water monitoring stations.
%       Calculate the mean and standard deviation of each station's
%       water level data and visualize the results.

% Procedure:
%   1. Define the URL components required to access hydrometric data.
%   2. Define the station IDs for the four assigned water monitoring stations.
%   3. Construct the URL for each station using string concatenation.
%   4. Retrieve the hydrometric data using webread().
%   5. Extract the water level data from each dataset.
%   6. Remove invalid data (NaN values).
%   7. Calculate the mean and standard deviation of each station.
%   8. Generate a plot displaying the original data, mean and standard deviation.
%   9. Repeat the process for all four stations.
%  10. Display the four plots for the assignment report.

% Challenges:
%   1. Constructing URLs using string concatenation.
%   2. Accessing online datasets using webread().
%   3. Extracting the required data from table/structure variables.
%   4. Handling invalid data (NaN values).
%   5. Calculating statistical properties of the datasets.
%   6. Displaying meaningful plots of the hydrometric data.

% Clear the workspace and command window
clear; clc;

% ========================================================================
% Main Portion
% ========================================================================

% Define URL components
% SET Hydro Stations ID's
stationIds = {'02HC028', '04CB001', '02HC024', '04FC001'};
baseUrl = 'https://dd.weather.gc.ca/today/hydrometric/csv/';
frequency = 'daily';
fileType = 'csv';

% Load data necessary from each station and extracting from stationIds
stationURL = 'https://dd.weather.gc.ca/today/hydrometric/doc/hydrometric_StationList.csv';
webStationData = webread(stationURL);
stations = webStationData(ismember(webStationData.ID, stationIds), :);

% Initialize variables for storing hydrometric data
hydrometricData = [];

% Initialize variables for storing mean and standard deviation values

% ========================================================================
% Data Collection and Analysis
% ========================================================================

% Iterate through each of the four hydrometric stations

    % STEP 1: Construct URL for the current station

    % STEP 2: Retrieve the hydrometric dataset using webread()

    % STEP 3: Extract water level data

    % STEP 4: Remove invalid data (NaN values)

    % STEP 5: Calculate mean water level

    % STEP 6: Calculate standard deviation

    % STEP 7: Generate sample number vector

    % STEP 8: Create plot

    % Plot original water level data

    % Plot average water level

    % Plot standard deviation

    % Add legend

    % Add title

    % Add axis labels

% End of loop

% ========================================================================
% Results
% ========================================================================

% Display the calculated mean and standard deviation for each station

% ========================================================================
% Plotting Functions
% ========================================================================

% Create a function for generating the hydrometric data plot

% Plot original data

% Plot average

% Plot standard deviation region

% Add plot labels, legend, and title

% ========================================================================
% Data Collection Functions
% ========================================================================
function hydrometricData = collectStationData(stationId, baseUrl, frequency, fileType)
    
end

function [meanValue, stdValue] = analyzeStationData(data)
    meanValue = mean(data);
    stdValue = std(data);
end

function cleanData = removeInvalidData(data)
    cleanData = data(~isnan(data));
end