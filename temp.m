clc;
clear all;
close all;

%%
L1 = Link('d', 0, 'a', 0.5, 'alpha', 0);
L2 = Link('d', 0, 'a', 0.5, 'alpha', 0);
bot = SerialLink([L1 L2], 'name', 'my robot');
eeps = []
i= 0 
j = 0
for theta1= 0: 0.1:2*pi
    for theta2 = 0:0.1:2*pi
        j = j+1
        eeps(j,:)= [bot.fkine([theta1 theta2]).t(1) bot.fkine([theta1 theta2]).t(2)];
        
    end    
end

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
plot(x_desier_vec(1:20),y_desier_vec(1:20),'m','LineWidth',3)
hold on
plot(eeps(:,1),eeps(:,2))

anim = Animate('movie.mp4');
for i=1:20
bot.plot(storedResults(i,:))
anim.add();
end
anim.close();

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
plot(x_desier_vec(1:20),y_desier_vec(1:20),'m');
hold on
xlabel('X (m)')
ylabel('Y (m)')
title('Predefined EF path')
grid on