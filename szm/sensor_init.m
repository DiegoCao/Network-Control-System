function sensor_init

% Distributed control system: sensor node
%
% Samples the plant periodically and sends the samples to the 
% controller node. Actuates controls sent from controller.

% Initialize TrueTime kernel
ttInitKernel('prioDM');   % deadline-monotonic scheduling

% Periodic sensor task
starttime = 0.0;
period = 0.010; %采样周期
ttCreatePeriodicTask('sensor_task', starttime, period, 'sensor_code');
