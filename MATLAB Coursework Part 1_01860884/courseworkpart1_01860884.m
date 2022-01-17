%housekeeping
clear, clc, clf, tic
 
% DESCRIPTION
% This program simulates coronavirus transmission amongst a set of user inputted
% carriers in a confined space. The carriers infect healthy individuals who
% later become sick and eventually recover from the virus over specific
% durations of time.

% USER INPUT

n = input("User enter the number of individuals: "); %num is number of points
 
% MODEL INPUTS 

ts = 864000;        % Number of time steps of program (864000 = Total Time of Sim)
dt = 10;            % Duration of time step
V = 0.1:0.0001:0.2; % Range of possible velocities for person
lim = 1000;         % Spatial limits

% VECTOR ALLOCATION

ang = randi([0,360],1,n);       % Random integer angle between 0 and 360
V = V(randi([1,numel(V)],1,n)); % Array of random velocities
uV = (V).*cosd(ang);            % Array of x-component velocities
vV = (V).*sind(ang);            % Array of y-component velocities
pos = randi([0,lim],n,2);       % 2-D Array of random coordinates (Row 1 - x position, Row 2 - y position) 

% STATUS ALLOCATION

health = zeros(1,n);   % Array of healthy people
asym = NaN(1,n);       % Array of asymptomatic people
sick = NaN(1,n);        % Array of sick people
recover = zeros(1,n); % Array of recovered people

% Assigning first sick person

rng=randi([1,n]);   % Random integer to decide first sick person
health(rng) = 1;   % Sick person is given value 1 in healthy array     
sick(rng) = 1;      % Sick person is given value 1 in sick array   

% TIME ALLOCATION

infectT = NaN(1,n);    % Array of time until asymptomatic turns sick
recoverT = NaN(1,n);   % Array of time until sick turns recovered
recoverT(rng) = 25920; % Assigns time until first sick person recovers
 
plotInitial(health,pos,n); % Saves initial plot 

% Structure array storing information every time step
status = struct('Healthy',cell(1,86400),'Asymptomatic',cell(1,86400),'Sick',cell(1,86400),'Recover',cell(1,86400),'Time',cell(1,86400));

% Code repeated for each time step:
 
for i=1:ts/dt 
    
    for j=1:n 

        % Function to determine next position of a person
        [pos(j,1),pos(j,2),uV(j),vV(j)] = move(pos(j,1),pos(j,2),uV(j),vV(j),V(j),dt);
        
        for s=1:n 
            
            if j~=s % Ensures both people aren't the same
                
              % Function to check distance between 2 people 
              dist = distBetween(pos(j,1),pos(j,2),pos(s,1),pos(s,2));
              
              for k = 1:n

              if (dist<2) % Condition to check if 2 people are close enough for transmission
                  
                  % Condition to check 1 of the 2 people are sick or
                  % asymptomatic and the other is neither asymptomatic,
                  % sick or recovered
                  
                  if (sick(s) == 1) & (asym(j) ~= 1) & (sick(j) ~= 1) & (recover(j) ~= 1) & (rand()<=0.5) 

                      asym(j) = 1; 
                      health(j) = 1;
                      infectT(j)=(i+(17280)); % Assigns time step at which person will become sick
                      recoverT(j)=(i+(43200)); % Assigns time step at which person will recover

                  elseif (asym(s) == 1) & (asym(j) ~= 1) & (sick(j) ~= 1) & (recover(j) ~= 1) & (rand()<=0.3) %checks if point is symptomatic person and the probability of infecting
                  
                      asym(j) = 1;
                      health(j) = 1;
                      infectT(j)=(i+(17280));
                      recoverT(j)=(i+(43200));

                  end 
              end
        
              end
            end
        end
    end
    
    [IRow,ICol] = find(infectT==i); % Checks which people's incubation period ends and returns their index
        
            sick(ICol) = 1; % Person is added to sick and removed from asymptomatic array 
            asym(ICol) = 0;               

    [RRow,RCol] = find(recoverT==i); % Repeated for recovery period
    
            recover(RCol) = 1; 
            sick(RCol) = 0; 
    
    P = datevec(seconds(i*dt),'DD:HH:MM:SS');
            
    healthyI = find(health==0); % Array with the indices of currently healthy, asymptomatic, sick, recovered people
    asympI = find(asym==1);     
    sickI = find(sick==1);
    recoveredI = find(recover==1);
    
    healthyleng(i) = length(healthyI); % Counts number of currently healthy, asymptomatic, sick, recovered people
    asympleng(i) = length(asympI);     
    sickleng(i) = length(sickI);
    recoverleng(i) = length(recoveredI);
    
    status(i).Healthy = healthyleng(i);
    status(i).Asymptomatic = asympleng(i);
    status(i).Sick = sickleng(i);
    status(i).Recover = recoverleng(i);
    status(i).Time = P(3:6);
   
        if mod(i,8640)==0
        
            dailySum(P(3),healthyleng(i),asympleng(i),sickleng(i),recoverleng(i));
    
        end
    
        if mod(i,40)==0
        
            subplot(2,2,1);
            covidPlot(healthyleng(i),asympleng(i),sickleng(i),healthyI,asympI,sickI,recoveredI,pos,P,lim);
    
            subplot(2,2,2);
            barPlot(healthyleng(i),asympleng(i),sickleng(i),recoverleng(i),P,n);
    
            subplot(2,2,[3,4]);
            historyPlot(ts,dt,healthyleng,asympleng,sickleng,recoverleng,n,P,i)

            images(P);
    
            pause(1e-64);%time for scatter graph to refresh
 
        end
end
close()
toc