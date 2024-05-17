fig = openfig("bifurcation.fig");
axObjs = fig.Children;
dataObjs = findobj(fig,'-property','YData');
y = dataObjs(1).YData;
CollectData = zeros(40,40);
for i = 1:40
    CollectData(i,:) = dataObjs(i).YData;
end