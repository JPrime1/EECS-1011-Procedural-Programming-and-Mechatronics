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
a = arduino('COM19', 'Uno');

alphabet = createAlphabet();
name = "James Prime";
morseMatrix = encode("JP", alphabet);
emit(a, morseMatrix);



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

            % Only separate these dashes or dots if they're NOT at the end
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
    stringInput = char(stringInput);
    stringMatrix = [];
    for index = 1:length(stringInput)
        morseVector = charToMorse(stringInput(index), alphabet);
        stringMatrix = [stringMatrix; morseVector];
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

function output = blink(board, ledPin, state)
    writeDigitalPin(board, ledPin, state);
    output = 1;
end

function output = buzz(board, buzzerPin, cycle)
    writePWMDutyCycle(board, buzzerPin, cycle);
    output = 1;
end

function output = emit(board, morseMatrix)
    % Properties
    timeUnit = 0.2; % seconds
    lightOn = 1;
    buzzOn = 0.5;
    ledPin = 'D4';
    buzzPin = 'D5';

    shortGap = NaN(1,14);
    shortGap(1:3) = 0;
    longGap = NaN(1,14);
    longGap(1:6) = 0;

    % matrix dimensions
    rowNum = size(morseMatrix, 1);
    colNum = size(morseMatrix, 2);

    % insert shortgaps between each char in morseMatrix
    morseMatrixCopy = NaN(rowNum*2-1, colNum); %create new array with room for gaps
    morseMatrixCopy(1:2:end, :) = morseMatrix;
    morseMatrixCopy(2:2:end, :) = repmat(shortGap, rowNum-1, 1); % repeat short gaps

    % Go over every entry within matrix and emit signal given entry value
    for row = 1:size(morseMatrixCopy,1)
        for col = 1:size(morseMatrixCopy,2)
            entry = morseMatrixCopy(row,col);
            if isnan(entry)
                break;
            end
            
            % Emit signal
            blink(board, ledPin, entry*lightOn);
            buzz(board, buzzPin, entry*buzzOn);
            pause(timeUnit);
        end
    end

    % make sure buzzer and light are off when emission is over
    blink(board, ledPin, 0);
    buzz(board, buzzPin, 0);

    output = 1;
end