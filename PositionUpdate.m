function [NewPosition, NewSpeed] = PositionUpdate(localStreet, ...
                                                  CurrentPosition, ...
                                                  CurrentSpeed, ...
                                                  SpeedUp, ...
                                                  SpeedLimit, ...
                                                  TrafficLightPostition, ...
                                                  TrafficLightColour)
    Speed = CurrentSpeed;
    NewPosition = CurrentPosition + Speed;
    NewSpeed = Speed;
    for i = 1 : length(TrafficLightPostition)
        if CurrentPosition  == TrafficLightColour - 1 && TrafficLightColour == true
            NewSpeed = 0;
            NewPosition = CurrentPosition;
            return
        end
        
    end
    for i = 1 : Speed
        if CurrentPosition + i <= length(localStreet)
            if localStreet(CurrentPosition + i) ~= -1
                NewPosition = CurrentPosition + i - 1;
                NewSpeed = localStreet(CurrentPosition + i);
                break
            end
            NewPosition = CurrentPosition + Speed;
            NewSpeed = Speed;
        else
            if localStreet(CurrentPosition + i - length(localStreet)) ~= -1
                NewPosition = CurrentPosition + i - 1 - length(localStreet);
                NewSpeed = localStreet(CurrentPosition + i - length(localStreet));
                break
            end
            NewPosition = CurrentPosition + Speed - length(localStreet);
            NewSpeed = Speed;
        end
    end
    if NewPosition + SpeedUp <= length(localStreet)
        if NewPosition == CurrentPosition + Speed && localStreet(NewPosition + SpeedUp) == -1
            NewSpeed = NewSpeed + SpeedUp;
        end
    else
        if NewPosition == CurrentPosition + Speed && localStreet(1) == -1
            NewSpeed = NewSpeed + SpeedUp;
        end
    end
    if NewSpeed > SpeedLimit
        NewSpeed = SpeedLimit;
    end
    for i = CurrentPosition : NewPosition
        for j = 1:length(TrafficLightPostition)
            if i == TrafficLightPostition(j)-1 && TrafficLightColour
                NewPosition = i;
                NewSpeed = 0;
                break
            end
        end
    end
    return
end

