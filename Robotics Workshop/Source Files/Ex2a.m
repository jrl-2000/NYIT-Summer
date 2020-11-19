%% Exercise 2 Part a

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

h = COM_OpenNXT();
COM_SetDefaultNXT(h);

%%---You must submit the all the code below this line for each exercise question---%%

%% Constants 

Distance  = 1000;        
Ports     = [MOTOR_B; MOTOR_C];  % motors
Speed     = 60;

%% action mStraight

mStraight                   = NXTMotor(Ports);
mStraight.Power             = Speed;
mStraight.TachoLimit        = Distance;

%% action mBack

mBack                   = mStraight;   %same speed and distance...
mBack.Power             = -mStraight.Power;   %but different direction

%% Need to ensure all motors are stopped initially

mStraight.Stop('off');

%% Sequence of actions
for j = 1:2;

%% first action

    mBack.SendToNXT();
    mBack.WaitFor();
    
%% second action

    mStraight.SendToNXT();
    mStraight.WaitFor();
    
    end;   
%% Shut down all motors again
mStraight.Stop('off');

%% Close connection
COM_CloseNXT(h);
