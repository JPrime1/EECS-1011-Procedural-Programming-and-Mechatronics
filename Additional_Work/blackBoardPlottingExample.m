% matlab problem to teach plotting and basic operations

t = [0:0.2:10]; % time vector from 0 to 10 with increments of 0.2
y1 = 5.*exp(-0.3.*t)
y2 = 12 - 1.1.*t - 0.05.*t.^2

hold on
grid on
plot(t,y1,'r--o','LineWidth',2) % plot y1 in red with
plot(t,y2,'b-s','LineWidth',2) % plot y2 in blue with

xlabel('Time (minutes)') % label x-axis
ylabel('Temperature (°C)') % label y-axis
title('Thermal System Profile Analysis') % add title
legend('Profile A','Profile B') % add legend

hold off