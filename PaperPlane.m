%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
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
    [t4, x4] = ode23('EqMotion',tspan, x1_gam);
    x2_gam = [V;-0.18;H;R];
    [t5, x5] = ode23('EqMotion',tspan, x2_gam);
    x3_gam = [V;-0.5;H;R];
    [t6, x6] = ode23('EqMotion',tspan, x3_gam);
    
    figure(1)
    subplot(2,1,1);
	plot(x1(:,4),x1(:,3),'r',x2(:,4),x2(:,3),'k',x3(:,4),x3(:,3),'g');
	xlabel('Range, m'), ylabel('Height, m'), grid;


    subplot(2,1,2);
	plot(x4(:,4),x4(:,3),'r',x5(:,4),x5(:,3),'k', x6(:,4),x6(:,3),'g');
	xlabel('Range, m'), ylabel('Height, m'), grid;
    
	
%	b) Oscillating Glide due to Zero Initial Flight Path Angle
	xo		=	[V;0;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);

%	c) Effect of Increased Initial Velocity
	xo		=	[1.5*V;0;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);

%	d) Effect of Further Increase in Initial Velocity
	xo		=	[3*V;0;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);
	
	figure(2)
	plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
	xlabel('Range, m'), ylabel('Height, m'), grid

	figure(3)
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


