% Define the function f(x)
f = @(x) (1 - sin(pi*x))/x;

% Define the interpolating nodes
x_nodes = [1/2, 1, 3/2];

% Evaluate the function in the interpolating nodes
y_nodes = f(x_nodes);

% Compute the coefficients of the Newton interpolant using the InterpN function
c = InterpN(x_nodes, y_nodes);

% Define the range of x values for plotting
x_range = 0.01:0.01:2;

% Evaluate the Newton interpolant in the x_range using the HornerN function
P = HornerN(c, x_nodes, x_range);

% Evaluate the exact function in the x_range
f_range = f(x_range);

% Plot
figure;
plot(x_range, f_range, 'b', 'linewidth', 2);
hold on;
scatter(x_nodes, y_nodes, 'k', 'filled');
plot(x_range, P, 'r', 'linewidth', 2);
legend('Exact Function', 'Interpolating Points', 'Interpolant');
%To compute the Euclidean norm of the interpolating error,
% subtract the exact function evaluated
% in the x_range from the computed interpolant and compute the norm:
error = f_range - P;
Euclidean_norm_of_interpolating_error = norm(error);
