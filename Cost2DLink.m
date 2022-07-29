function z = Cost2DLink(theta,bot)

x_d = 4;
y_d = 3;

x_ee = @(theta)  bot.fkine([theta(1) theta(2)]).t(1);
y_ee = @(theta) bot.fkine([theta(1) theta(2)]).t(2);
delta = @(theta) sqrt((x_ee(theta) - x_d)^2 + (y_ee(theta) - y_d)^2);
  
z = sqrt((x_ee(theta) - x_d)^2 + (y_ee(theta) - y_d)^2);
end
