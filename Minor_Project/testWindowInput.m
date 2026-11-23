clear;
clc;
close all;

fprintf('MATLAB key-interrupt timer test\n');
fprintf('Press any key to skip the wait. Press ESC to stop.\n');

waitDuration = 10;

waitWindow = figure('Name', 'Timer Key Interrupt Test', ...
    'NumberTitle', 'off', ...
    'Position', [400 300 500 250], ...
    'KeyPressFcn', @keyPressedCallback);

axes(waitWindow, 'Position', [0.05 0.05 0.90 0.90], ...
    'XTick', [], 'YTick', [], 'Color', [0.95 0.95 0.95]);
text(0.5, 0.65, 'Timer running', ...
    'HorizontalAlignment', 'center', ...
    'FontSize', 18);
text(0.5, 0.45, 'Press ENTER to skip or ESC to stop', ...
    'HorizontalAlignment', 'center', ...
    'FontSize', 12);

setappdata(waitWindow, 'skipWait', false);
setappdata(waitWindow, 'stopRunning', false);
setappdata(waitWindow, 'pressedKey', '');

running = true;
cycle = 1;

while running
    fprintf('\nTIC - Cycle %d\n', cycle);
    fprintf('Waiting for up to %d seconds...\n', waitDuration);

    setappdata(waitWindow, 'skipWait', false);
    setappdata(waitWindow, 'stopRunning', false);

    timerStart = tic;
    skipped = false;

    while toc(timerStart) < waitDuration
        if ~isgraphics(waitWindow)
            running = false;
            fprintf('Wait window closed. Stopping.\n');
            break;
        end

        if getappdata(waitWindow, 'stopRunning')
            running = false;
            fprintf('ESC detected. Stopping.\n');
            break;
        end

        if getappdata(waitWindow, 'skipWait')
            pressedKey = getappdata(waitWindow, 'pressedKey');
            fprintf('Key interrupt detected: %s. Skipping wait.\n', pressedKey);
            skipped = true;
            break;
        end

        remaining = waitDuration - toc(timerStart);
        fprintf('%.1f seconds remaining\r', remaining);

        pause(0.1);
        drawnow;
    end

    if ~running
        break;
    end

    if skipped
        fprintf('\nTOC - Wait skipped by keyboard\n');
    else
        fprintf('\nTOC - Wait complete\n');
    end

    cycle = cycle + 1;

    % The next cycle is ready immediately in this test.
    fprintf('Restarting timer...\n');
end

if isgraphics(waitWindow)
    close(waitWindow);
end

fprintf('\nTimer test stopped.\n');


function keyPressedCallback(src, event)
    setappdata(src, 'pressedKey', event.Key);

    if strcmpi(event.Key, 'escape')
        setappdata(src, 'stopRunning', true);
    else
        setappdata(src, 'skipWait', true);
    end
end
