    % Moisture Voltage Sensor
% Task: record voltage in 4 scenarios
%       pause program for user input before each scenario


% connect to arduino
clear; clc;
%a = arduino('COM19', 'Uno');

% setup moisture sensor pin
moisture_sensor_pin = 'A0';

% =======================================================================
% air
input('Press Enter to start recording air scenario...');
voltage = zeros(10,1);
for i = 1:10
    voltage(i) = readVoltage(a, moisture_sensor_pin);
    pause(0.1);
end
disp(voltage);
avgVoltage = mean(voltage);
fprintf("Voltage in air: %.1f V\n\n", avgVoltage);

% dry soil
input('Press Enter to start recording dry soil scenario...');
for i = 1:10
    voltage(i) = readVoltage(a, moisture_sensor_pin);
    pause(0.1);
end
disp(voltage);
avgVoltage = mean(voltage);
fprintf("Voltage in dry soil: %.1f V\n\n", avgVoltage);

% wet soil
input('Press Enter to start recording wet soil scenario...');
for i = 1:10
    voltage(i) = readVoltage(a, moisture_sensor_pin);
    pause(0.1);
end
disp(voltage);
avgVoltage = mean(voltage);
fprintf("Voltage in wet soil: %.1f V\n\n", avgVoltage);

% water
input('Press Enter to start recording water scenario...');
for i = 1:10
    voltage(i) = readVoltage(a, moisture_sensor_pin);
    pause(0.1);
end
disp(voltage);
avgVoltage = mean(voltage);
fprintf("Voltage in water: %.1f V\n\n", avgVoltage);
