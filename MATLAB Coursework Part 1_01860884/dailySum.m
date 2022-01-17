function [] = dailySum(day,health,asymp,sick,recover)
% Saves data of daily summary into text file
%   day - current day of simulation
%   health - current day healthy people
%   asymp - current day asymptomatic people
%   sick - current day sick people
%   recover - current day recovered people

Summary = fopen('DailySummary.txt','a+');
fprintf(Summary,['Daily Summary for day ',num2str(day),'\n']);
fprintf(Summary,['Number of Healthy People: ',num2str(health),'\n']);
fprintf(Summary,['Number of Asymptomatic People: ',num2str(asymp),'\n']);
fprintf(Summary,['Number of Sick People: ',num2str(sick),'\n']);
fprintf(Summary,['Number of Recovered People: ',num2str(recover),'\n']);
fclose(Summary);

end

