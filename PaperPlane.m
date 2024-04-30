%%  AEM 3103 Final Project, Zachary Elliott & Wesley Girardi
%	Copyright 2005 by Robert Stengel
%	August 23, 2005


	
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
    [V Gam H R] = setup_sim();
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R]; 
	[ta,xa]	=	ode23('EqMotion',tspan,xo);


%   2) changing initial velocity and initial flight path angle
    x1_v = [2;Gam;H;R];
    [t1,x1] = ode23('EqMotion',tspan,x1_v);
    x2_v = [3.55;Gam;H;R];
    [t2,x2] = ode23('EqMotion',tspan,x2_v);
    x3_v = [7.5;Gam;H;R];
    [t3, x3] = ode23('EqMotion',tspan,x3_v);

    x1_gam = [V;-0.5;H;R];
    [t4,x4] = ode23('EqMotion',tspan, x1_gam);
    x2_gam = [V;-0.18;H;R];
    [t5, x5] = ode23('EqMotion',tspan, x2_gam);
    x3_gam = [V;0.4;H;R];
    [t6, x6] = ode23('EqMotion',tspan, x3_gam);
    
    figure(1)
    subplot(2,1,1);
	plot(x1(:,4),x1(:,3),'r',x2(:,4),x2(:,3),'k',x3(:,4),x3(:,3),'g');
	xlabel('Range, m'), ylabel('Height, m'), grid, title('Changing Initial Velocity');


    subplot(2,1,2);
	plot(x4(:,4),x4(:,3),'r',x5(:,4),x5(:,3),'k', x6(:,4),x6(:,3),'g');
	xlabel('Range, m'), ylabel('Height, m'), grid, title('Changing Initial Flight Path Angle');


%   3) Creating 100 random trials
    H_tot = zeros(100,100);
    R_tot = zeros(100,100);
    for i=1:100
        Vmin = 2; Vmax = 7.5; Gmin = -0.5; Gmax = 0.4;
        V_rand = Vmin + (Vmax-Vmin)*rand(1);
        Gam_rand = Gmin + (Gmax-Gmin)*rand(1);
        tspan4 = 0:6/99:6;

        x_rand = [V_rand; Gam_rand; H; R];

        [t_rand,xRand] = ode23('EqMotion',tspan4,x_rand);
        figure(2)
        plot(xRand(:,4),xRand(:,3));
        hold on;
        xlabel('Range, m'); ylabel('Height, m');

        
        
        H_tot(i,:) = xRand(:,3)';
        R_tot(i,:) = xRand(:,4)';

        
    end
    %4) Creating graphs using polyfit of the average trajectories, Time vs
    % Height and Range
    figure(3)
    R_mean = mean(R_tot);
    H_mean = mean(H_tot);
    plot(tspan4,H_mean,'Marker','*');
    xlabel('Time, s'); ylabel('Height, m');
    % Polyfit for our time versus height
    ph = polyfit(tspan4, H_mean, 11);
    yh = polyval(ph, tspan4);
    hold on;
    plot(tspan4, yh, "LineWidth", 2)

    figure(4)
    plot(tspan4,R_mean, 'Marker','*');
    xlabel('Time, s'); ylabel('Range, m');
    % Polyfit for our time versus range
    pr = polyfit(tspan4, R_mean, 1);
    yr = polyval(pr, tspan4);
    hold on;
    plot(tspan4,yr, "LineWidth", 2)
	


    % 5) Time derivatives of these trajectories with plots
    dh_dt = diff(yh);
    dr_dt = diff(yr);
    dh_dtG =gradient(yh); dr_dtG = gradient(yr);
    figure(5)
    subplot(2,1,1)
    plot(tspan4, dh_dtG, "LineWidth", 2)
    xlabel('Time, s'), ylabel('Change in Height, m/s'), grid, title('Derivative of Height WRT');
    subplot(2,1,2)
    plot(tspan4, dr_dtG, "LineWidth", 2)
    xlabel('Time, s'), ylabel('Change in Range, m/s'), grid, title('Derivative of Range WRT');

%	b) Oscillating Glide due to Zero Initial Flight Path Angle
	xo		=	[V;0;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);

%	c) Effect of Increased Initial Velocity
	xo		=	[1.5*V;0;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);

%	d) Effect of Further Increase in Initial Velocity
	xo		=	[3*V;0;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);
	
	figure(6)
	plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
	xlabel('Range, m'), ylabel('Height, m'), grid

	figure(7)
	subplot(2,2,1)
	plot(ta,xa(:,1),tb,xb(:,1),tc,xc(:,1),td,xd(:,1))
	xlabel('Time, s'), ylabel('Velocity, m/s'), grid
	subplot(2,2,2)
	plot(ta,xa(:,2),tb,xb(:,2),tc,xc(:,2),td,xd(:,2))
	xlabel('Time, s'), ylabel('Flight Path Angle, rad'), grid
	subplot(2,2,3)
	plot(ta,xa(:,3),tb,xb(:,3),tc,xc(:,3),td,xd(:,3))
	xlabel('Time, s'), ylabel('Altitude, m'), grid
	subplot(2,2,4)
	plot(ta,xa(:,4),tb,xb(:,4),tc,xc(:,4),td,xd(:,4))
	xlabel('Time, s'), ylabel('Range, m'), grid


