function [kEnergy,pEnergy] = energyAllBodies(Bodies, pos, ori,time)

bodyparts=["lowertrunk","middletrunk","uppertrunk","head","","","upperarmL","upperarmR","forearmL",...
        "forearmR","handL","handR","","","thighL","thighR","shankL","shankR","footL","footR"];
% Get parameters from bodies (COM, ms, inertia, mass) 
for i = 1:length(bodyparts)
    if i ~= 5 && i ~= 6 && i ~= 13 && i ~= 14
        %COM, ms and Inertia parameters
        COM(i,:) = Bodies.(bodyparts(i)).COMpos;
        ms(i,:) = Bodies.(bodyparts(i)).Mass * COM(i,:);
        I(i,:,:) = Bodies.(bodyparts(i)).Inertia;
        mass(i) = Bodies.(bodyparts(i)).Mass;
    else
        COM(i,:) = zeros(3,1);
        ms(i,:) = zeros(3,1);
        I(i,:,:) = zeros(3);
        mass(i) = 0;
    end
end
b = length(bodyparts);
n = length(time);
% Compute linear and angular velocity and acceleration (with filtering)
[v, ~, w, ~] = central_difference(pos,ori,time);

%% Solve NE equations for the whole body
kEnergy = zeros(1,n);
pEnergy = zeros(1,n);
%% Solve LHS of NE
% For each body j
for j = 1:b
    % For each time instant i
    for i = 1:n-5
        [kEnergy(j,i),pEnergy(j,i)] = energyComputation(mass(j),v(j,:,i),w(j,:,i),squeeze(I(j,:,:)),ms(j,:),pos(j,:,i),ori(j,:,i));
    end
end
end