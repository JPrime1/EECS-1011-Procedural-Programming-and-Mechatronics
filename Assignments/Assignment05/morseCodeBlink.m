% Name: James Prime
% Student ID: 215028657
% Assignment 5: Blink morse code on Arduino board in MATLAB 

% Goal: To blink morse code of my initials with a LED connected to an Arduino board using MATLAB.
% Procedure:
%   1. Divide Code into segments for Morse, Board, Main
%   2. Create a static class for the morse encoding
%       2.1 Create a 26x14 morse code matrix of the alphabet.
%       2.2 Construct a function to extract from the alphabet with a prompted character.
%   3. Create a board object class
%       3.1 Establish constant values ex. ON OFF PAUSE BLINK TIMING
%       3.2 Establish communication with the Arduino board.
%   4. Call the function to blink the morse code of my initials.

% Challenges:
%   1. Understanding how to establish communication with the Arduino board.
%   2. Creating a morse code matrix of the alphabet.
%   3. Managing the timing for the LED blinking sequence.
%   4. Learning matlab doesn't like multiple class definitions within a single file.

% Clear the workspace and command window
clear; clc;

% ========================================================================
% Main Portion
% ========================================================================
% Connect to the Arduino board
% a = arduino('COM19', 'Uno');

alphabet = createAlphabet();
name = "James Prime";
morseMatrix = encode("JP", alphabet);

% ========================================================================
% Morse Code Functions
% ========================================================================
% Construct and return alphabet
function alphabet = createAlphabet()
    % Define the morse code string for each letter of the alphabet
    morseCode   = [ ".-", "-...", "-.-.", "-..", ".", ...
                    "..-.", "--.", "....", "..", ".---",...
                    "-.-", ".-..", "--", "-.", "---", ...
                    ".--.", "--.-", ".-.","...", "-",...
                    "..-", "...-", ".--","-..-", "-.--","--.."];

    morseMatrixAlphabet = NaN(26,14); % "empty" NaN matrix

    % Construct the morse matrix alphabet
    for i = 1:26
        letter = char(morseCode(i));    % extract string of morse, convert to char matrix
        vectorPointer = 1;              % internal pointer when navigating a row within the NaN matrix
        
        for j = 1:length(letter)
            
            if letter(j) == '.'
                % Dot represented by 1
                morseMatrixAlphabet(i,vectorPointer) = 1; 
                vectorPointer = vectorPointer + 1;            
            elseif letter(j) == '-'
                % Dash represented by 111
                morseMatrixAlphabet(i,vectorPointer) = 1; 
                morseMatrixAlphabet(i,vectorPointer+1) = 1; 
                morseMatrixAlphabet(i,vectorPointer+2) = 1; 
                vectorPointer = vectorPointer + 3;
            end

            % Only seperate these dashes or dots if they're NOT at the end
            if j ~= length(letter)
                morseMatrixAlphabet(i,vectorPointer) = 0;
                vectorPointer = vectorPointer + 1;
            end
        end
    end

    % return fully constructed alphabet
    alphabet = morseMatrixAlphabet; 
end

% Encode nx14 matrix given a string
function stringMatrix = encode(stringInput, alphabet)
    input = char(stringInput);
    stringMatrix = [];

<<<<<<< HEAD
    for index = 1:length(input)
        morseVector = charToMorse(input[index], alphabet);
        stringMatrix = [stringMatrix; morseVector];
=======
    for index = 1:length(word)
        morseVector = charToMorse(word(index), alphabet);
        stringMatrix = [stringMatrix; morseVector];
>>>>>>> a813be9e4bda42bc3c6b2993194167255a0ef278
    end
end

% Extract a morse vector given a requested char from a given alphabet
function morseVectorOutput = charToMorse(character, alphabet)
    index = upper(character) - 'A' + 1;
    morseVectorOutput = alphabet(index,:);
end

% ========================================================================
% Arduino Functions
% ========================================================================

% Properties
timeUnit = 0.2; % seconds
on = 1;     % LED ON state
off = 0;    % LED OFF state
shortGap = NaN(1,14);
shortGap(1:3) = 0;
longGap = NaN(1,14);
longGap(1:6) = 0;


% TODO: Transmit Function utilizing two functions blink and buzz