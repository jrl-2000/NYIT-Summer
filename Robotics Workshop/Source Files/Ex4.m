%% Exercise 4

% New York Institute of Technology
% NYIT Academy Summer Camp 2018
% Author: Saverio Marsicano

% RWTH - Mindstorms NXT Toolbox: http://www.mindstorms.rwth-aachen.de

%% Verify that the RWTH - Mindstorms NXT toolbox is installed.

if verLessThan('RWTHMindstormsNXT', '3.00');
error('This program requires the RWTH - Mindstorms NXT Toolbox version 3.00 or greater. Go to http://www.mindstorms.rwth-aachen.de and follow the installation instructions!');
end %if

%% Make sure all connections are closed before new connection

COM_CloseNXT all
clear all
close all

%% Connection with the brick via USB

h = COM_OpenNXT('');
COM_SetDefaultNXT(h);


%% Open the Ultrasonic Sensor and Touch Sensors

OpenUltrasonic(SENSOR_4);
OpenSwitch(SENSOR_1);

%% take a distance reading when switch is on; do it for 5 readings

format compact; % makes display compact so there is less whitespace
for j = 1:5
switch_on = GetSwitch(SENSOR_1);
while switch_on == 0 % wait for switch to be pressed
switch_on = GetSwitch(SENSOR_1);
end; % while
distance = GetUltrasonic(SENSOR_4);
distance % display the value
pause(5); % pause make sure just one reading is taken!

% in the time before another reading is taken, measure the distance
end; % for

% Close the sound sensor.
CloseSensor(SENSOR_4);

% Close connection.
COM_CloseNXT(h);