close all
clearvars
clc

%% Data

% Read from file
data = load('data/SNLS80mV.mat');

% Sampling frequency
fs = 610.35;

% Training indices
split = 40100;
ix_trn = split+1:131072;
ix_val = 1:split;

% Time 
time_trn = [0:(length(ix_trn)-1)]/fs;
time_val = [0:(length(ix_val)-1)]/fs;

% Split into training and validation
output_trn = data.V2(ix_trn);
input_trn = data.V1(ix_trn);
output_val = data.V2(ix_val);
input_val = data.V1(ix_val);


%% Model

% Nonlinear ARX model of 2 previous observations and no delayed input
load('models/narx_sigmoidnet4.mat')

%% Predict

% Map training data to inital states
xf = data2state(narx_sigmoidnet4, iddata(output_val(1:2)', input_val(1:2)', 1/fs));

% Set starting values 
opt = simOptions('InitialCondition', xf);

% Collect validation data
val_data = iddata([], input_val(3:end)', 1/fs);

% Simulate systems
predictions = sim(narx_sigmoidnet4, val_data, opt);
pred_states = [0; 0; predictions.OutputData];

% Prediction error
pred_error = (output_val' - pred_states).^2;

% Save predictions
save("results/results_narx_sigmoidnet4_simulation.mat", "pred_states", "pred_error");

%% Visualize

% Subsample for visualisation
ss = 40;
ix_viz = 1:ss:length(pred_states);

% Plot validation data and predictions
figure; hold on;
plot(output_val(ix_viz)', 'red')
plot(pred_states(ix_viz), 'blue')
xlabel("time (t)");
legend('true', 'predictions')
set(gcf, 'Color', 'w');

% Plot prediction error
figure; hold on;
scatter(ix_viz, pred_error(ix_viz), '.', 'k')
xlabel("time (t)");
ylabel("error");
set(gca, 'YScale', 'log')
set(gcf, 'Color', 'w');

