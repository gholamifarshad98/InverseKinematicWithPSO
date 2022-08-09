clc;
clear all;
close all;

%%
L1 = Link('d', 0, 'a', 0.5, 'alpha', pi/2);
L2 = Link('d', 0, 'a', 0.5, 'alpha', 0);
L3 = Link('d', 0, 'a', 0.5, 'alpha', 0);
bot = SerialLink([L1 L2 L3], 'name', 'my robot');
bot.fkine([1 2 3])
bot.plot([0 0 0])
%%
LoadedDataEF = load('XYPathEF.mat');
x_desier_vec = LoadedDataEF.p(:,1);
y_desier_vec = LoadedDataEF.p(:,2);
z_desier_vec = linspace(0, 0.4, length(y_desier_vec) )
t = 0:0.56:20;
% figure(10)
% plot(LoadedData.p(:,1), LoadedData.p(:,2));
% hold on
% xlabel('X (m)')
% ylabel('Y (m)')
% title('Predefined EF path')
% grid on
 

 psoGlobalBestPosition = [0,0,0]
global bot x_desier y_desier z_desier psoGlobalBestPosition
storedResults = [0,0,0];
    
for i = 1:size(LoadedDataEF.p(:,1))
  
   x_desier = x_desier_vec(i);
   y_desier = y_desier_vec(i);
   z_desier = z_desier_vec(i)
%    figure(10)
%    plot(x_desier,y_desier,'o')
result = pso();
psoGlobalBestPosition(1,:) = result;
storedResults(i,:) = result;
end
