transferFuncDataPoints = [-1.34 -1.22 -1.1;
                          20    15   9]; %A 2d array with datapoints about the transfer function.
             % Voltage  Gain(dB)  Used to calculate the transfer function
             %To make the transfer function more accurate, take more
             %measurements of the graph "Gain vs Control Voltage" on
             %datasheet
%Peform Linear Regression using the noted date points to create the
%transfer function
regressionX = transferFuncDataPoints(1,:);
regressionY = transferFuncDataPoints(2,:);
mdl = fitlm(regressionX, regressionY);

%Extracted coefficients in the form y=mx+b
m = mdl.Coefficients{2, 1}; %Has units of dB/V
b = mdl.Coefficients{1, 1}; %Has units of dB
fprintf("The regression is calcualted to be y = %fx + %f\n", m, b);

%The linear regression transfer function represents the Analog Variable
%Gain Amplifier. The regression will match the control voltage to its
%corresponding gain (dB). Thus, we will pass the equation into the transfer
%function.
transferFunctionGain = m * messageWave + b;