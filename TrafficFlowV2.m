for i = 1:CarSpacing:StreetLength
    Street(i) = InitialSpeed;
end
for i = 1:simLength
    for j = length(Street): -1 : 1
        if Street(j) ~= -1
            [newPosition, newSpeed] = PositionUpdate(Street,j,Street(j),1,speedlimit,TrafficLightLocation,TrafficLightred);
            Street(j) = -1;
            Street(newPosition) = newSpeed;
        end
    end
    iterations(i,:) = Street(1:end);
    if mod(i,trafficlightrate) == 0
        TrafficLightred = true;
    end
    if mod(i,2*trafficlightrate) == 0
        TrafficLightred = false;
    end
end