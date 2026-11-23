
clc;
clear;

% Connect to Arduino
a = arduino("COM19", "Uno");
voltageReaderPin = "A1";
pumpPin = "D3";

while true

    % Wait for user input
    input("Press ENTER to begin test (Ctrl+C to quit)...");

    clc;

    % Measure before pumping
    before = readVoltage(a, voltageReaderPin);

    fprintf("--- BEFORE PUMPING ---\n");
    fprintf("Moisture voltage: %.1f V\n", before);

    % Activate pump
    fprintf("\nPump activated...\n");
    writeDigitalPin(a, pumpPin, 1);
    pause(0.5);
    writeDigitalPin(a, pumpPin, 0);

    fprintf("Pump deactivated.\n");

    % Allow water to settle
    pause(4);

    % Measure after pumping
    after = readVoltage(a, voltageReaderPin);

    fprintf("\n--- AFTER PUMPING ---\n");
    fprintf("Moisture voltage: %.1f V\n", after);

    % Display results
    fprintf("\n--- RESULTS ---\n");
    fprintf("Before: %.1f V\n", before);
    fprintf("After:  %.1f V\n", after);
    fprintf("Change: %.1f V\n", after - before);

    % Ask to repeat
    fprintf("\n");
    again = input("Press ENTER to run another test, or type 0 to exit: ");

    if again == 0
        break;
    end

    clc;

end

% Ensure pump is off
writeDigitalPin(a, pumpPin, 0);

clear a;
clc;
disp("Testing complete.");
