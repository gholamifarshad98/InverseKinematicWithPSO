clc;
clear all;
close all;

%%
L1 = Link('d', 0, 'a', 0.5, 'alpha', 0);
L2 = Link('d', 0, 'a', 0.5, 'alpha', 0);
bot = SerialLink([L1 L2], 'name', 'my robot');

%%
LoadedDataEF = load('XYPathEF.mat');
x_desier_vec = LoadedDataEF.p(:,1);
y_desier_vec = LoadedDataEF.p(:,2);
storedResultsStruct = load('storedResults.mat');
storedResults = storedResultsStruct.storedResults


t = 0:0.56:22;
time_vec = t(1:20)
theta1_vec = storedResults(1:20,1)
theta2_vec = storedResults(1:20,2)

figure(2)
plot(x_desier_vec(1:20),y_desier_vec(1:20))
hold on
bot.plot(storedResults(1:20,:))

figure(12)
subplot(2,1,1);
plot(time_vec,theta1_vec)
ylabel('\theta_1 (rad)')
xlabel('Time (s)')
subplot(2,1,2); 
plot(time_vec,theta2_vec)
ylabel('\theta_2 (rad)')
xlabel('Time (s)')
figure(10)
plot(x_desier_vec(1:20),y_desier_vec(1:20));
hold on
xlabel('X (m)')
ylabel('Y (m)')
title('Predefined EF path')
grid on