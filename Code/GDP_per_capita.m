clc; clear all; close all; format shortG;

x = [1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,...
    1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,...
    1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,...
    2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,...
    2017,2018,2019,2020,2021,2022];

y = [133.1429452, 127.9954527, 90.67836556, 113.6657027, 171.5262053, 260.3515161,...
    132.4574854, 123.5144934, 166.0064224, 190.0357917, 216.109852, 235.0383907,...
    209.1957418, 193.4093731, 202.2878488, 232.1658218, 221.5696191, 241.7949085,...
    258.8305348, 274.3894278, 294.9046524, 283.3822853, 284.9669776, 292.4253474,...
    292.0788195, 322.0873898, 387.3848632, 395.3180524, 401.9651801, 404.4861431,...
    413.1001853, 410.0485409, 407.9629676, 440.7144048, 469.1164584, 492.8086489,...
    503.5383322, 552.3389345, 630.1089792, 698.520945, 776.8595769, 856.3818868,...
    876.8180104, 973.7739043, 1108.514957, 1236.004392, 1659.962496, 1815.610262,...
    1963.412492, 2122.078397, 2233.305901, 2457.924039, 2688.305501];

n = length(x);

% Cubic Regression (3rd Order)
A = [n sum(x) sum(x.^2) sum(x.^3)
    sum(x) sum(x.^2) sum(x.^3) sum(x.^4)
    sum(x.^2) sum(x.^3) sum(x.^4) sum(x.^5)
    sum(x.^3) sum(x.^4) sum(x.^5) sum(x.^6)];

b = [sum(y);sum(x.*y);sum(x.^2.*y);sum(x.^3.*y)];

a = A\b;

% Prediction till 2050
prediction_years = 1970:2050;
predicted_per_capita_gdp = a(1) + a(2) .* prediction_years + a(3) .* prediction_years.^2 + a(4) .* prediction_years.^3;

% Plot with Actual and Predicted Data
p = linspace(x(1),x(end),1000);
q = @(p) a(1) + a(2).*p + a(3).*p.^2 + a(4).*p.^3;

figure;
plot(p,q(p),x,y, '*', 'MarkerSize', 2); % Red color and larger marker size
hold on;
plot(prediction_years, predicted_per_capita_gdp); % Plot predicted data
legend('Cubic Fit', 'Actual Data', 'Predicted Per Capita GDP'); % Add legend
xlabel('Years');
ylabel('Per Capita GDP');
title('Per Capita GDP Prediction (Cubic Regression)');
grid on;
hold off;