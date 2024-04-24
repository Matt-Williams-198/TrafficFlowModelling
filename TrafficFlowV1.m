StreetLength = 100;
TrafficLightLocation = [25,75];
TrafficLightRed = [true,false];
Street = zeros(1,StreetLength)-1;
for i = 1:2:100
    Street(i) = 1;
end
speedlimit = 5;
simLength = 1000;
iterations = zeros(simLength, StreetLength);
for i = 1:100
    for j = length(Street): -1 : 1
        if Street(j) ~= -1
            Speed = Street(j);
            for k = 1 : Speed
                if j+k <= StreetLength
                    if Street(j + k) > -1
                        maxMove = k-1;
                        break
                    end
                    maxMove = Speed;
                else
                    if Street(j + k - StreetLength) > -1
                        maxMove = k-1;
                        break
                    end
                    maxMove = Speed;
                end
            end
            if maxMove == Speed
                NewSpeed = Speed + 1;
            else
                if j < StreetLength
                    NewSpeed = Street(j + 1);
                else
                    NewSpeed = Street(1);
                end
            end
            if NewSpeed > 5
                NewSpeed = 5;
            end
            if j <= TrafficLightLocation(1) && j + maxMove >= TrafficLightLocation(1)
                if TrafficLightRed(1)
                    NewSpeed = 0;
                end
            elseif j <= TrafficLightLocation(2) && j + maxMove >= TrafficLightLocation(1)
                if TrafficLightRed(2)
                    NewSpeed = 0;
                end
            end
            if j + maxMove > StreetLength
                Street(j + maxMove - StreetLength) = NewSpeed;
            else
                Street(j + maxMove) = NewSpeed;
            end
            Street(j) = -1;
        end
    end
    iterations(i,:) = Street(1:StreetLength);
    lightswitch = randi(2,2,1);
    if(lightswitch(1,1) == 1)
        TrafficLightRed(1) = true;
    end
    if(lightswitch(2,1) == 1)
        TrafficLightRed(2) = true;
    end
end
x = linspace(1,100,100);
for i = 1: simLength
    imshow(iterations(i,:),'InitialMagnification',800,Colormap=winter)
    title(max(iterations(i,:)))
    pause(0.2)
end
