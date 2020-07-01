function [exectime, data] = controller_code(seg, data)
switch seg
case 1
 y = ttGetMsg; % Obtain sensor value
if isempty(y)
 disp('Error in controller: no message received!');
 y = 0.0;
end
 r = ttAnalogIn(1); % Read reference value
 data.MPn = data.K * (r - y);
 data.MIn = data.K * data.h/data.Ti * (r - y) + data.MX;
 data.MDn = data.K * data.Td/data.h * (data.yold - y);
 data.u = data.MPn + data.MIn + data.MDn;
 data.MX = data.MIn;
 data.yold = y;
 exectime = 0.0005;
case 2
 ttSendMsg(2, data.u, 100); % Send the value to the actuator
 exectime = -1; % finished
end