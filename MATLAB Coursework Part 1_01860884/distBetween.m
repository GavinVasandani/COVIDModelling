function [dist] = distBetween(xpos1,ypos1,xpos2,ypos2) 
% Finds the distances between 2 people to determine whether they're in range
% to transmit the virus.
%   xpos1 - x coordinate of person 1
%   xpos2 - x coordinate of person 1
%   ypos1 - y coordinate of person 2
%   ypos2 - y coordinate of person 2
%   dist - outputs distance between the 2 people

% Circular equation used to determine whether person 2 is within proximity
% of person 1 and vice versa

deltax = xpos1-xpos2; 
deltay = ypos1-ypos2; 
deltax = deltax^2; 
deltay = deltay^2;
dist = deltax+deltay; 

end

