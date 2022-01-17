function [] = images(P)

%   Saves all graphs from the covid simulation on days 2, 4, 6 as a jpeg.
%   P - array for days and hours of simulation.

    if (P(3)==2)
        
        saveas(gcf,'Day2Graphs.jpeg');
        
    elseif (P(3)==4)
        
        saveas(gcf,'Day4Graphs.jpeg');
        
    elseif (P(3)==6)
        
        saveas(gcf,'Day6Graphs.jpeg');
        
    end
    
end

