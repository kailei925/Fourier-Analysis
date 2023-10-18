% MATLAB Calculate the Fourier Series of a Funtion
% Input: function,order,integral limits
% Output: a0,an,bn,fourier series
% integral limit:a,b; Period: T = b-a 

% Define a function
% Sample: stepwise function
clear all; close all; clc;
syms x;
f = 0 * (-1 <= x & x <= 0) + 1 * (0 <= x & x <= 1);
FourierSeries(f, 20, -1, 1); % function, order, limits

function fs = FourierSeries(func, n, a, b)
    syms x
    T = b - a; % Period
    a0 = 2/T * int(func, x, a, b);
    fs = a0/2;

    for i = 1 : n
        % Calculate Fourier Coefficients
        an = 2/T * int(func * cos(2 * i * pi * x /T), x, a, b);
        bn = 2/T * int(func * sin(2 * i * pi * x /T), x, a, b);

        % Calculate Fourier Series
        fs = fs + an * cos(2 * i * pi * x /T) + bn * sin(2 * i * pi * x /T);
    end

    % Plot the function and its n-th order fourier series
    figure;
    fplot(func, [a b]);
    hold on; grid on;
    fplot(fs, [a,b], '-*');
    legend('Original Function', append('Order - ', num2str(n),' Fourier Series'));
end