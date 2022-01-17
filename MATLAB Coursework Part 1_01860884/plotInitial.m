function [] = plotInitial(healthy,pos,n)
plotInitial = figure;
title('Initial Position of People');
xlabel('Width in meters');
ylabel('Height in meters');
for o=1:n
    if healthy(o) == 0
        plot(pos(o,1),pos(o,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#00FF00','MarkerEdgeColor','#00FF00');
        hold on
    else 
        plot(pos(o,1),pos(o,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#FF0000','MarkerEdgeColor','#FF0000');
    end 
end
saveas(plotInitial,'InitialPositions.jpg');
close(plotInitial);
end

