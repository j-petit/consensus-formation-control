function [r_d] = desired_pos_abs(xi_ref, r_relative)
% DESIRED_POS_ABS computes the desired absolute positions depending on the
% reference frame and the relative coordinates of the desired positions
% outputs x_d and y_d in a vector r_d
% inputs are xi_ref = [x_coordinate_frame, y_coordinate_frame,
% theta_coordinate frame] the reference frame
%
% Inputs:
%     xi_ref       - reference state
%     r_relative   - relative position vector of matrix
% Outputs:
%     r_d          - position vector in inertial system

r_d = zeros(size(r_relative));

psi = xi_ref(6);
phi = xi_ref(5);
theta = xi_ref(4);

% rotation matrix Dz
Dz = [cos(psi) -sin(psi) 0
      sin(psi)  cos(psi) 0
         0          0    1];

% rotation matrix Dy    
Dy = [cos(phi)  0   sin(phi)
         0      1      0
     -sin(phi)  0   cos(phi)];

% rotation matrix Dx
Dx = [1     0         0          
      0  cos(theta) -sin(theta)
      0  sin(theta)  cos(theta)];
  %loop over each vector in r_relative
  for i=1:1:size(r_relative,2)
      r_d(:,i) = xi_ref(1:3) + Dz*Dy*Dx*r_relative(:,i);
  end
end

