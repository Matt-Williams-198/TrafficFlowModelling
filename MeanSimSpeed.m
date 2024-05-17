function MeanSpeed = MeanSimSpeed(iterations)
    TotalSpeed = 0;
    simulationLength = length(iterations(1,:));
    for i = 1:simulationLength
        CurrentMeanSpeed = MeanTrafficSpeed(iterations(:,i));
        TotalSpeed = TotalSpeed + CurrentMeanSpeed;
    end
    simulationLength;
    TotalSpeed;
    MeanSpeed = TotalSpeed/simulationLength;
    return