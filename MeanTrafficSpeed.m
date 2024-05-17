function [MeanSpeed] = MeanTrafficSpeed(Street)
    TotalSpeed = 0;
    CarNumber = 0;
    for i = 1:size(Street)
        if Street(i) ~= -1
            TotalSpeed = TotalSpeed + Street(i);
            CarNumber = CarNumber + 1;
        end
    end
    MeanSpeed = TotalSpeed/CarNumber;
    if isnan(MeanSpeed)
        MeanSpeed = 0;
    end
    return