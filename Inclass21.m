%In class 21

%GB comments
1 80 I could not get your script to work correctly until I changed a few things.  For reference:
k = 2;
d = 2;
k2 = 3; 
d2 = 3;
 
rhs = @(t,x) [2-2*x(1); 3*x(1) - 3*x(2)];
sol = ode23(rhs, [0 10], [0, 0]);
plot(sol.x, sol.y(1, :), 'r.-'); hold on;
plot(sol.x, sol.y(2, :), 'b.-');
legend({'x', 'y'});

2 80 Graphs should not be periodic. 
overall 80


% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

close all;
clear all;
clc;

k=1;
d=1;
k2=5;
d2=3;
dt=0.01;
interval= [0 100];

rhs=@(t, x) 1 - x;
rhs2=@(x, y) 1*x - 1*y;

nstep = (interval(2)-interval(1))/dt;
solx(1) = 0;
soly(1) = 0;
for ii = 2:nstep
    solx(ii) = solx(ii-1) + rhs(solx(ii-1),k,d)*dt;
    soly(ii) = soly(ii-1) + rhs2(solx(ii-1),soly(ii-1),k,d)*dt;
end

tt=linspace(interval(1),interval(2),nstep);
hold on;
plot(tt,solx,'g.-');
plot(tt,soly,'r.-');
hold off;

% the two graphs appear to converge as the interval increases.

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 


dt=0.01;
interval= [0 100];
nstep = (interval(2)-interval(1))/dt;
solx(1) = 0;
soly(1) = 1;
for ii = 2:nstep
    solx(ii) = solx(ii-1) + lhs(soly(ii-1))*dt;
    soly(ii) = soly(ii-1) + lhs2(solx(ii-1),soly(ii-1))*dt;
end

tt=linspace(interval(1),interval(2),nstep);
hold on;
plot(tt,solx,'b.-');
plot(tt,soly,'y.-');
hold off;

% the pattern of the graph is periodic in nature.

