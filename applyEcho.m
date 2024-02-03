function audioOut = applyEcho(audioIn, echoDelay, echoDecay)
    persistent audioBuffer bufferIndex;
    sampleRate = 44100; % Assuming a sample rate of 44100 Hz
    
    maxDelaySamples = ceil(sampleRate * 1); % Maximum delay of 1 second

    if isempty(audioBuffer)
        audioBuffer = zeros(maxDelaySamples, 2); % Assuming stereo audio
        bufferIndex = 1;
    end

    numSamples = size(audioIn, 1); %Calcualte the number of samples
    audioOut = zeros(numSamples, 2); % Initialize output buffer

    for i = 1:numSamples
        % Calculate the index for the delayed audio sample
        delaySamples = round(echoDelay * sampleRate);
        delayedIndex = mod(bufferIndex - delaySamples - 1, maxDelaySamples) + 1;

        % Mix current sample and delayed sample
        echoSample = audioBuffer(delayedIndex, :) * echoDecay;
        audioOut(i, :) = audioIn(i, :) + echoSample;

        % Update the buffer with the current sample
        audioBuffer(bufferIndex, :) = audioIn(i, :);
        bufferIndex = mod(bufferIndex, maxDelaySamples) + 1;
    end
end
    