x = linspace(-1, 1, 21);
y = sin(2*pi*x);

% Newton Interpolating Polynomial
p = InterpN(x, y);
xx = linspace(-1, 1, 1001);
yy = polyval(p, xx);

% Cubic Interpolating Spline
pp = spline(x, y);
xxx = linspace(-1, 1, 1001);
yyy = ppval(pp, xxx);

% Plotting the results
figure(1)
plot(x, y, 'ro', xx, yy, 'b', xxx, yyy, 'g');
legend('Data Points', 'Newton Interpolation', 'Cubic Interpolating Spline');
xlabel('x');
ylabel('y');
title('Interpolation of sin(2pix)');

%For the second part of the problem,
%where the points xi are defined as the zeros of the Chebyshev polynomial

n = 20;
a = -1;
b = 1;
x = zeros(1, n+1);
for i = 1:n+1
x(i) = (a + b) / 2 - (b - a) / 2 * cos((2 * (i - 1) + 1) / (2 * (n + 1)) * pi);
end
y = sin(2*pi*x);

% Newton Interpolating Polynomial
p = InterpN(x, y);
xx = linspace(-1, 1, 1001);
yy = polyval(p, xx);

% Cubic Interpolating Spline
pp = spline(x, y);
xxx = linspace(-1, 1, 1001);
yyy = ppval(pp, xxx);

% Plotting the results
figure(2)
plot(x, y, 'ro', xx, yy, 'b', xxx, yyy, 'g');
legend('Data Points', 'Newton Interpolation', 'Cubic Interpolating Spline');
xlabel('x');
ylabel('y');
title('Interpolation of sin(2pix) using Chebyshev nodes');


function p = InterpN(x, y)
n = length(x);
a = y;
    for j = 1:n-1
        for i = n:-1:j+1
            a(i) = (a(i) - a(i-1)) / (x(i) - x(i-j));
        end
    end
p = a;
    for i = 1:n-1
        p = conv(p, [1, -x(i)]);
    end
end