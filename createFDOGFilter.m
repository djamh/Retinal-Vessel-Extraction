%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Written by : Djamal Namoko
%% 40099428
%% Comp 478 Ass3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function FDOGfilter = createFDOGFilter(L, s)
    % Define the size
    Size = L; 
    t = 3 ; % specified in text
    
    % Initialize the filter with zeros
    FDOGfilter = zeros(Size, Size);
    
    % Define the bounds based on the provided t value
    x_bound = t * s;
    y_bound = L / 2;
    
    % Calculate the filter values within the defined bounds

    for x = -floor(Size/2):floor(Size/2)
        for y = -floor(Size/2):floor(Size/2)
            if abs(x) <= x_bound && abs(y) <= y_bound

                %just to respect matlab indices which cannot be negative
                FDOGfilter(x + floor(L/2) + 1, y + floor(L/2) + 1) = ...
                    (-x / (sqrt(2 * pi) * (s^3))) * exp(-x^2 / (2 * s^2));
            end
        end
    end
    

 

    % Normalize the filter to ensure the sum is 1, see if it's necessary
    %FDOGfilter = FDOGfilter / sum(FDOGfilter(:));

end