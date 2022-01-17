function [] = historyPlot(ts,dt,health,asymp,sick,recover,n,P,i)
% Creates a line graph with different colours to show the past and current 
% number of healthy, asymptomatic, sick and recovered people.
%   health - array containing the total healthy people for each day
%   asymp - array containing the total asymptomatic people for each day
%   sick - array containing the total sick people for each day
%   recover - array containing the total recovered people for each day
%   time - array that stores all the time steps in terms of hours

    time = (linspace(0,ts,ts/dt))./3600;
    plot(time(1:i),health,'Color','#00FF00','LineWidth',2);
    hold on
    plot(time(1:i),asymp,'Color','#ed8f20','LineWidth',2);
    hold on
    plot(time(1:i),sick,'Color','#FF0000','LineWidth',2);
    hold on
    plot(time(1:i),recover,'Color','#0000FF','LineWidth',2);
    hold off
    ylim([0,n]) 
    xlabel('Hours');
    ylabel('Number of People');
    legend('Healthy','Asymptomatic','Sick','Recovered','location','north','Orientation','horizontal');
    legend boxoff
    grid on
    grid minor
    title(['Time Elapsed: ', 'Days: ', num2str(P(3)), ' Hours: ', num2str(P(4))]);
    
end

