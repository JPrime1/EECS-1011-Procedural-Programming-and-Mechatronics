% Name: James Prime
% Student ID: 215028657
% Assignment: Plant Watering System

% Goal: To monitor soil moisture using an Arduino board and
%       automatically water a plant using a pump and passive buzzer.

% Procedure:
%   1. Establish communication with the Arduino board.
%   2. Define pins, voltage thresholds and timing variables.
%   3. Read and display the initial moisture sensor voltage.
%   4. Buzz twice to indicate the start of watering.
%   5. Activate the water pump for a specified duration.
%   6. Buzz once to indicate the end of watering.
%   7. Wait for the water to reach the soil.
%   8. Read and display the final moisture sensor voltage.
%   9. Wait for the next check or allow the user to skip the wait.
%  10. Repeat the process continuously.

% Challenges:
%   1. Establishing communication between MATLAB and Arduino.
%   2. Controlling a passive buzzer using PWM.
%   3. Managing the timing of the pump and buzzer.
%   4. Continuously monitoring the moisture sensor.
%   5. Allowing user input during the waiting period.

% Clear the workspace and command window
clear; clc;

% ========================================================================
% Main Portion
% ========================================================================

% Establish communication with the Arduino board
a = arduino('COM19', 'Uno');

% Define pins
moisturePin = 'A1';
buzzerPin = 'D5';
pumpPin = 'D6';

% Define voltage properties
moistureBeforeVoltage = 0;
moistureAfterVoltage = 0;

% Define moisture threshold for watering, set to 3.0 V due to not wanting fully saturated soil
moistureThreshold = 3.0;        % Voltage threshold (V)

% Define timing properties
buzzFrequency = 2000;           % Frequency (Hz)
buzzDuration = 0.5;             % Buzzer ON duration (seconds)
buzzGap = 0.2;                  % Gap between buzzes (seconds)

pauseBeforeWatering = 2;        % Pause before activating pump
pumpDuration = 1;               % Pump activation duration
pauseAfterWatering = 10;        % Allow water to reach the soil
checkInterval = 600;             % Time between moisture checks

% Initialize pump to OFF state in case it was left ON from a previous run
writeDigitalPin(a, pumpPin, 0);

% Display instructions
fprintf("PLANT WATERING SYSTEM\n");
fprintf("========================================\n");
fprintf("WARNING:\n");
fprintf("The program will continuously repeat the watering cycle.\n");
fprintf("During the waiting period, press the ENTER key in the wait window\n");
fprintf("to skip the remaining wait and restart the cycle.\n");
fprintf("Press ESCAPE in the wait window to stop.\n");
fprintf("========================================\n");

% Create a window to capture keyboard input, since I don't wanna wait the full wait time of the loop.
waitWindow = figure('Name', 'Plant Watering System', ...
                    'KeyPressFcn', @keyPressedCallback);

% Continuously monitor the plant while running
running = true;
while running

    % STEP 1: Read Initial Moisture Voltage
    moistureBeforeVoltage = readVoltage(a, moisturePin);
    fprintf("\nMoisture sensor voltage before watering: %.1f V\n", moistureBeforeVoltage);

    % STEP 2: Buzz Twice
    fprintf("Buzzing twice...\n");
    buzz(a, buzzerPin, buzzFrequency, buzzDuration);
    pause(buzzGap);
    buzz(a, buzzerPin, buzzFrequency, buzzDuration);

    % STEP 3: Pause Before Watering
    fprintf("Pausing for %d seconds before watering...\n", pauseBeforeWatering);
    pause(pauseBeforeWatering);

    % STEP 4: Activate Water Pump
    fprintf("Activating water pump...\n");
    water(a, pumpPin, pumpDuration, @() buzz(a, buzzerPin, buzzFrequency, pumpDuration));

    % STEP 5: Buzz Once
    fprintf("Buzzing once...\n");
    buzz(a, buzzerPin, buzzFrequency, 1);

    % STEP 6: Pause After Watering
    fprintf("Allowing water to reach the soil...\n");
    pause(pauseAfterWatering);

    % STEP 7: Read Final Moisture Voltage
    moistureAfterVoltage = readVoltage(a, moisturePin);
    fprintf("\nMoisture sensor voltage after watering: %.1f V\n", moistureAfterVoltage);

    % STEP 8: Display Results
    fprintf("\n========== WATERING RESULTS ==========\n");
    fprintf("Before watering: %.1f V\n", moistureBeforeVoltage);
    fprintf("After watering:  %.1f V\n", moistureAfterVoltage);
    fprintf("Voltage difference: %.1f V\n", moistureAfterVoltage - moistureBeforeVoltage);
    fprintf("======================================\n");

    % STEP 9: Wait Until Next Moisture Check
    fprintf("\nNext moisture check in %.1f seconds.\n", checkInterval);
    fprintf("Press any key in the wait window to skip.\n");

    % Reset keyboard input flag
    setappdata(waitWindow, 'skipWait', false);

    % Start countdown
    waitTimer = tic;

    while toc(waitTimer) < checkInterval

        % Check if wait window still exists
        if ~isgraphics(waitWindow)
            break;
        end

        % Check if user has pressed a key
        if getappdata(waitWindow, 'skipWait')
            fprintf("User input detected. Skipping wait...\n");
            break;
        end

        % Allow MATLAB to process keyboard input
        pause(0.1);
        drawnow;

    end

    fprintf("\nRestarting moisture monitoring...\n");

end


% ========================================================================
% Arduino Functions
% ========================================================================

% Activate a passive buzzer for a specified duration
function output = buzz(board, buzzerPin, frequency, duration)
    % Generate a tone using PWM
    writePWMFrequency(board, buzzerPin, frequency);
    pause(duration);
    writePWMDutyCycle(board, buzzerPin, 0); % Turn off the buzzer
    output = 1;
end

function output = water(board, pumpPin, duration, action)
    % Activate the water pump for a specified duration
    writeDigitalPin(board, pumpPin, 1); % Turn on the pump
    action();
    writeDigitalPin(board, pumpPin, 0); % Turn off the pump
    output = 1;
end


% ========================================================================
% User Input Functions
% ========================================================================

% Detect keyboard input from the wait window
function output = keyPressInterrupt(~, event)

    % Set flag to indicate that the user wants to skip the wait
    % setappdata(src, 'skipWait', true);

    % output = 1;

end