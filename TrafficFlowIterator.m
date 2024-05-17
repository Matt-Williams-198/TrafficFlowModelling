%ConstantsandArrays;
MeanSpeeds = zeros(40,1);
count = 1;
for i = 1:40
    %RedLightTime = count;
    trafficlightrate = count;
    %speedlimit = count;
    TrafficFlowV2;
    MeanCurrentSpeed = MeanSimSpeed(iterations);
    MeanSpeeds(count) = MeanCurrentSpeed;
    ConstantsandArrays;
    count = count + 1;
end
MeanSpeeds = MeanSpeeds ./ trafficlightrate .* 100;
%MeanSpeeds = MeanSpeeds ./ speedlimit;
x = linspace(1,40,40);
%x = speedlimit ./ (x .* 100);
%figure
plot(x,MeanSpeeds)