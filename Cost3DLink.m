function deltaDistance = Cost3DLink(theta)
  global bot x_desier y_desier z_desier

x_d =x_desier;
y_d = y_desier;
z_d = z_desier;
x_ee = @(theta) bot.fkine([theta(1) theta(2) theta(3)]).t(1);
y_ee = @(theta) bot.fkine([theta(1) theta(2) theta(3)]).t(2);
z_ee = @(theta) bot.fkine([theta(1) theta(2) theta(3)]).t(3);

delta = @(theta) sqrt((x_ee(theta) - x_d)^2 + (y_ee(theta) - y_d)^2+ (z_ee(theta) - z_d)^2);
  
deltaDistance = delta(theta);
end
