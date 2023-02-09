% Set the display format to long
format long;

% Calculate the maximum floating point number
[xmax, r] = maxfloat();

% Multiply the maximum floating point number by itself
%To trigger an overflow,
%you can call the multiply function with the
%maximum floating point number as one of the arguments:

z = multiply(xmax, xmax);

% Print the result
fprintf('z = %.15f\n', z);

function z = multiply(x, y)
% Multiply two floating point numbers and return the result

z = x * y;

end

function [xmin, p] = minfloat()
% Calculate the minimum floating point number as xmin = 2^-p

% Set the initial value of p
p = 0;

% Calculate xmin
xmin = 2^-p;

% Iterate until xmin is smaller than the machine epsilon
while xmin > eps
    p = p + 1;
    xmin = 2^-p;
end

% Handle underflow
if xmin == 0
    fprintf('Underflow occurred (p = %d)\n', p);
else
    fprintf('Minimum floating point number: %.15f (p = %d)\n', xmin, p);
end

end

function [xmax, r] = maxfloat()
% Calculate the maximum floating point number as xmax = 2^r

% Set the initial value of r
r = 0;

% Calculate xmax
xmax = 2^r;

% Iterate until xmax is larger than the maximum value of a double precision floating point number
while xmax < realmax
    r = r + 1;
    xmax = 2^r;
end

% Handle overflow
if isinf(xmax)
    fprintf('Overflow occurred (r = %d)\n', r);
else
    fprintf('Maximum floating point number: %.15f (r = %d)\n', xmax, r);
end

end
