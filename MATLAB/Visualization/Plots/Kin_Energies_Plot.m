% Plot  Kinetic Energy

function [] = Kin_Energies_Plot(filename,Kin_Energy)

steps = length(Kin_Energy);
figure(3)

kin_energy_plot= tiledlayout(4,5); % Requires R2019b or later
my_title3 = strcat('Kinetic energy of', ': ', filename);

for i = 1:20
    nexttile
    plot(Kin_Energy(i,:));
    title(strcat('Body',string(i)), 'FontSize',12,'FontWeight','bold')
    xlabel('steps')
    ylabel('J')
end

title(kin_energy_plot, my_title3 );

fname = '../Report/New';
image_name = strcat(filename, "_ke");
saveas(gcf,fullfile(fname, image_name), 'jpeg');

end

