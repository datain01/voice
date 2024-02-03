function audioOut = applyPitchShift(audioIn, pitchShiftAmount)
    persistent pitchShifter;

    %create pithShifter
    if isempty(pitchShifter)
        pitchShifter = audiopluginexample.PitchShifter;
    end

    %set sample rate as 44100 Hz
    setSampleRate(pitchShifter, 44100);
    
    %the range shifted on pithShifter becomes pithShiftAmount
    pitchShifter.PitchShift = pitchShiftAmount;
    
    audioOut = pitchShifter(audioIn);
end
