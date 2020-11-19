%% Exercise 3

% New York Institute of Technology
% NYIT Academy Summer Camp 2018
% Author: Saverio Marsicano

% RWTH - Mindstorms NXT Toolbox: http://www.mindstorms.rwth-aachen.de

%% Verify that the RWTH - Mindstorms NXT toolbox is installed.
if verLessThan('RWTHMindstormsNXT', '3.00');
    error('This program requires the RWTH - Mindstorms NXT Toolbox version 3.00 or greater. Go to http://www.mindstorms.rwth-aachen.de and follow the installation instructions!');
end%if

%% Make sure all connections are closed before new connection
COM_CloseNXT all
clear all
close all

%% Connection with the brick via USB
h = COM_OpenNXT('');
COM_SetDefaultNXT(h);

%% Open the sound sensor 
OpenSwitch(SENSOR_1);

%% Let's take some readings

T = GetSwitch(SENSOR_1, h);  %let S = sound value in dB

%% takes a sound reading every second for 10 times

for j = 1:10

T = GetSwitch(SENSOR_1, h)  %prints value of S on Matlab screen
pause(1);    %pause for 1 second

end

% Close the sound sensor. 
CloseSensor(SENSOR_1);

% Close Bluetooth connection. 
COM_CloseNXT(h);