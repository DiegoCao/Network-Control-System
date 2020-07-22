function actuator_init

% Initialize TrueTime kernel
ttInitKernel('prioDM');   % deadline-monotonic scheduling

% Sporadic actuator task, activated by arriving network message
deadline = 10.0;
ttCreateTask('actuator_task', deadline, 'actuator_code');
ttAttachNetworkHandler('actuator_task')