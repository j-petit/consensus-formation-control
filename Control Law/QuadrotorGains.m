function [Gains, kpp, kdp, kpt, kdt, kpps, kdps, kpz, kdz] = QuadrotorGains()

    % Inner altitude and angle PD controller gains
    kpp = 100;
    kdp = 15;
    kpt = 100;
    kdt = 15;
    kpps = 100;
    kdps = 15;
    kpz = 100;
    kdz = 20;

    % Quadrotor Gains
    Gains = [kpp kdp kpt kdt kpps kdps kpz kdz];

end