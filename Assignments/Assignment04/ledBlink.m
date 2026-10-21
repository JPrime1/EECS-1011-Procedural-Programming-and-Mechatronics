% Name: James Prime
% Student ID: 215028657
% Assignment 4: Blink LED on Arduino board in MATLAB

% Goal: To blink an LED connected to an Arduino board using MATLAB.
% Procedure:
%   1. Establish communication with the Arduino board.
%   2. Send commands to turn the LED on and off.
%   3. Control the timing of the LED blinking.

% Challenges:
%   1. Understanding how to establish communication with the Arduino board.
%   2. Sending correct commands to control the LED.
%   3. Managing the timing for the LED blinking sequence.

% Clear the workspace and command window
clear; clc;

% Connect to the Arduino board
a = arduino('COM19', 'Uno');

% Define variables for LED control
on = 1; % LED ON state
off = 0; % LED OFF state
halfSecond = 0.5; % Half a second delay
fullSecond = 1.0; % Full second delay
ledPin = 'D13';

% Turn on the LED and wait for half a second
writeDigitalPin(a, ledPin, on);
pause(halfSecond);

% Turn off the LED and wait for half a second
writeDigitalPin(a, ledPin, off);
pause(halfSecond);

% Turn on, wait a full second, and then turn off. Stay off.
writeDigitalPin(a, ledPin, on);
pause(fullSecond);
writeDigitalPin(a, ledPin, off);