function [] = covidPlot(health,asymp,sick,healthyInd,asympInd,sickInd,recoveredInd,pos,P,lim)
% Creates a scatter graph with different marker colours to plot movement of 
% people and their current status either healthy, asymptomatic, sick or
% recovered.
%   pos - array containing the current x and y position of a person
%   healthyInd - indices of healthy people
%   asympInd - indices of asymptomatic people
%   sickInd - indices of sick people
%   recoveredInd - indices of recovered people
%   P - array for days and hours of simulation.

% IF statements were used to check whether there are no more
% healthy/asymptomatic/sick people. If so, their graphs would not be
% plotted.

    if health~=0
        plot(pos(healthyInd,1),pos(healthyInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#00FF00','MarkerEdgeColor','#00FF00');
        hold on 
    else 
        plot(pos(healthyInd,1),pos(healthyInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#00FF00','MarkerEdgeColor','#00FF00'); 
    end  
    
    if asymp~=0
        plot(pos(asympInd,1),pos(asympInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#ed8f20','MarkerEdgeColor','#ed8f20'); 
        hold on
    else 
        plot(pos(asympInd,1),pos(asympInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#ed8f20','MarkerEdgeColor','#ed8f20'); 
    end
    
    if sick~=0
        plot(pos(sickInd,1),pos(sickInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#FF0000','MarkerEdgeColor','#FF0000'); 
        hold on
    else
        plot(pos(sickInd,1),pos(sickInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#FF0000','MarkerEdgeColor','#FF0000'); 
    end
    
    plot(pos(recoveredInd,1),pos(recoveredInd,2),'o', 'MarkerSize', 8, 'MarkerFaceColor', '#0000FF','MarkerEdgeColor','#0000FF'); 
    hold off
    axis equal 
    xlim([0,lim]) 
    ylim([0,lim]) 
    xlabel('Width in meters');
    ylabel('Height in meters');
    grid on
    grid minor
    title(['Time Elapsed: ', 'Days: ', num2str(P(3)), ' Hours: ', num2str(P(4))]);
    
end

