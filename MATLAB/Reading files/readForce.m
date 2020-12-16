%% Reads the content of the Force files
function F2 = readForce(filename)
    
    F = readtable(filename);
    F=F{:,:}';
    F=F(3:8,:);
    
    % Resample is neccesary because the force plate frequency is faster
    % than the motion capture measurments
    for i=1:6
        F2(i,:)=resample(F(i,:),60,1000);
    end
    
    d1 = designfilt('lowpassiir','FilterOrder',6, ...
    'HalfPowerFrequency',0.15,'DesignMethod','butter');

    for i=1:6
        F2(i,:)=medfilt1(F2(i,:),5);
        F2(i,:)=filtfilt(d1,F2(i,:));
    end
%     
%     figure();
%     subplot(2,1,1)
%     plot(F(1,:))
%     title('Recorded signal from Force plates')
%     subplot(2,1,2)
%     plot(F2(1,:))
%     title('Processed signal from Force plates')
end