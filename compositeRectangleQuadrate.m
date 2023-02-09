f = @(x) x * exp(-x) * cos(2*x);
a = 0;
b = 2*pi;
N = [4, 8, 16, 32, 64];
for i = 1:length(N)
IN = CompRect_method(f, a, b, N(i));
rel_error = abs((IN - (-0.12212604618968)) / (-0.12212604618968));
fprintf('For N = %d, approximate integral = %f, relative error = %f\n', N(i), IN, rel_error);
end


function IN = CompRect_method(f, a, b, N)
%f is the function to integrate
%a and b are the limits of integration
%N is the number of subintervals

h = (b-a)/N; %width of each subinterval
sum = 0;
for i = 1:N
x = a + (i-1)*h;
sum = sum + f(x + h/2);
end
IN = sum;
end