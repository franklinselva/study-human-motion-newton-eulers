% Plot total kinetic energy, total potential energy, total energy

function Tot_Energy_Plot(filename,kinEnergies, potEnergies)

kinEnergy = sum(kinEnergies,1);
potEnergy = sum(potEnergies,1);
totEnergy = kinEnergy + potEnergy;

figure

forces_moments_plot = tiledlayout(2,1); % Requires R2019b or later
my_title1 = strcat('Kinetic, potential, and total energy of', ': ', filename);

nexttile
% Kin and Pot energies
plot(kinEnergy);
hold on;
plot(potEnergy);
title('Overall kinetic and potential Energies', 'FontSize',12,'FontWeight','bold')
legend('Kinetic Energy','Potential Energy');
xlabel('steps')
ylabel('J')

nexttile
% Total energy
plot(totEnergy);
title('Overall total energy', 'FontSize',12,'FontWeight','bold')
xlabel('steps')
ylabel('J')

fname = '../Report/New';
image_name = strcat(filename, "_energy");
saveas(gcf,fullfile(fname, image_name), 'jpeg');
end