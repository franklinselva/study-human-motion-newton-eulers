% Plots the mean of the parameteres measured and their standard deviation
function [p] = plotmeasurements(plot_error)

N = 4;


a1 = [19.1, 9, 27.2, 35, 37.4, 27, 32, 38, 19.5, 20, 29, 8, 16, 28.4, 17.6, 24.4, 25.5, 32, 22.3, 23.8, 8, 22.3, 38, 36, 44, 58, 98, 86, 76.7, 94, 9.4, 6.4, 9, 2.5, 15, 33, 29, 29.5, 30, 27, 51];
a2 = [20.3, 9.4, 25.1, 31.5, 35.8, 27, 40.3, 42.2, 22.6, 20.7, 28.6, 8.3, 17.6, 27.3, 17.2, 26.4, 26.3, 30.9, 25.2, 25.5, 8.6, 23.3, 28.9, 38, 48, 58, 99.2, 88.5, 81, 93.8, 10.6, 6.7, 7.8, 3.4, 17.7, 32, 29.5, 29.3, 31.5, 31.5, 57.4];
a3 = [20.5, 11, 29, 33, 33.5, 27, 38, 41, 23.5, 22, 32, 8, 20, 27.5, 19, 23.5, 25.5, 33, 26, 26.5, 9, 23.5, 37.5, 46, 35.5, 59, 100, 87.5, 77.2, 93.5, 9.8, 6.8, 9, 3, 16, 32.5, 28.9, 30, 31, 29, 57];
a4 = [19.1, 10.1, 28.5, 32.1, 35.5, 26.4, 40.3, 29.6, 21.8, 29.1, 22, 9, 14.8, 28.3, 17, 26.7, 26.2, 30.95, 24.7, 21.45, 8.1, 27.4, 34.5, 36.5, 53.1, 39.1, 96.9, 86.9, 83.2, 93.2, 11.7, 6.3, 10.3, 2.3, 21.5, 30.1, 28.6, 31.8, 27.5, 34.6, 0];

% Mean calculation
p = (a1+a2+a3+a4)/N;

% Standard-deviation
sd = sqrt((1/(N-1)).*((p-a1).^2 + (p - a2).^2 + (p - a3).^2 + (p - a4).^2));

% data = [transpose(a1), transpose(a2), transpose(a3), transpose(a4),
% transpose(p) ,transpose(sd)]; csvwrite ('hanavan_param_4ppl.csv', data)



if plot_error
    errorbar(p,sd,'x')
end
end
