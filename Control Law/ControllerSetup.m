function [xi_init, r_init, r_rel_1, r_rel_2, r_rel_3] = ControllerSetup(N)

    % init of reference frame values
    xi_init = zeros(6, N);
    
    % circle start formation of vehicles around the center
    % r_init = zeros(3,N);
    % for i=1:1:N
    %     r_init(:,i) = [cos(2*pi/N*(i-1)); sin(2*pi/N*(i-1)); 0];
    % end

    % desired relative position / formation around virtual center
    [r_rel_1, r_rel_2, r_rel_3] = create_r_relative(N);
    r_init = r_rel_3;

end