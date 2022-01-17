function [xpos,ypos,uV,vV] = move(xpos,ypos,uV,vV,V,dt)
% Determines the next position of the person and if this position exceeds
% the x or y boundaries, the person is reflected back in with a new random
% angle.
%           INPUT VARIABLES
%   xpos - x coordinate of the person 
%   ypos - y coordinate of the person 
%   uV - x component of velocity
%   vV - t component of velocity
%   V - magnitude of velocity
%   dt - duration of each timestep

%           OUTPUT VARIABLES
%   xpos - new x coordinate of the person 
%   ypos - new y coordinate of the person 
%   uV - new x component of velocity
%   vV - new t component of velocity

            xpos = xpos + uV*(dt); 
            ypos = ypos + vV*(dt); 
        
        if (xpos>998) 
            ang = randi([225,315]);
            uV = V*sind(ang);
            vV = V*cosd(ang);
            %figure out which is times sin which is cos
         
        elseif (ypos>998)
            ang = randi([135,225]);
            uV = V*sind(ang);
            vV = V*cosd(ang);
     
        elseif (xpos<2) 
            ang = randi([45,135]);
            uV = V*sind(ang);
            vV = V*cosd(ang);
           
        elseif (ypos<2) 
            ang = randi([-45,45]);
            uV = V*sind(ang);
            vV = V*cosd(ang);
            
        else  
            uV = uV;
            vV = vV;
    
        end
end

