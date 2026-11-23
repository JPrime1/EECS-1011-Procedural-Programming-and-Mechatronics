% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 9: Quiz
% Lab Goal: using readmatrix() to import data from txt file, and perform statistical analysis.
% Output: display statistical results, and plot scatter and bar plots in seperate subplots.

% Setup Lab
clear; clc;

% setup variables
data = readmatrix('SolarPanelData.txt');

% seperate data into 3 columns
SolarIrradiance_Wm2 = data(:, 1);
PanelTemperature_C = data(:, 2);
Power_W = data(:, 3);

% calculate statistical values: Mean, min, max, and standard deviation
meanIrradiance = mean(SolarIrradiance_Wm2);
meanTemperature = mean(PanelTemperature_C);
meanPower = mean(Power_W);

minIrradiance = min(SolarIrradiance_Wm2);
minTemperature = min(PanelTemperature_C);
minPower = min(Power_W);

maxIrradiance = max(SolarIrradiance_Wm2);
maxTemperature = max(PanelTemperature_C);
maxPower = max(Power_W);

stdIrradiance = std(SolarIrradiance_Wm2);
stdTemperature = std(PanelTemperature_C);
stdPower = std(Power_W);

% output statistical results to command window
fprintf('Statistical Analysis of Solar Panel Data:\n');
fprintf('Mean Solar Irradiance: %.2f W/m^2\n', meanIrradiance);
fprintf('Mean Panel Temperature: %.2f °C\n', meanTemperature);
fprintf('Mean Power Output: %.2f W\n\n', meanPower);

fprintf('Minimum Solar Irradiance: %.2f W/m^2\n', minIrradiance);
fprintf('Minimum Panel Temperature: %.2f °C\n', minTemperature);
fprintf('Minimum Power Output: %.2f W\n\n', minPower);

fprintf('Maximum Solar Irradiance: %.2f W/m^2\n', maxIrradiance);
fprintf('Maximum Panel Temperature: %.2f °C\n', maxTemperature);
fprintf('Maximum Power Output: %.2f W\n\n', maxPower);

fprintf('Standard Deviation of Solar Irradiance: %.2f W/m^2\n', stdIrradiance);
fprintf('Standard Deviation of Panel Temperature: %.2f °C\n', stdTemperature);
fprintf('Standard Deviation of Power Output: %.2f W\n\n', stdPower);

% find top 3 highest power output values and their corresponding solar irradiance and panel temperature
[sortedPower, sortedIndices] = sort(Power_W, 'descend');
topThreePower = sortedPower(1:3);
topThreeIrradiance = SolarIrradiance_Wm2(sortedIndices(1:3));
topThreeTemperature = PanelTemperature_C(sortedIndices(1:3));

fprintf('Top 3 Highest Power Output Values:\n');
for i = 1:3
    fprintf('Index: %d, Power Output: %.2f W, Solar Irradiance: %.2f W/m^2, Panel Temperature: %.2f °C\n', ...
        sortedIndices(i), topThreePower(i), topThreeIrradiance(i), topThreeTemperature(i));
end
fprintf('\n');

% Conditional Analysis: Count how many times the solar irradiance exceeds 700 W/m^2
countExceed700Wm2 = sum(SolarIrradiance_Wm2 > 700);
fprintf('Percentage of times Solar Irradiance exceeds 700 W/m^2: %.2f%%\n', (countExceed700Wm2 / length(SolarIrradiance_Wm2)) * 100);
avgExceed700W = mean(SolarIrradiance_Wm2(SolarIrradiance_Wm2 > 700));
fprintf('Average Solar Irradiance when exceeding 700 W/m^2: %.2f W/m^2\n\n', avgExceed700W);

% Create scatter plot of Solar Irradiance vs Power Output
figure;
subplot(2, 1, 1);
scatter(Power_W, SolarIrradiance_Wm2, 'filled');
title('Scatter Plot of Solar Irradiance vs Power Output');
xlabel('Power Output (W)');
ylabel('Solar Irradiance (W/m^2)');

% Create bar plot showing the count of measurements within specific ranges of solar irradiance
% ranges: 0-300, 300-600, 600-900, >900 W/m^2
counts = [  sum(SolarIrradiance_Wm2 <= 300), ...
            sum(SolarIrradiance_Wm2 > 300 & SolarIrradiance_Wm2 <= 600), ...
            sum(SolarIrradiance_Wm2 > 600 & SolarIrradiance_Wm2 <= 900), ...
            sum(SolarIrradiance_Wm2 > 900)];
categories = categorical({'0-300','300-600','600-900','>900'});
subplot(2, 1, 2);
bar(categories, counts);
title('Count of Measurements within Solar Irradiance Ranges');
xlabel('Solar Irradiance Ranges (W/m^2)');
ylabel('Count of Measurements');