% Name: James Prime
% Student ID: 215028657
% Assignment 5: Blink morse code on Arduino board in MATLAB 

% Goal: To blink an morse code of my initials on an LED connected to an Arduino board using MATLAB.
% Procedure:
%   1. Establish communication with the Arduino board.
%   2. Create morse code matrix of the alphabet.
%   3. Construct function to blink with a given character.
%   4. Call the function to blink the morse code of my initials.

% Challenges:
%   1. Understanding how to establish communication with the Arduino board.
%   2. Creating a morse code matrix of the alphabet.
%   3. Managing the timing for the LED blinking sequence.

% Clear the workspace and command window
clear; clc;

% Connect to the Arduino board
%a = arduino('COM19', 'Uno');

% Define variables for LED control
on = 1;     % LED ON state
off = 0;    % LED OFF state
% seconds timing

% Define the morse code for each letter of the alphabet
morseCode   = [ ".-", "-...", "-.-.", "-..", ".", ...
                "..-.", "--.", "....", "..", ".---",...
                "-.-", ".-..", "--", "-.", "---", ...
                ".--.", "--.-", ".-.","...", "-",...
                "..-", "...-", ".--","-..-", "-.--","--.."];

morseMatrixAlphabet = NaN(26,14);

% Construct the morse matrix alphabet
for i = 1:26
    letter = char(morseCode(i));
    vectorPointer = 1;
    
    for j = 1:length(letter)
        
        if letter(j) == '.'
            morseMatrixAlphabet(i,vectorPointer) = 1; % Dot represented by 1
            vectorPointer = vectorPointer + 1;
        elseif letter(j) == '-'
            morseMatrixAlphabet(i,vectorPointer) =1; % Dash represented by 1
            morseMatrixAlphabet(i,vectorPointer+1) =1; % Dash represented by 1
            morseMatrixAlphabet(i,vectorPointer+2) =1; % Dash represented by 1
            vectorPointer = vectorPointer + 3;
        end

        if j ~= length(letter)
            morseMatrixAlphabet(i,vectorPointer) = 0; % Dot represented by 1
            vectorPointer = vectorPointer + 1;
        end
    end
end

% % Create a function
function morseVectorOutput = morseChar(character, alphabet)
    index = upper(character) - 'A' + 1;
    morseVectorOutput = alphabet(index,:);
end

% % function converting morse vector to digital output


% initials output
% morseChar for J
firstInitial = morseChar('J', morseMatrixAlphabet);
% morseCar for P
lastInitial = morseChar('P', morseMatrixAlphabet);

morseMatrix = [firstInitial;lastInitial];


