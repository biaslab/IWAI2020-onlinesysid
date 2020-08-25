close all
clearvars
clc

%% Data

% Read from file
data = load('data/SNLS80mV.mat');

% Sampling frequency
fs = 610.35;

% Training indices
ix_trn = 40000:131072;
ix_val = 1:40000;

% Time 
time_trn = [0:(length(ix_trn)-1)]/fs;
time_val = [0:(length(ix_val)-1)]/fs;

% Split into training and validation
output_trn = data.V2(ix_trn);
input_trn = data.V1(ix_trn);
output_val = data.V2(ix_val);
input_val = data.V1(ix_val);

%% Model

load('models/sscanon_model.mat')

%% Predict

% Collect validation data
val_data = iddata(input_val', output_val', 1/fs);

% 1-step ahead predictions
predictions = predict(sscanon, val_data, 1);
pred_states = predictions.OutputData;

% Prediction error
pred_error = (output_val' - pred_states).^2;

% Save predictions
save("results_sscanon.mat", "pred_states", "pred_error");

%% Visualize

% Subsample for visualisation
ix_viz = 1:10:length(pred_states);

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

