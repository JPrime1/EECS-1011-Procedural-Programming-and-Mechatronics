% Name: James Prime
% Student ID: 215028657
% Minor Project: Arduino LED Blink Demo

% Goal: To blink the Arduino LED 10 times using MATLAB.
% Procedure:
%   1. Establish communication with the Arduino board.
%   2. Set the LED pin and timing values.
%   3. Turn the LED on and off repeatedly.

% Challenges:
%   1. Understanding how to establish communication with the Arduino board.
%   2. Controlling the LED pin correctly.
%   3. Managing the timing for the blinking sequence.

% Clear the workspace and command window
clear, clc;

% Connect to the Arduino board
a = arduino('COM19', 'Uno');

% Define variables for LED control
on = 1;             % LED ON state
off = 0;            % LED OFF state
ledPin = 'D13';
blinkCount = 10;
blinkDelay = 0.5;   % 0.5 second delay

% Blink the LED 10 times
for i = 1:blinkCount
    writeDigitalPin(a, ledPin, on); % Turn LED on
    pause(blinkDelay);

    writeDigitalPin(a, ledPin, off); % Turn LED off
    pause(blinkDelay);
end

% Keep the LED off after the sequence completes
writeDigitalPin(a, ledPin, off);

% Display a confirmation message
fprintf('The Arduino LED blinked %d times.\n', blinkCount);
