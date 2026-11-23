clear; clc; close all;
days = 1:6;
machineA = [25 30 28 35 32 40];
machineB = [20 27 30 31 35 38];

totalA = sum(machineA);
totalB = sum(machineB);

averageA = mean(machineA);
averageB = mean(machineB);

dailyDifference = machineA - machineB;

fprintf("total A = %d, avg A = %.0f\n", totalA, averageA);
fprintf("total B = %d, avg B = %.0f\n", totalB, averageB);
fprintf("daily difference is ");
fprintf("%d ",dailyDifference);
fprintf("\n")

figure;
machines = [machineA', machineB'];
bar(days, machines);
title("Daily Energy Consumption Comparison")
ylabel("Energy Consumption(kWh)");
xlabel("Day");
legend('Machine A', 'Machine B', 'Location','best');
text1 = sprintf("Machine A: Total = %d kWh, Average = %.2f kWh\n", totalA, averageA);
text2 = sprintf("Machine B: Total = %d kWh, Average = %.2f kWh\n", totalB, averageB);
text(1,30,text1);
text(1,20,text2);
grid on;