clc; clear all; close all; format shortG;

% Data for GDP per capita prediction
x_gdp = [1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,...
    1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,...
    1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,...
    2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,...
    2017,2018,2019,2020,2021,2022];

y_gdp = [133.1429452, 127.9954527, 90.67836556, 113.6657027, 171.5262053, 260.3515161,...
    132.4574854, 123.5144934, 166.0064224, 190.0357917, 216.109852, 235.0383907,...
    209.1957418, 193.4093731, 202.2878488, 232.1658218, 221.5696191, 241.7949085,...
    258.8305348, 274.3894278, 294.9046524, 283.3822853, 284.9669776, 292.4253474,...
    292.0788195, 322.0873898, 387.3848632, 395.3180524, 401.9651801, 404.4861431,...
    413.1001853, 410.0485409, 407.9629676, 440.7144048, 469.1164584, 492.8086489,...
    503.5383322, 552.3389345, 630.1089792, 698.520945, 776.8595769, 856.3818868,...
    876.8180104, 973.7739043, 1108.514957, 1236.004392, 1659.962496, 1815.610262,...
    1963.412492, 2122.078397, 2233.305901, 2457.924039, 2688.305501];

% Data for power usage prediction
x_power = [1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,...
    1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,...
    1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,...
    2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,...
    2017,2018,2019,2020,2021,2022];

y_power = [205,183,222,250,266,301,347,396,437,462,545,604,...
    702,761,867,883,1048,1317,1393,1509,1640,1672,1823,1875,1920,...
    2087,2114,2136,2449,2665,3033,3218,3428,3522,3721,3792,3718,...
    4139,4162,4066,4890,6066,6434,7356,7817,8132,9479,10305,12893,...
    13480,13792,15170,15648];

n_gdp = length(x_gdp);
n_power = length(x_power);

% Cubic Regression for GDP per capita (3rd Order)
A_gdp = [n_gdp sum(x_gdp) sum(x_gdp.^2) sum(x_gdp.^3)
    sum(x_gdp) sum(x_gdp.^2) sum(x_gdp.^3) sum(x_gdp.^4)
    sum(x_gdp.^2) sum(x_gdp.^3) sum(x_gdp.^4) sum(x_gdp.^5)
    sum(x_gdp.^3) sum(x_gdp.^4) sum(x_gdp.^5) sum(x_gdp.^6)];

b_gdp = [sum(y_gdp);sum(x_gdp.*y_gdp);sum(x_gdp.^2.*y_gdp);sum(x_gdp.^3.*y_gdp)];

a_gdp = A_gdp\b_gdp;

% Prediction till 2050 for GDP per capita
prediction_years_gdp = 1970:2080;
predicted_per_capita_gdp = a_gdp(1) + a_gdp(2) .* prediction_years_gdp +...
    a_gdp(3) .* prediction_years_gdp.^2 + a_gdp(4) .* prediction_years_gdp.^3;

% Cubic Regression for Power Usage (3rd Order)
A_power = [n_power sum(x_power) sum(x_power.^2) sum(x_power.^3)
    sum(x_power) sum(x_power.^2) sum(x_power.^3) sum(x_power.^4)
    sum(x_power.^2) sum(x_power.^3) sum(x_power.^4) sum(x_power.^5)
    sum(x_power.^3) sum(x_power.^4) sum(x_power.^5) sum(x_power.^6)];

b_power = [sum(y_power);sum(x_power.*y_power);sum(x_power.^2.*y_power);sum(x_power.^3.*y_power)];

a_power = A_power\b_power;

% Prediction till 2050 for Power Usage using GDP per capita prediction
predicted_power_usage = a_power(1) + a_power(2) .* prediction_years_gdp +...
    a_power(3) .* prediction_years_gdp.^2 + a_power(4) .* prediction_years_gdp.^3;

% Plot GDP per capita and Power Usage on the same graph
p_gdp = linspace(x_gdp(1),x_gdp(end),1000);
q_gdp = @(p_gdp) a_gdp(1) + a_gdp(2).*p_gdp + a_gdp(3).*p_gdp.^2 + a_gdp(4).*p_gdp.^3;

p_power = linspace(x_power(1),x_power(end),1000);
q_power = @(p_power) a_power(1) + a_power(2).*p_power + a_power(3).*p_power.^2 + a_power(4).*p_power.^3;

figure;
plot(p_gdp, q_gdp(p_gdp), 'b', x_gdp, y_gdp, '*', 'MarkerSize', 3); % GDP per capita plot
hold on;
plot(p_power, q_power(p_power), 'r', x_power, y_power, '*', 'MarkerSize', 3); % Power usage plot
plot(prediction_years_gdp, predicted_per_capita_gdp, 'b--', prediction_years_gdp, predicted_power_usage, 'r--'); % Predicted data
legend('GDP per Capita Fit', 'Actual GDP per Capita', 'Power Usage Fit', 'Actual Power Usage', 'Predicted GDP per Capita', 'Predicted Power Usage'); % Add legend
xlabel('Years');
ylabel('Values');
title('GDP per Capita and Power Usage Prediction (Cubic Regression)');
grid on;
hold off;
