clc; clear all; close all;

addpath(genpath('../MATLAB'));
addpath(genpath('../Lab_Files'));

%% Parameters and conditions

visualize = false;
compute_energies = true;
force_plot = true;
energy_plot = true;

file_names = ["custom","custom2","customL","fastArm","fastKick","fastKickArm", ...
    "jumpFeetup","maxJump","maxJump2","mediumArm","mediumArmNOSTOMP", "mediumKick", ...
    "mediumKickArm", "medJump", "quickJump", "slowArm", "slowKick", "slowKickArm"];

%% Analysis

% BSP Estimation 

P = plotmeasurements(false);
[Body]= BSPparameters(P/100);

for i=1:length(file_names)
    forcefile = strcat(file_names(i),".csv");
    drffile = strcat(file_names(i),".drf");

    disp(strcat('Reading file: ', file_names(i)));
    F= readForce(forcefile);
    [pos, ori, time]= readDRF(drffile);

    
     % Compute NE for each serial or tree structure -> get the forces on the ground
    [alpha,beta,COM,mass]= NE_forward(pos,ori,time,Body);
    [grdf,grdm]= NE_backward(pos,ori,alpha,beta,COM,mass);
    disp('Ground reactions computed');

%     [F,grdf,grdm,pos,ori,time]=align_plots(F,grdf,grdm,pos,ori,time);
    
    if visualize
        disp(strcat('Visualizating file: ' + file_names(i)));
        visualization(pos, forcefile);
        % visualization_adapted(Body, time, pos, ori);
    end
    
    % Energy Computation
    if compute_energies
        [kEnergy,pEnergy] = energyAllBodies(Body, pos, ori,time);
    end
    
    % Force and Moment plot
    if force_plot
        disp('Plotting Force plate and Ground force comparison');
        ForMom_Error(file_names(i),length(grdf),F, grdf, grdm);
        Force_Data_Plot(drffile, F, grdf, grdm);
    end
    
    % Energy Plot
    if energy_plot
        disp("Plotting energy");
       Kin_Energies_Plot(file_names(i),kEnergy);
       Pot_Energies_Plot(file_names(i),pEnergy);
       Tot_Energy_Plot(file_names(i), kEnergy, pEnergy);
    end

    disp('Type a key to continue to next motion');
    pause();
%     break;
end

 


