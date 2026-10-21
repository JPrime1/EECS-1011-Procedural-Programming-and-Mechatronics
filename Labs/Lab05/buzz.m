% Name: James Prime
% Student ID: 215028657
% TA: Miodrag Tasic

% Lab 5: Arduino Board Buzzing
% Lab Goal: Getting familiar with the Arduino board and its components.
%           Buzzing 5 times using the Arduino board's buzzer.
% INPUT: No Input required from the user
% OUTPUT: Buzzing sound from the Arduino board's buzzer

% Setup Lab
clear; clc;

% Setup Variables
halfSecond = 0.5; % Half a second delay
buzzerPin = 'D5'; % Buzzer pin on Arduino board

% Connect to the Arduino board
a = arduino('COM19', 'Uno');

% Buzz 5 times
for index = 1:5
    % Turn on the buzzer
    writePWMDutyCycle(a, buzzerPin, 0.33); % Set buzzer to 33% duty cycle
    pause(halfSecond); % Wait for half a second

    % Turn off the buzzer
    writePWMDutyCycle(a, buzzerPin, 0); % Turn off the buzzer
    pause(halfSecond); % Wait for half a second
end