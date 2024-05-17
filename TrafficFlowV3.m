for i = 1:CarSpacing:StreetLength
    Street(i) = InitialSpeed;
end
for i = 1:simLength
    for j = length(Street): -1 : 1
        if Street(j) ~= -1
            [newPosition, newSpeed] = PositionUpdate(Street,j,Street(j),1,5,TrafficLightLocation,TrafficLightred);
            Street(j) = -1;
            Street(newPosition) = newSpeed;
        end
    end
    TLightCounter = TLightCounter + 1;
    iterations(i,:) = Street(1:end);
    TrafficLightChange = randi(5);
    if TrafficLightChange == 3 && TrafficLightred == false
        TrafficLightred = true;
        TLightCounter = 0;
    end
    if TLightCounter == RedLightTime
        TrafficLightred = false;
    end
end