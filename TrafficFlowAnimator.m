x = linspace(1,StreetLength,StreetLength);
graphedArray = TrafficFlowVisualisation(iterations);
for i = 1: simLength
    imshow(graphedArray(i,:),'InitialMagnification',800,Colormap=winter)
    title(max(iterations(i,:)))
    pause(0.2)
end