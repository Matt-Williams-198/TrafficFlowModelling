ConstantsandArrays
figure
hold on
SpeedLimits = linspace(1,40,40);
SpeedLimits = round(SpeedLimits);
Yvals = zeros(40,40);
Xvals = zeros(40,40);
count1 = 1;
title('Mean Speed of Traffic against $\Gamma$','Interpreter','Latex')
xlabel('$\Gamma$','Interpreter','Latex')
ylabel('$\bar{V}$/($I \Psi$)','Interpreter','Latex')
for j = 1:40
    speedlimit = SpeedLimits(count1)
    TrafficFlowIterator;
    Yvals(count1,:) = MeanSpeeds;
    Xvals(count1,:) = x;
    count1 = count1 +1;
end

%MeanSpeeds = MeanSpeeds .* RedLightTime.' ./ 100;
%MeanSpeeds = MeanSpeeds ./ SpeedLimits.';
%plot(x, MeanSpeeds)



%count2 = 1;
%for i1 = 1:10
 %   plot(Xvals(count2,:),Yvals(count2,:))
  %  count2 = count2 +1;
%end