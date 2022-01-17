function [] = barPlot(health,asymp,sick,recover,P,n)
% Creates a bar graph with different colours to show current number of 
% healthy, asymptomatic, sick and recovered people.
%   health - array containing current number of healthy people
%   asymp - array containing current number of asymptomatic people
%   sick - array containing current number of sick people
%   recover - array containing current number of recovered people

    % assigning titles for different bars
    labels = categorical({'Healthy','Asymptomatic','Sick','Recovered'});
    labels = reordercats(labels,{'Healthy','Asymptomatic','Sick','Recovered'});
    status = [health,asymp,sick,recover];
    
    HealthBar = bar(labels(1),status(1),'Facecolor','#00FF00');
    hold on
    AsympBar = bar(labels(2),status(2),'Facecolor','#ed8f20');
    SickBar = bar(labels(3),status(3),'Facecolor','#FF0000');
    RecoverBar = bar(labels(4),status(4),'Facecolor','#0000FF');
    hold off
    title(['Time Elapsed: ', 'Days: ', num2str(P(3)), ' Hours: ', num2str(P(4))]);
    ylabel('Number of People');
    ylim([0,n]);
    
end

