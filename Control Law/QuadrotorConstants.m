function [quad_physical, m, g, f_thrust_limit_up, max_phi, max_theta, k_aer_x, k_aer_y, k_aer_z] = QuadrotorConstants()

    m = 0.45; % Mass of the Quadrotor in Kg wie Parrot Bepo
    g = 9.81; % Gravitational acceleration
    k_aer_z = 0.2; % drag constant in z direction
    k_aer_x = 0.1; % drag constant in xy-plane
    k_aer_y = 0.1; % drag constant in xy-plane
    z_dot_limit_up = 3; % terminal velocity in z-direction
    f_thrust_limit_up = m*g+z_dot_limit_up^2*k_aer_z*m;
    max_theta = 0.05;
    max_phi = 0.05;

    quad_physical = [m g k_aer_z k_aer_x k_aer_y f_thrust_limit_up max_theta max_phi];
end