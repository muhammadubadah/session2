% Define the parametric curve
x = @(t) 6*t - 9*t.^2 + 4*t.^3;
y = @(t) -3*t.^2 + 4*t.^3;

% Initialize the plot
figure;
hold on;

% Set the range of t values
t_range = 0:0.01:1;

% Plot the curve
plot(x(t_range), y(t_range), 'linewidth', 2);

% Plot the particle
particle_handle = plot(x(0), y(0), 'ro', 'markersize', 10);

% Iterate over the range of t values
for t = t_range
    % Update the particle position
    set(particle_handle, 'xdata', x(t), 'ydata', y(t));
    
    % Update the plot
    drawnow;
end

% Add a legend
legend('Trajectory', 'Particle');
