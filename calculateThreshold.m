%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Written by : Djamal Namoko
%% 40099428
%% Comp 478 Project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function T = calculateThreshold(Dm, H)
    % Calculate Tc as 2.3 times the mean value of the image H
    Tc = 0.035 * mean(H(:));
    
    % Calculate the threshold T based on the formula
    T = (1 + Dm) .* Tc;
end