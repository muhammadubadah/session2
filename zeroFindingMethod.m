% Define the function
f = @(x) x.^3 - 8;

% Define the interval [a,b]
a = 1;
b = 4;

% Plot the function
x = a:0.01:b;
y = f(x);
figure;
plot(x,y);
hold on;

% Locate the root
x0 = 2; % Initial guess
x_root = fzero(f, x0);

% Plot the root
plot(x_root, 0, 'r*');

% Add title and labels
title('Graph of f(x) = x^3 - 8');
xlabel('x');
ylabel('y');

% Add horizontal line at y = 0
ylim = get(gca, 'YLim');
line([x_root, x_root], [ylim(1), 0], 'Color', 'red', 'LineStyle', '--');

% Add vertical line at x = x_root
xlim = get(gca, 'XLim');
line([x_root, x_root], [0, f(x_root)], 'Color', 'red', 'LineStyle', '--');

% Display the root
fprintf('The root of f(x) = 0 is x = %f\n', x_root);