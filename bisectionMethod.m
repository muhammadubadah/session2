% Define the function
f = @(x) x^2 - 3;

% Find the root of the function within a tolerance of 1e-6
root = bisection(f, 1, 2, 1e-6);




function root = bisection(f, x_low, x_high, tol)
% Bisection method for finding the root of a function within a given tolerance
% Inputs:
%   f: function handle for the function whose root we want to find
%   x_low: lower bound of the root
%   x_high: upper bound of the root
%   tol: tolerance for the root, the function will return when the root is found to this tolerance
% Output:
%   root: the root of the function, found to the specified tolerance

% Initialize variables
iter = 0;
x_mid = 0;

% Loop until the root is found to the desired tolerance
while (x_high - x_low) > tol
    iter = iter + 1;
    x_mid = (x_low + x_high) / 2;
    
    % Check if the root is between x_low and x_mid or x_mid and x_high
    if f(x_low) * f(x_mid) < 0
        x_high = x_mid;
    else
        x_low = x_mid;
    end
end

% Return the root
root = x_mid;

end
