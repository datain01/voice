% Initialization
deviceReader = audioDeviceReader('NumChannels', 2, 'SampleRate', 44100); %2 channels for setereo audio
deviceWriter = audioDeviceWriter('SampleRate', 44100);
spectrumAnalyzer = dsp.SpectrumAnalyzer('SampleRate', deviceReader.SampleRate);


% Global variables for pitch and echo
global pitchShiftAmount echoDelay echoDecay x
pitchShiftAmount = 0;
echoDelay = 0;
echoDecay = 0.5;
x = 0; %using for while loop

% Call GUI Creation
createGUI();

% Real-time Audio Processing Loop
while (x>=0)
    audioIn = deviceReader();
    audioPitchShifted = applyPitchShift(audioIn, pitchShiftAmount);
    audioEchoed = applyEcho(audioPitchShifted, echoDelay, echoDecay);

    deviceWriter(audioEchoed); %output sound
    spectrumAnalyzer(audioEchoed); %output spectrum analyzer

    
    % to ensure GUI responsiveness
    drawnow limitrate;
end

% Cleanup
release(deviceReader);
release(deviceWriter);
release(spectrumAnalyzer);