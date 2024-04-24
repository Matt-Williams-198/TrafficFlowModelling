function [NewPosition, NewSpeed] = PositionUpdate(Street, CurrentPosition, TrafficLightPostition, TrafficLightColour)
    Speed = Street(CurrentPosition);
    NewPosition = 1;
    NewSpeed = 0;
    for i = 1 : length(TrafficLightPostition)
        if CurrentPosition  == TrafficLightColour(i) - 1 && TrafficLightColour(i) == true
            NewSpeed = 0;
            NewPosition = CurrentPosition;
            return
        end
        Speed = 1;
    end
    for i = 1 : Speed
        if CurrentPosition + i <= length(Street)
            if Street(CurrentPosition + i) ~= -1
                NewPosition = CurrentPosition + i - 1;
                NewSpeed = Street(CurrentPosition + i);
                break
            end
            NewPosition = CurrentPosition + Speed;
            NewSpeed = Speed;
        %elseif CurrentPosition + i - length(Street) == 1
        %    if Street(CurrentPosition + i - length(Street)) ~= -1
        %        NewPosition = length(Street);
        %        NewSpeed = Street(1);
        %        break
        %    end
        %    NewPosition = length(Street);
        %    NewSpeed = Speed;
        else
            if Street(CurrentPosition + i - length(Street)) ~= -1
                NewPosition = CurrentPosition + i - 1 - length(Street);
                NewSpeed = Street(CurrentPosition + i - length(Street));
                break
            end
            NewPosition = CurrentPosition + Speed - length(Street);
            NewSpeed = Speed;
        end
    end
    for i = CurrentPosition : NewPosition
        for j = 1:length(TrafficLightPostition)
            if i == TrafficLightPostition(j)-1 && TrafficLightColour(j)
                NewPosition = i;
                NewSpeed = 0;
                break
            end
        end
    end
    return
end

