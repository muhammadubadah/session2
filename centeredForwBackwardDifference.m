% Define the function
f = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.2;

% Set the starting value of h and the factor to divide h by at each iteration
h = 1;
h_factor = 10;

% Set the true value of the derivative
deriv_true = -0.9125;

% Initialize arrays to store the results
h_array = [];
error_array = [];

% Iterate until h is smaller than the machine epsilon
while h > eps
    % Compute the derivative using each method
    deriv_centered = (f(0.5 + h) - f(0.5 - h)) / (2*h);
    deriv_backward = (f(0.5) - f(0.5 - h)) / h;
    deriv_forward = (f(0.5 + h) - f(0.5)) / h;
    
    % Compute the error for each method
    error_centered = abs(deriv_true - deriv_centered);
    error_backward = abs(deriv_true - deriv_backward);
    error_forward = abs(deriv_true - deriv_forward);
    
    % Store the results
    h_array = [h_array, h];
    error_array = [error_array, error_centered, error_backward, error_forward];
    
    % Divide h by the factor
    h = h / h_factor;
end

% Print the results in a table
fprintf('h              error (centered)          error (backward)          error (forward)\n');
for i = 1:length(h_array)
    fprintf('%.16f          %.16f          %.16f          %.16f\n', h_array(i), error_array(3*i-2), error_array(3*i-1), error_array(3*i));
end
