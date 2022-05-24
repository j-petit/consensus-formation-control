function Results_1(xi_ref, xi_ref_contr, xi_i)

    % creates new figure in the right display half with 6 subplots
    scrsz = get(groot,'ScreenSize');
    result = figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)]);
    set(result, 'Name', 'Simulation Results Consensus', 'NumberTitle', 'off');

    % splits up simulation timeseries results into the different states
    time = xi_i.time;
    x_ref_i = timeseries(xi_i.data(1,:,:), time, 'Name', 'x-coordinate');
    y_ref_i = timeseries(xi_i.data(2,:,:), time, 'Name', 'y-coordinate');
    z_ref_i = timeseries(xi_i.data(3,:,:), time, 'Name', 'z-coordinate');
    alpha_ref_i = timeseries(xi_i.data(4,:,:), time, 'Name', 'theta-value');
    beta_ref_i = timeseries(xi_i.data(5,:,:), time, 'Name', 'theta-value');
    gamma_ref_i = timeseries(xi_i.data(6,:,:), time, 'Name', 'theta-value');

    subplot(3,2,1), plot(xi_ref);
    legend('x_{ref}','y_{ref}','z_{ref}','alpha_{ref}','beta_{ref}','gamma_{ref}');
    title('Plot of the reference state (leader)');
    ylabel('pos/angle in meters/rad');

    % subplot(3,2,2), plot3(xi_ref.data(:,1),xi_ref.data(:,2),xi_ref.data(:,3));
    % legend('reference trajectory');
    % title('Leader trajectory');

    subplot(3,2,2), plot(xi_ref_contr);
    legend('x_{ref}','y_{ref}','z_{ref}','alpha_{ref}','beta_{ref}','gamma_{ref}');
    title('Plot of the controlled reference state (leader)');
    ylabel('pos/angle in meters/rad');

    subplot(3,2,3), plot(x_ref_i);
    %legend('v1','v2','v3','v4', 'v5');
    title('Followers x-coordinate');
    ylabel('distance in meters');

    subplot(3,2,4), plot(y_ref_i);
    %legend('v1','v2','v3','v4', 'v5');
    title('Followers y-coordinate');
    ylabel('distance in meters');

    subplot(3,2,5), plot(z_ref_i);
    %legend('v1','v2','v3','v4', 'v5');
    title('Followers z-coordinate');
    ylabel('distance in meters');

    subplot(3,2,6), plot(alpha_ref_i);
    %legend('v1','v2','v3','v4','v5');
    title('Followers alpha-valua');
    ylabel('angle in rad');

end