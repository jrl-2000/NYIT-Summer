%% Exercise 1

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

%% Constants 

Distance  = 2000;        
Ports     = [MOTOR_B; MOTOR_C; MOTOR_A];  % the 2 motors
Speed     = 30;

%% set various parameters for the object mStraight

mStraight                   = NXTMotor(Ports); %use motors specified in Ports under Constants
mStraight.Power             = Speed; %use Speed specified under Constants
mStraight.TachoLimit        = Distance; %use Distance specified under Constants

%% Need to ensure all motors are stopped initially

mStraight.Stop('off');

%% Sequence of actions 

    mStraight.SendToNXT();  %sends action mStraight to the NXT brick
    mStraight.WaitFor();    %wait for next command 
    
    
%% Shut down all motors again

mStraight.Stop('off');

%% Close connection

COM_CloseNXT(h);
