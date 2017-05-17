function [r_rel_1, r_rel_2, r_rel_3] = create_r_relative(N)
%creates three formations of n-vehicles in different shapes
%
% Inputs:
%     N - number of vehicles
% Outputs:
%     r_rel_1 - first formation here line-shape
%     r_rel_2 - second formation here parabolic-shape
%     r_rel_3 - third formation here circle-shape

% line shape
length_line = 4;
r_rel_line = [zeros(1,N); linspace(length_line/2,-length_line/2,N); zeros(1,N)];

% line shape 2
length_line_2 = 4;
r_rel_line_2 = [zeros(1,N); linspace(length_line_2/2,-length_line_2/2,N); zeros(1,N)];

% heart shape
flag = false;
r_rel_heart = zeros(3,N);
% checks if odd number of vehicles
if (mod(N,2) == 1)
    r_rel_heart(:,N) = [0;-1;0];
    N = N-1;
    flag = true;
end
for i=1:2:N
    t = 1/N*i;
    r_rel_heart(1,i) = (-3*t^2+2*t+1)*sin(t);
    r_rel_heart(2,i) = (-3*t^2+2*t+1)*cos(t)-1;
    r_rel_heart(1,i+1) = -(-3*t^2+2*t+1)*sin(t);
    r_rel_heart(2,i+1) = (-3*t^2+2*t+1)*cos(t)-1;
end
if (flag)
    N = N + 1;
end

% circle shape
r_rel_circle = zeros(3,N);
for i=1:1:N
    r_rel_circle(:,i) = [cos(2*pi/N*(i-1)); sin(2*pi/N*(i-1)); 0];
end

% parabolic shape
r_rel_parabol = zeros(3,N);
r_rel_parabol(2,:) = linspace(-1,1,N);
r_rel_parabol(1,:) = (r_rel_parabol(2,:).^2)*(-1);

% cube shape
r_rel_cube = [[0.4 0.4 -0.4]' [0.4 -0.4 -0.4]' [-0.4 0.4 -0.4]' [-0.4 -0.4 -0.4]' [0.4 0.4 0.4]' [0.4 -0.4 0.4]' [-0.4 0.4 0.4]' [-0.4 -0.4 0.4]'];

% butterfly curve
r_rel_but = zeros(3,N);
for i=1:1:N
    u = 2*pi/N*(i-1);
    r_rel_but(:,i) = [0.3*cos(u)*(exp(cos(u))-2*cos(4*u)-sin(u/12)^5); 0.3*sin(u)*(exp(cos(u))-2*cos(4*u)-sin(u/12)^5); 0];
end

r_rel_3 = r_rel_line;
r_rel_2 = r_rel_line_2;
r_rel_1 = r_rel_but;

% plot of formations
pos = figure;
scrsz = get(groot,'ScreenSize');
set(pos, 'Name', 'Relative positions2 / Formation', 'NumberTitle', 'off', 'OuterPosition',[0 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);

for i=1:1:N
    subplot(1,3,1);
    scatter3(r_rel_1(1,i), r_rel_1(2,i), r_rel_1(3,i),'o','filled');
    hold on;
    subplot(1,3,2);
    scatter3(r_rel_2(1,i), r_rel_2(2,i), r_rel_2(3,i),'o','filled');
    hold on;
    subplot(1,3,3);
    scatter3(r_rel_3(1,i), r_rel_3(2,i), r_rel_3(3,i),'o','filled');
    hold on;
end

subplot(1,3,1);
plot3(0,0,0,'x');
subplot(1,3,2);
plot3(0,0,0,'x');
subplot(1,3,3);
plot3(0,0,0,'x');
end

