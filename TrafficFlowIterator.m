ConstantsandArrays;
MeanSpeeds = zeros(40,1);
count = 1;
for i = 1:40
    RedLightTime = count;
    trafficlightrate = count;
    TrafficFlowV3;
    MeanCurrentSpeed = MeanSimSpeed(iterations);
    MeanSpeeds(count) = MeanCurrentSpeed;
    ConstantsandArrays;
    count = count + 1;
end
figure
MeanSpeeds = MeanSpeeds / (CarDensity * 50);
plot(MeanSpeeds)
title('Mean Speed of Traffic against Traffic Light Interval')
xlabel('Traffic Light Interval(s)')
ylabel('Mean Traffic Speed/(Traffic density * traffic light mean distance')
 