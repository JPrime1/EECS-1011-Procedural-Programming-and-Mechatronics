% Name: James Prime
% Student ID: 215028657
% Assignment 6: Measure Music with your Arduino

% AUDIO CREDIT
% Track: Next Horizon (Electronic Cinematic) - 30 Seconds Edit
% Artist: Databend
% Source: https://pixabay.com/music/corporate-next-horizon-electronic-cinematic-30-seconds-edit-519916/
% License: Pixabay Content License
% Accessed: November 8, 2026

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
clc; close all; clear all;

% Connect to the Arduino board
a = arduino('COM19', 'Uno');
sound_sensor_pin = 'A2';

% ========================================================================
% Part 1: Record and Plot Original Signal - NO ALTERATIONS
% ========================================================================

% Setup variables
max_samples = 1000; % Number of samples to record

% Setup data collection vectors
sound_data = zeros(max_samples, 1); 
time_data = zeros(max_samples, 1); 

% play file
[y, Fs] = audioread("EECS1011_Piano_single_note_four_times.mp3");
% pause program for user input
input('Press Enter to start recording first audio file...');
sound(y, Fs);

% data collect
tic; % start timer
for index = 1:max_samples
    sound_data(index) = readVoltage(a, sound_sensor_pin);
    time_data(index) = toc;
    if mod(index,100)==0
        fprintf("Sampling %d out of %d\n",index,max_samples);
    end
end

% plot data 1 - original sound data
figure;
plot(time_data, sound_data, 'b-');
xlabel('Elapsed Time (s)');
ylabel('Sensor Voltage (V)');
title('Part 1: Original Piano Signal');
grid on;

% ========================================================================
% Part 2: Record and Plot 30 second Signal - WITH ALTERATIONS
% ========================================================================

% SETUP DATA COLLECTION
timeLimit = 30; % seconds
newSoundData = [];
newTimeData = [];

% play 30s file
[y, Fs] = audioread("next_horizon.mp3");
% pause program for user input
input('Press Enter to start recording 30 seconds of music...');
sound(y, Fs);

% data collect
tic; % start timer
while toc < timeLimit
    newSoundData(end+1) = readVoltage(a, sound_sensor_pin);
    newTimeData(end+1) = toc;
end

% window sizes for moving average filters
window_size_5 = 5;
window_size_10 = 10;
new_data_5 = movmean(newSoundData, window_size_5);
new_data_10 = movmean(newSoundData, window_size_10);

% plot data 2 - original and filtered sound data
figure;
subplot(2,1,1);
plot(newTimeData, newSoundData, 'b-');
xlabel('Elapsed Time (s)');
ylabel('Sensor Voltage (V)');
title('Part 2: Original Signal');
grid on;

subplot(2,1,2);
plot(newTimeData, new_data_5, 'b-');
xlabel('Elapsed Time (s)');
ylabel('Sensor Voltage (V)');
title('Part 2: Filtered Signal (Window Size = 5)');
grid on;

% plot data 3 - comparing filtered signals with different window sizes
figure;
subplot(2,1,1);
plot(newTimeData, new_data_5, 'b-');
xlabel('Elapsed Time (s)');
ylabel('Sensor Voltage (V)');
title('Part 2: Filtered Signal (Window Size = 5)');
grid on;

subplot(2,1,2);
plot(newTimeData, new_data_10, 'b-');
xlabel('Elapsed Time (s)');
ylabel('Sensor Voltage (V)');
title('Part 2: Filtered Signal (Window Size = 10)');
grid on;