function z = Cost2DLink(theta)
  global bot x_desier y_desier

x_d =x_desier;
y_d = y_desier;
x_ee = @(theta)  bot.fkine([theta(1) theta(2)]).t(1);
y_ee = @(theta) bot.fkine([theta(1) theta(2)]).t(2);
delta = @(theta) sqrt((x_ee(theta) - x_d)^2 + (y_ee(theta) - y_d)^2);
  
z = sqrt((x_ee(theta) - x_d)^2 + (y_ee(theta) - y_d)^2);
end
