function createGUI()
    global pitchShiftAmount echoDelay echoDecay;

    % Create GUI window
    f = figure('Name', 'Audio Effects Control', 'NumberTitle', 'off');

    % Pitch Slider Label, set position and size [x, y, width, length]
    uicontrol('Style', 'text', 'Position', [100, 320, 120, 20], 'String', 'Pitch Shift');

    % Pitch Slider range: -12 to 12. 
    uicontrol('Style', 'slider', 'Min', -12, 'Max', 12, 'Value', 0, 'Position', [100, 300, 120, 20], 'Callback', @(src, evt) updatePitch(src));


    % Echo Delay Slider Label
    uicontrol('Style', 'text', 'Position', [100, 270, 120, 20], 'String', 'Echo Delay');

    % Echo Delay Slider
    uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, 'Value', 0, 'Position', [100, 250, 120, 20], 'Callback', @(src, evt) updateEchoDelay(src));


    % Echo Decay Slider Label
    uicontrol('Style', 'text', 'Position', [100, 220, 120, 20], 'String', 'Echo Decay');

    % Echo Decay Slider
    uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, 'Value', 0.5, 'Position', [100, 200, 120, 20], 'Callback', @(src, evt) updateEchoDecay(src));


    % Update functions when the sliders are moved
    function updatePitch(src)
        pitchShiftAmount = src.Value;
    end

    function updateEchoDelay(src)
        echoDelay = src.Value;
    end

    function updateEchoDecay(src)
        echoDecay = src.Value;
    end
end
