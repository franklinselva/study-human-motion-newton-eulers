% Plot  Potential Energy

function [] = Pot_Energies_Plot(filename,Pot_Energy)

steps = length(Pot_Energy);
figure(4)

kin_energy_plot= tiledlayout(4,5); % Requires R2019b or later
my_title3 = strcat('Potential energy of', ': ', filename);


for i = 1:20
    nexttile
    plot(Pot_Energy(i,:));
    title(strcat('Body',string(i)), 'FontSize',12,'FontWeight','bold')
    xlabel('steps')
    ylabel('J')
end

title(kin_energy_plot, my_title3 );

fname = '../Report/New';
image_name = strcat(filename, "_pe");
saveas(gcf,fullfile(fname, image_name), 'jpeg');

end

