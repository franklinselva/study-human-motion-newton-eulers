%% Computes the central derivate of the vector
% We get the velocity and acceleration on x,y and z of each joint for each
% timestep
function [v, vd, w, wd] = central_difference(pose,ori,time)
    %velocities, differences between positions and orientations over time
    for i=2:length(time)-1
        
        v(:,:,i-1) = (pose(:,:,i+1)-pose(:,:,i-1))/(time(i+1)-time(i-1));
        w(:,:,i-1) = (ori(:,:,i+1)-ori(:,:,i-1))/(time(i+1)-time(i-1));
        
    end
    
     d1 = designfilt('lowpassiir','FilterOrder',12, ...
    'HalfPowerFrequency',0.15,'DesignMethod','butter');
%     
    for i=1:size(v,1)
        for j=1:size(v,2)
            v(i,j,:) = medfilt1(squeeze(v(i,j,:)),5);
            w(i,j,:) = medfilt1(squeeze(w(i,j,:)),5);
            v(i,j,:)=filtfilt(d1,squeeze(v(i,j,:)));
            w(i,j,:)=filtfilt(d1,squeeze(w(i,j,:)));

        end
    end
    
    %accelerations, differences between velocities over time
    for i=3:length(time)-3
        vd(:,:,i-2) = (v(:,:,i+1)-v(:,:,i-1))/(time(i+1)-time(i-1));
        wd(:,:,i-2)= (w(:,:,i+1)-w(:,:,i-1))/(time(i+1)-time(i-1));
    end
    
%     % Apply median filter to remove spikes, then low pass filter with fc=4
    for i=1:size(vd,1)
        for j=1:size(vd,2)
            vd(i,j,:) = medfilt1(squeeze(vd(i,j,:)),5);
            wd(i,j,:) = medfilt1(squeeze(wd(i,j,:)),5);
            vd(i,j,:)=filtfilt(d1,squeeze(vd(i,j,:)));
            wd(i,j,:)=filtfilt(d1,squeeze(wd(i,j,:)));
        end
    end
        
end