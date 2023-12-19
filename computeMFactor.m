%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Written by : Djamal Namoko
%% 40099428
%% Comp 478 Ass3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function m = computeMFactor(t, s)

    % Define the function
    integrand = @(x) (1 / (sqrt(2 * pi) * s)) * exp(-x.^2 / (2 * s^2));
    
    % Perform the numerical integration from -ts to ts
    integralResult = integral(integrand, (-t * s), (t * s));
    
    % Divide by (2 * t * s) according to the equation
    m = integralResult / (2 * t * s);
end

