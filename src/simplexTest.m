%%                        Optimization Package
%                    Simplex Method for LP problems
%  _______________________________________________________________________
%                            Developed by
%                           SHAHROKH SHAHI
%  -----------------------------------------------------------------------
%  Homepage: www.sshahi.com
%  Email: shahi@gatech.edu
%  
%% Initializing
clc
clear

%% Inputs: (HW3/Problem3)

number_of_DVs = 4; 

initial_tableau =[ ...
       2   1   1   1  1  0  0  0   0  16
       1   1   2  -1  0  1  0  0   0  8
       0   1   0  -1  0  0  1  0   0  6
       2  -1   0   0  0  0  0  1   0  7
      -4  -5  -4  -2  0  0  0  0  -1  0];

%% Function Call

[x, fval] = simplex (initial_tableau , number_of_DVs, 1, 0.5)