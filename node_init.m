function node_init(arg)
ttInitKernel('prioFP')
% Create task data
data.MPn = 0;
data.MIn = 0;
data.MDn = 0;
data.MX = 0;
data.h = 0.010;
data.K = 1.2;
data.Ti = 1.1;
data.Td = 0.4;
data.yold = 0;
data.u = 0;
% Periodic controller task
period = 0.01;
ttCreatePeriodicTask('controller_task', period, 'controller_code', data);