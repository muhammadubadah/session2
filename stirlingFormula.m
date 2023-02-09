n = 1:10;
fact = zeros(1, length(n));
stirling = zeros(1, length(n));
abs_diff = zeros(1, length(n));
rel_diff = zeros(1, length(n));

for i = 1:length(n)
fact(i) = factorial(n(i));
stirling(i) = sqrt(2*pi*n(i)) * (n(i)/exp(1))^n(i);
abs_diff(i) = abs(fact(i) - stirling(i));
rel_diff(i) = abs_diff(i) / fact(i);
end

fprintf('n\tn!\tS_n\tAbsolute Difference\tRelative Difference\n');
for i = 1:length(n)
fprintf('%d\t%d\t%f\t%f\t%f\n', n(i), fact(i), stirling(i), abs_diff(i), rel_diff(i));
end