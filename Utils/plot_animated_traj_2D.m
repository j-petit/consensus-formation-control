%% creates a video of the trajectories of the robots position in the 2D yz-plane
% vehicles should move in formation with the reference frame (line) and keep
% x = 0 so plot in yz-plane

% number of vehicles
N = size(vehicle_pos.data,2);
% number of timesteps
timesteps = size(vehicle_pos.data,3);

% line setup
l = 4 % edgelength
line_init = [0 0; -l*0.5 0.5*l; 0 0];

% color vector for vehicles
c = ['b','m','k','r','g','b','m','k','r','g','b','m','k','r','g','b','m',...
    'k','r','g','b','m','k','r','g','b','m','k','r','g','b','m','k','r',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','g','b','m','k','r','g','b','m','k',...
    'g','b','m','k','r','g','b','m','k','r','g','b','m','k','r','g'];

% videos setup
figure('Position',[0 100 800 800]);
v = VideoWriter('animation.avi','Motion JPEG AVI');
v.FrameRate = 24;
v.Quality = 100;
open(v);
opengl('software')

% loop over each data entry of the simout results

for j=1:5:(timesteps)
    % plot of the reference frame trajectory
    plot(xi_ref_contr.data(:,2),xi_ref_contr.data(:,3));
    hold on;
    scatter(xi_ref_contr.data(j,2),xi_ref_contr.data(j,3),80,'r','o');
    axis([-7 7 0 25]);
    xlabel('y position [m]');
    ylabel('z position [m]');
    grid on;
    hold on;
    
    % transformation of line according to virtual reference frame
    line = desired_pos_abs(xi_ref_contr.data(j,:)',line_init);
    plot(line(2,:),line(3,:),'LineWidth',4);

    % loop over each vehicle
    for i=1:1:N
        % plots the x,y-values of the actual i-th robot position
        x = vehicle_pos.data(1,i,j);
        y = vehicle_pos.data(2,i,j);
        z = vehicle_pos.data(3,i,j);
        scatter(y,z,60,c(i),'d','filled');
        
        %plots i-th robot desired position
        x_ref = des_pos.data(1,i,j);
        y_ref = des_pos.data(2,i,j);
        z_ref = des_pos.data(3,i,j);
        scatter(y_ref, z_ref,100,c(i),'*');
        
    end
    writeVideo(v,getframe);
    %     legend('ref','v1','v1_des','v2','v2_des','v3','v3_des','v4','v4_des');
    hold off;
end
close(v);