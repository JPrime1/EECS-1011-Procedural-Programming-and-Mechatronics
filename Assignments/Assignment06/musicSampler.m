% Name: James Prime
% Student ID: 215028657
% Assignment 6: Measure Music with your Arduino

% Goal: To record voltage readings from the sound of music using an Arduino
%       and MATLAB, plot the recorded signal, and investigate how moving-average
%       filters affect the signal.
% Procedure:
%   1. Connect the arduino and use the sound sensor on pin A2 in MATLAB
%   2. Record 1,000 sensor voltage samples while the piano recording plays.
%   3. Record the elapsed time for each sample and plot voltage against time.
%   4. Record sound-sensor data for 30 seconds while selected music plays.
%   5. Apply movmean() filters with window sizes of 5 and 10 to the recorded
%      data, preserving the original signal.
%   6. Plot and compare the original signal with the filtered signals using
%      matching time and voltage axis limits.
%   7. Save the plots and compare how window size affects smoothness, peaks,
%      and rapid changes in the signal.

% Challenges:
%   1. Have reliable communication between MATLAB and the Arduino.
%   2. Positioning the sound sensor to capture the music clearly.
%   3. Collecting samples and elapsed times accurately, including stopping
%      the second recording automatically after 30 seconds.
%   4. Choosing and comparing filter window sizes without losing important
%      peaks or rapid changes in the music signal.

% Clear the workspace and command window
clear; clc;

% ========================================================================
% Main Portion
% ========================================================================
% Connect to the Arduino board
% a = arduino('COM19', 'Uno');