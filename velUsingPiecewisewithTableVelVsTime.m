


% Initialize time and velocity arrays
t_array = -5:0.5:50;
v_array = zeros(size(t_array));

% Compute velocity at each time step
for i = 1:length(t_array)
    t = t_array(i);
    v_array(i) = velocity(t);
end

% Print the table of velocity versus time
fprintf('t (s)    v (m/s)\n');
for i = 1:length(t_array)
    fprintf('%.1f    %.3f\n', t_array(i), v_array(i));
end



function v = velocity(t)
% Velocity of a rocket as a function of time, using piecewise functions
% Input:
%   t: time (s)
% Output:
%   v: velocity (m/s)

% Define the piecewise functions
f1 = @(t) 11*t.^2 - 5*t;
f2 = @(t) 1100 - 5*t;
f3 = @(t) 50*t + 2*(t - 20).^2;
f4 = @(t) 1520*exp(-0.2*(t - 30));

% Compute the velocity using the piecewise functions
v = piecewise(t, [-inf, 0, 10, 20, 30, inf], [0, f1, f2, f3, f4, 0]);

end
