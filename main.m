clc
clear all
close all

%% M matrix
M = [1,0,0,0;
     0,1,0,1;
     0,0,1,1;
     0,0,0,1];
 
%% S matrix
% For 1st joint
S1 = [0;0;1;0;0;0];

% For 2nd Joint
S2 = [1;0;0;0;0.25;0];

% For 3rd Joint
S3 = [0;0;0;0;1;0];

S = [S1,S2,S3];

%% Joint Angles
q = [1, 1, 1];

%% FK Calculation
FK = FK(M,S,q)

%% Jacobian Calculation
T = Jac(S,q)

%% Visualization
for i = [-pi:0.01:pi]
    visualization([i,0,1])
end


