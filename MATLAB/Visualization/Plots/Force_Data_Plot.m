function [] = Force_Data_Plot(filename, F, grdf, grdm)

%% Plot Data
figure(2)

filename = erase(filename,'.drf');
forces_moments_plot = tiledlayout(2,3); % Requires R2019b or later
header = strcat('Comparison of force and moment- ', filename);

nexttile
% Only comparing fx
plot(F(1,:));
hold on;
plot(grdf(1,:));
title('F_x', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('N')

nexttile
plot(F(2,:));
hold on;
plot(grdf(2,:));
title('F_y', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('N')

nexttile
plot(F(3,:));
hold on;
plot(grdf(3,:));
title('F_z', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('N')

nexttile
plot(F(4,:));
hold on;
plot(grdm(1,:));
title('M_x', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('Nm')

nexttile
plot(F(5,:));
hold on;
plot(grdm(2,:));
title('M_y', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('Nm')

nexttile
plot(F(6,:));
hold on;
plot(grdm(3,:));
title('M_z', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('Nm')

title(forces_moments_plot, header );
% legend('ForcePlates','GroundReactions');

% Saving plots
fname = '../Report/New';
image_name = strcat(filename, "_forceplot");
saveas(gcf,fullfile(fname, image_name), 'jpeg');

end

